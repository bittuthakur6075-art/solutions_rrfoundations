<?php
/**
 * RR FOUNDATIONS — ADMIN AUTHENTICATION API
 * Actions: login, me, logout, change-password
 */

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'config.php';

$action = $_GET['action'] ?? $_POST['action'] ?? 'me';
$db = getDbConnection();

switch ($action) {
    case 'login':
        $payload = getJsonPayload();
        $email = trim(filter_var($payload['email'] ?? '', FILTER_SANITIZE_EMAIL));
        $password = (string)($payload['password'] ?? '');

        if (empty($email) || empty($password)) {
            jsonError('Email and password are required', 400);
        }

        if (!$db) {
            jsonError('Database connection unavailable. Please check private configuration.', 500);
        }

        // Check if any admin exists at all; if none, prompt setup
        $countStmt = $db->query("SELECT COUNT(*) as cnt FROM admins");
        $adminCount = (int)($countStmt->fetch()['cnt'] ?? 0);
        if ($adminCount === 0) {
            jsonError('No administrator account found. Please run the one-time initial setup.', 404, ['need_setup' => true]);
        }

        // Fetch admin record
        $stmt = $db->prepare("SELECT * FROM admins WHERE email = ? LIMIT 1");
        $stmt->execute([$email]);
        $admin = $stmt->fetch();

        $now = date('Y-m-d H:i:s');

        // Check brute-force lockout
        if ($admin && !empty($admin['lockout_until']) && strtotime($admin['lockout_until']) > time()) {
            $remaining = ceil((strtotime($admin['lockout_until']) - time()) / 60);
            jsonError("Account is temporarily locked due to excessive failed attempts. Please try again in {$remaining} minutes.", 429);
        }

        // Verify password
        if (!$admin || !password_verify($password, $admin['password_hash'])) {
            if ($admin) {
                $failed = (int)$admin['failed_login_attempts'] + 1;
                $lockout = null;
                if ($failed >= 5) {
                    $lockout = date('Y-m-d H:i:s', time() + (15 * 60)); // 15 min lockout
                }
                $updateStmt = $db->prepare("UPDATE admins SET failed_login_attempts = ?, lockout_until = ? WHERE id = ?");
                $updateStmt->execute([$failed, $lockout, $admin['id']]);
            }
            logAdminActivity($admin['id'] ?? null, $admin['full_name'] ?? $email, 'failed_login', 'auth', null, 'Failed login attempt for ' . $email);
            jsonError('Invalid email or password', 401);
        }

        if ($admin['status'] !== 'active') {
            jsonError('Account is currently inactive or suspended. Contact superadmin.', 403);
        }

        // Login success: Reset failed attempts and update last login
        session_regenerate_id(true);
        $_SESSION['admin_id'] = $admin['id'];
        $_SESSION['admin_email'] = $admin['email'];
        $_SESSION['admin_name'] = $admin['full_name'];
        $_SESSION['admin_role'] = $admin['role'];

        $csrfToken = getCsrfToken();

        $updateStmt = $db->prepare("UPDATE admins SET failed_login_attempts = 0, lockout_until = NULL, last_login_at = ?, last_login_ip = ? WHERE id = ?");
        $updateStmt->execute([$now, $_SERVER['REMOTE_ADDR'] ?? '', $admin['id']]);

        logAdminActivity($admin['id'], $admin['full_name'], 'login', 'auth', (string)$admin['id'], 'Admin logged in successfully');

        jsonResponse([
            'success' => true,
            'user' => [
                'id' => $admin['id'],
                'email' => $admin['email'],
                'fullName' => $admin['full_name'],
                'role' => $admin['role']
            ],
            'csrfToken' => $csrfToken
        ]);
        break;

    case 'me':
        if (empty($_SESSION['admin_id'])) {
            jsonError('Not authenticated', 401);
        }
        $admin = requireAdminAuth();
        jsonResponse([
            'success' => true,
            'user' => [
                'id' => $admin['id'],
                'email' => $admin['email'],
                'fullName' => $admin['full_name'],
                'role' => $admin['role']
            ],
            'csrfToken' => getCsrfToken()
        ]);
        break;

    case 'logout':
        $adminId = $_SESSION['admin_id'] ?? null;
        $adminName = $_SESSION['admin_name'] ?? null;
        if ($adminId) {
            logAdminActivity($adminId, $adminName, 'logout', 'auth', (string)$adminId, 'Admin logged out');
        }
        $_SESSION = [];
        if (ini_get("session.use_cookies")) {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000,
                $params["path"], $params["domain"],
                $params["secure"], $params["httponly"]
            );
        }
        session_destroy();
        jsonResponse(['success' => true, 'message' => 'Logged out successfully']);
        break;

    case 'change-password':
        $admin = requireAdminAuth();
        verifyCsrfToken();

        $payload = getJsonPayload();
        $currentPass = (string)($payload['currentPassword'] ?? '');
        $newPass = (string)($payload['newPassword'] ?? '');

        if (mb_strlen($newPass) < 8) {
            jsonError('New password must be at least 8 characters', 400);
        }

        if (!$db) {
            jsonError('Database connection unavailable', 500);
        }

        $stmt = $db->prepare("SELECT password_hash FROM admins WHERE id = ?");
        $stmt->execute([$admin['id']]);
        $row = $stmt->fetch();

        if (!$row || !password_verify($currentPass, $row['password_hash'])) {
            jsonError('Incorrect current password', 400);
        }

        $newHash = password_hash($newPass, PASSWORD_BCRYPT, ['cost' => 12]);
        $up = $db->prepare("UPDATE admins SET password_hash = ? WHERE id = ?");
        $up->execute([$newHash, $admin['id']]);

        logAdminActivity($admin['id'], $admin['full_name'], 'change_password', 'admins', (string)$admin['id'], 'Admin updated password');
        jsonResponse(['success' => true, 'message' => 'Password updated successfully']);
        break;

    default:
        jsonError('Invalid auth action', 400);
}
