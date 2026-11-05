<?php
/**
 * RR FOUNDATIONS — CORE BACKEND BOOTSTRAP & SECURITY LAYER
 * Hostinger Production Ready (PHP 8.x + MySQL PDO)
 */

// 1. Strict Error Handling: Never expose server traces to client
error_reporting(0);
ini_set('display_errors', '0');
ini_set('log_errors', '1');

// 2. Security Headers & CORS Defaults
$origin = $_SERVER['HTTP_ORIGIN'] ?? '*';
header("Access-Control-Allow-Origin: $origin");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With, X-CSRF-Token");
header("Content-Type: application/json; charset=UTF-8");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: SAMEORIGIN");
header("Referrer-Policy: strict-origin-when-cross-origin");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// 3. Secure PHP Session Initialization
if (session_status() === PHP_SESSION_NONE) {
    $isHttps = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') 
            || (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https')
            || (!empty($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == 443);

    session_set_cookie_params([
        'lifetime' => 86400 * 7, // 7 days sliding
        'path'     => '/',
        'domain'   => '',
        'secure'   => $isHttps,
        'httponly' => true,
        'samesite' => 'Strict'
    ]);

    session_name('rrf_admin_session');
    session_start();
}

// 4. Locate Private Configuration (strictly outside public_html if available)
function getPrivateConfig(): array {
    static $config = null;
    if ($config !== null) {
        return $config;
    }

    $candidates = [
        dirname(__DIR__, 2) . DIRECTORY_SEPARATOR . 'private_config' . DIRECTORY_SEPARATOR . 'db_config.php',
        dirname(__DIR__, 3) . DIRECTORY_SEPARATOR . 'private_config' . DIRECTORY_SEPARATOR . 'db_config.php',
        dirname(__DIR__, 1) . DIRECTORY_SEPARATOR . 'private_config' . DIRECTORY_SEPARATOR . 'db_config.php',
    ];

    foreach ($candidates as $file) {
        if (file_exists($file)) {
            $loaded = include $file;
            if (is_array($loaded)) {
                $config = $loaded;
                return $config;
            }
        }
    }

    // Default fallback to environment variables
    $config = [
        'db_host'      => getenv('DB_HOST') ?: 'localhost',
        'db_name'      => getenv('DB_NAME') ?: 'u123456789_rrf_admin',
        'db_user'      => getenv('DB_USER') ?: 'u123456789_rrf_user',
        'db_pass'      => getenv('DB_PASS') ?: '',
        'db_charset'   => 'utf8mb4',
        'app_env'      => getenv('APP_ENV') ?: 'production',
        'session_name' => 'rrf_session',
        'session_key'  => getenv('SESSION_KEY') ?: 'rrf_secure_default_key_change_in_prod',
        'admin_email'  => 'help@rrfoundation.org'
    ];
    return $config;
}

// 5. Database Connection (PDO Singleton)
function getDbConnection(): ?PDO {
    static $pdo = null;
    if ($pdo !== null) {
        return $pdo;
    }

    $cfg = getPrivateConfig();
    $dsn = "mysql:host={$cfg['db_host']};dbname={$cfg['db_name']};charset={$cfg['db_charset']}";
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];

    try {
        $pdo = new PDO($dsn, $cfg['db_user'], $cfg['db_pass'], $options);
        return $pdo;
    } catch (PDOException $e) {
        error_log("DATABASE CONNECTION ERROR: " . $e->getMessage());
        return null;
    }
}

// 6. JSON Response Helpers
function jsonResponse($data, int $statusCode = 200): void {
    http_response_code($statusCode);
    echo json_encode($data, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
    exit;
}

function jsonError(string $message, int $statusCode = 400, array $errors = []): void {
    http_response_code($statusCode);
    echo json_encode([
        'success' => false,
        'message' => $message,
        'errors'  => $errors
    ], JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
    exit;
}

function getJsonPayload(): array {
    $raw = file_get_contents('php://input');
    if (empty($raw)) return [];
    $data = json_decode($raw, true);
    return is_array($data) ? $data : [];
}

// 7. CSRF Token Generation & Verification
function getCsrfToken(): string {
    if (empty($_SESSION['csrf_token'])) {
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf_token'];
}

function verifyCsrfToken(): void {
    // Only check for state-altering verbs
    $method = $_SERVER['REQUEST_METHOD'] ?? 'GET';
    if (in_array($method, ['GET', 'HEAD', 'OPTIONS'])) {
        return;
    }

    $token = $_SERVER['HTTP_X_CSRF_TOKEN'] ?? $_POST['csrf_token'] ?? '';
    if (empty($token) || empty($_SESSION['csrf_token']) || !hash_equals($_SESSION['csrf_token'], $token)) {
        jsonError('Invalid or missing CSRF token', 403);
    }
}

// 8. Authentication Guard
function requireAdminAuth(): array {
    if (empty($_SESSION['admin_id'])) {
        jsonError('Unauthorized. Please log in to continue.', 401);
    }

    $db = getDbConnection();
    if (!$db) {
        // Fallback for mock/local setup when DB connection is not configured yet
        return [
            'id'    => $_SESSION['admin_id'] ?? 1,
            'email' => $_SESSION['admin_email'] ?? 'admin@rrfoundations.org',
            'name'  => $_SESSION['admin_name'] ?? 'System Administrator',
            'role'  => $_SESSION['admin_role'] ?? 'superadmin'
        ];
    }

    $stmt = $db->prepare("SELECT id, email, full_name, role, status FROM admins WHERE id = ? LIMIT 1");
    $stmt->execute([$_SESSION['admin_id']]);
    $admin = $stmt->fetch();

    if (!$admin || $admin['status'] !== 'active') {
        unset($_SESSION['admin_id']);
        session_destroy();
        jsonError('Admin account is inactive or revoked.', 401);
    }

    return $admin;
}

// 9. Activity Logging Helper
function logAdminActivity(?int $adminId, ?string $adminName, string $action, string $entityType, ?string $entityId = null, ?string $details = null): void {
    $db = getDbConnection();
    if (!$db) return;

    try {
        $stmt = $db->prepare("INSERT INTO activity_logs (admin_id, admin_name, action, entity_type, entity_id, details, ip_address, user_agent) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $ip = $_SERVER['REMOTE_ADDR'] ?? null;
        $ua = substr($_SERVER['HTTP_USER_AGENT'] ?? '', 0, 500);
        $stmt->execute([$adminId, $adminName, $action, $entityType, $entityId, $details, $ip, $ua]);
    } catch (Exception $e) {
        error_log("Failed to log activity: " . $e->getMessage());
    }
}
