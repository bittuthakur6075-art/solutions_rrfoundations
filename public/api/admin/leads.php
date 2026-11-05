<?php
/**
 * RR FOUNDATIONS — LEAD & ENQUIRY MANAGEMENT API
 * B2B CRM, Status Workflow, Internal Notes, Activity Logs & CSV Export
 */

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'config.php';
$admin = requireAdminAuth();
$db = getDbConnection();

if (!$db) {
    jsonError('Database connection unavailable', 500);
}

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

// 1. Export Leads to CSV
if ($method === 'GET' && $action === 'export') {
    header('Content-Type: text/csv; charset=UTF-8');
    header('Content-Disposition: attachment; filename="rrfoundations_leads_' . date('Y-m-d') . '.csv"');

    $out = fopen('php://output', 'w');
    fputs($out, "\xEF\xBB\xBF");
    fputcsv($out, ['Lead ID', 'Full Name', 'Company Name', 'Email', 'Phone', 'Product', 'Category', 'Quantity', 'Status', 'Starred', 'Created At', 'Message']);

    $stmt = $db->query("SELECT id, full_name, company_name, email, phone, product_name, category, quantity, status, is_starred, created_at, message FROM leads ORDER BY created_at DESC");
    while ($row = $stmt->fetch()) {
        fputcsv($out, [
            $row['id'],
            $row['full_name'],
            $row['company_name'] ?: 'N/A',
            $row['email'],
            $row['phone'],
            $row['product_name'] ?: 'General',
            $row['category'] ?: 'General',
            $row['quantity'] ?: 'Unspecified',
            $row['status'],
            $row['is_starred'] ? 'Yes' : 'No',
            $row['created_at'],
            $row['message']
        ]);
    }
    fclose($out);
    exit;
}

// 2. Add Internal Note to Lead
if ($method === 'POST' && $action === 'add-note') {
    verifyCsrfToken();
    $payload = getJsonPayload();
    $leadId = trim($payload['leadId'] ?? '');
    $noteText = trim($payload['note'] ?? '');

    if (empty($leadId) || empty($noteText)) {
        jsonError('Lead ID and note content are required', 400);
    }

    $leadCheck = $db->prepare("SELECT id FROM leads WHERE id = ?");
    $leadCheck->execute([$leadId]);
    if (!$leadCheck->fetch()) {
        jsonError('Lead not found', 404);
    }

    $stmt = $db->prepare("INSERT INTO lead_notes (lead_id, admin_id, admin_name, note) VALUES (?, ?, ?, ?)");
    $stmt->execute([$leadId, $admin['id'], $admin['full_name'], $noteText]);
    $noteId = (int)$db->lastInsertId();

    // Record activity
    $act = $db->prepare("INSERT INTO lead_activity (lead_id, admin_id, action, details) VALUES (?, ?, 'note_added', ?)");
    $act->execute([$leadId, $admin['id'], "Added internal note: " . mb_substr($noteText, 0, 50)]);

    jsonResponse(['success' => true, 'noteId' => $noteId, 'message' => 'Note added successfully']);
}

