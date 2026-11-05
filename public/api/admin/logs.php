<?php
/**
 * RR FOUNDATIONS — ADMIN ACTIVITY AUDIT LOG API
 * Displays administrative trails, security logins, and entity changes.
 */

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'config.php';
$admin = requireAdminAuth();
$db = getDbConnection();

if (!$db) {
    jsonError('Database connection unavailable', 500);
}

$page = max(1, (int)($_GET['page'] ?? 1));
$limit = min(100, max(10, (int)($_GET['limit'] ?? 30)));
$offset = ($page - 1) * $limit;
$search = trim($_GET['search'] ?? '');
$entity = trim($_GET['entity'] ?? '');

$where = ["1=1"];
$params = [];

if (!empty($search)) {
    $where[] = "(action LIKE ? OR admin_name LIKE ? OR details LIKE ?)";
    $term = "%{$search}%";
    $params = [$term, $term, $term];
}

if (!empty($entity) && $entity !== 'all') {
    $where[] = "entity_type = ?";
    $params[] = $entity;
}

$whereClause = implode(' AND ', $where);

$countStmt = $db->prepare("SELECT COUNT(*) as total FROM activity_logs WHERE $whereClause");
$countStmt->execute($params);
$total = (int)($countStmt->fetch()['total'] ?? 0);

$stmt = $db->prepare("
    SELECT id, admin_id, admin_name, action, entity_type, entity_id, details, ip_address, created_at
    FROM activity_logs
    WHERE $whereClause
    ORDER BY created_at DESC
    LIMIT $limit OFFSET $offset
");
$stmt->execute($params);
$logs = $stmt->fetchAll();

jsonResponse([
    'success' => true,
    'logs' => $logs,
    'pagination' => [
        'total'      => $total,
        'page'       => $page,
        'limit'      => $limit,
        'totalPages' => ceil($total / $limit)
    ]
]);
