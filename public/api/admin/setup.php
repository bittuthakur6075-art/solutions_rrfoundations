<?php
/**
 * RR FOUNDATIONS — INITIAL SUPERADMIN SETUP CONTROLLER
 * Self-locking, one-time execution endpoint.
 */

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'config.php';

$lockFile = dirname(__DIR__, 2) . DIRECTORY_SEPARATOR . 'private_config' . DIRECTORY_SEPARATOR . 'setup.lock';
if (file_exists($lockFile)) {
    jsonError('Setup is permanently locked. To reconfigure, remove setup.lock manually from private_config.', 403);
}

$db = getDbConnection();
if (!$db) {
    jsonError('Database connection unavailable. Verify private_config/db_config.php credentials first.', 500);
}

// Check if any admin already exists
$stmt = $db->query("SELECT COUNT(*) as cnt FROM admins");
$count = (int)($stmt->fetch()['cnt'] ?? 0);
if ($count > 0) {
    @file_put_contents($lockFile, date('c') . " - Locked due to existing admin accounts.\n");
    jsonError('Setup already completed. Administrators exist in the system.', 403);
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    jsonResponse([
        'ready' => true,
        'message' => 'System is ready for initial administrator setup.'
    ]);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $payload = getJsonPayload();
    $fullName = trim($payload['fullName'] ?? 'Super Administrator');
    $email    = trim(filter_var($payload['email'] ?? '', FILTER_SANITIZE_EMAIL));
    $password = (string)($payload['password'] ?? '');

    $errors = [];
    if (mb_strlen($fullName) < 3) $errors[] = "Full name must be at least 3 characters.";
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) $errors[] = "Valid email address is required.";
    if (mb_strlen($password) < 8) $errors[] = "Password must be at least 8 characters.";

    if (!empty($errors)) {
        jsonError('Validation failed', 400, $errors);
    }

    $hash = password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);
    $ins = $db->prepare("INSERT INTO admins (email, password_hash, full_name, role, status) VALUES (?, ?, ?, 'superadmin', 'active')");
    $ins->execute([$email, $hash, $fullName]);
    $newId = (int)$db->lastInsertId();

    @file_put_contents($lockFile, date('c') . " - Superadmin created: {$email} (ID: {$newId})\n");

    logAdminActivity($newId, $fullName, 'initial_setup', 'admins', (string)$newId, "Initial superadmin created: {$email}");

    jsonResponse([
        'success' => true,
        'message' => 'Superadmin account initialized successfully. Please log in.',
        'email'   => $email
    ]);
}