// 3. GET: Single Lead or Filtered List
if ($method === 'GET') {
    $id = $_GET['id'] ?? null;
    if ($id) {
        $stmt = $db->prepare("SELECT * FROM leads WHERE id = ? LIMIT 1");
        $stmt->execute([$id]);
        $lead = $stmt->fetch();
        if (!$lead) jsonError('Lead not found', 404);

        $lead['is_starred'] = (bool)$lead['is_starred'];

        // Fetch Notes
        $notesStmt = $db->prepare("SELECT * FROM lead_notes WHERE lead_id = ? ORDER BY created_at DESC");
        $notesStmt->execute([$id]);
        $lead['notes'] = $notesStmt->fetchAll();

        // Fetch Activity
        $actStmt = $db->prepare("
            SELECT la.*, a.full_name as admin_name
            FROM lead_activity la
            LEFT JOIN admins a ON a.id = la.admin_id
            WHERE la.lead_id = ?
            ORDER BY la.created_at DESC
        ");
        $actStmt->execute([$id]);
        $lead['activities'] = $actStmt->fetchAll();

        jsonResponse(['success' => true, 'lead' => $lead]);
    }

    // List with filters
    $search = trim($_GET['search'] ?? '');
    $status = trim($_GET['status'] ?? '');
    $category = trim($_GET['category'] ?? '');
    $page = max(1, (int)($_GET['page'] ?? 1));
    $limit = min(100, max(10, (int)($_GET['limit'] ?? 25)));
    $offset = ($page - 1) * $limit;

    $where = ["1=1"];
    $params = [];

    if (!empty($search)) {
        $where[] = "(full_name LIKE ? OR email LIKE ? OR phone LIKE ? OR company_name LIKE ? OR product_name LIKE ?)";
        $term = "%{$search}%";
        $params = array_merge($params, [$term, $term, $term, $term, $term]);
    }

    if (!empty($status) && $status !== 'all') {
        $where[] = "status = ?";
        $params[] = $status;
    }

    if (!empty($category) && $category !== 'all') {
        $where[] = "category = ?";
        $params[] = $category;
    }

    $whereClause = implode(' AND ', $where);

    // Total count
    $countStmt = $db->prepare("SELECT COUNT(*) as total FROM leads WHERE $whereClause");
    $countStmt->execute($params);
    $total = (int)($countStmt->fetch()['total'] ?? 0);

    // Results
    $dataStmt = $db->prepare("
        SELECT id, full_name, company_name, email, phone, product_name, category, quantity, status, is_starred, assigned_to, email_dispatched, follow_up_date, created_at
        FROM leads
        WHERE $whereClause
        ORDER BY is_starred DESC, created_at DESC
        LIMIT $limit OFFSET $offset
    ");
    $dataStmt->execute($params);
    $leads = $dataStmt->fetchAll();

    foreach ($leads as &$l) {
        $l['is_starred'] = (bool)$l['is_starred'];
        $l['email_dispatched'] = (bool)$l['email_dispatched'];
    }

    jsonResponse([
        'success' => true,
        'leads' => $leads,
        'pagination' => [
            'total'      => $total,
            'page'       => $page,
            'limit'      => $limit,
            'totalPages' => ceil($total / $limit)
        ]
    ]);
}

// 4. PUT: Update Lead Status, Starred, Assignment
if ($method === 'PUT') {
    verifyCsrfToken();
    $id = $_GET['id'] ?? null;
    if (!$id) jsonError('Lead ID required', 400);

    $leadStmt = $db->prepare("SELECT * FROM leads WHERE id = ?");
    $leadStmt->execute([$id]);
    $existing = $leadStmt->fetch();
    if (!$existing) jsonError('Lead not found', 404);

    $payload = getJsonPayload();
    $validStatuses = ['New', 'Contacted', 'Qualified', 'Quotation Sent', 'Negotiation', 'Converted', 'Lost', 'Spam'];

    $status = isset($payload['status']) && in_array($payload['status'], $validStatuses) ? $payload['status'] : $existing['status'];
    $isStarred = isset($payload['isStarred']) ? ($payload['isStarred'] ? 1 : 0) : $existing['is_starred'];
    $assignedTo = isset($payload['assignedTo']) ? ($payload['assignedTo'] ? (int)$payload['assignedTo'] : null) : $existing['assigned_to'];
    $followUpDate = isset($payload['followUpDate']) ? ($payload['followUpDate'] ?: null) : $existing['follow_up_date'];

    $up = $db->prepare("UPDATE leads SET status = ?, is_starred = ?, assigned_to = ?, follow_up_date = ? WHERE id = ?");
    $up->execute([$status, $isStarred, $assignedTo, $followUpDate, $id]);

    // Record activity if status changed
    if ($existing['status'] !== $status) {
        $act = $db->prepare("INSERT INTO lead_activity (lead_id, admin_id, action, details) VALUES (?, ?, 'status_change', ?)");
        $act->execute([$id, $admin['id'], "Status updated from '{$existing['status']}' to '{$status}'"]);
    }

    // Record activity if assignment changed
    if ($existing['assigned_to'] !== $assignedTo) {
        $act = $db->prepare("INSERT INTO lead_activity (lead_id, admin_id, action, details) VALUES (?, ?, 'assigned', ?)");
        $act->execute([$id, $admin['id'], "Lead reassigned"]);
    }

    logAdminActivity($admin['id'], $admin['full_name'], 'update_lead', 'leads', $id, "Updated lead {$id} status to {$status}");
    jsonResponse(['success' => true, 'message' => 'Lead updated successfully']);
}

jsonError('Method not supported', 405);
