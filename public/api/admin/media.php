<?php
/**
 * RR FOUNDATIONS — MEDIA LIBRARY & IMAGE UPLOAD API
 * Hardened upload handler, MIME validation, thumbnailing & asset indexing.
 */

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'config.php';
$admin = requireAdminAuth();
$db = getDbConnection();

if (!$db) {
    jsonError('Database connection unavailable', 500);
}

$method = $_SERVER['REQUEST_METHOD'];
$uploadDir = dirname(__DIR__, 2) . DIRECTORY_SEPARATOR . 'assets' . DIRECTORY_SEPARATOR . 'uploads';

if (!is_dir($uploadDir)) {
    @mkdir($uploadDir, 0755, true);
}

// 1. GET: List Uploaded Media
if ($method === 'GET') {
    $search = trim($_GET['search'] ?? '');
    $page = max(1, (int)($_GET['page'] ?? 1));
    $limit = min(60, max(12, (int)($_GET['limit'] ?? 24)));
    $offset = ($page - 1) * $limit;

    $where = ["1=1"];
    $params = [];

    if (!empty($search)) {
        $where[] = "(filename LIKE ? OR original_name LIKE ? OR alt_text LIKE ?)";
        $term = "%{$search}%";
        $params = [$term, $term, $term];
    }

    $whereClause = implode(' AND ', $where);

    $countStmt = $db->prepare("SELECT COUNT(*) as total FROM media WHERE $whereClause");
    $countStmt->execute($params);
    $total = (int)($countStmt->fetch()['total'] ?? 0);

    $stmt = $db->prepare("
        SELECT id, filename, original_name, file_path, file_size, mime_type, width, height, alt_text, created_at
        FROM media
        WHERE $whereClause
        ORDER BY created_at DESC
        LIMIT $limit OFFSET $offset
    ");
    $stmt->execute($params);
    $media = $stmt->fetchAll();

    jsonResponse([
        'success' => true,
        'media' => $media,
        'pagination' => [
            'total'      => $total,
            'page'       => $page,
            'limit'      => $limit,
            'totalPages' => ceil($total / $limit)
        ]
    ]);
}

// 2. POST: Upload Image File
if ($method === 'POST') {
    verifyCsrfToken();

    if (empty($_FILES['file']) || $_FILES['file']['error'] !== UPLOAD_ERR_OK) {
        $code = $_FILES['file']['error'] ?? 'NO_FILE';
        jsonError("File upload error or no file provided (Code: {$code})", 400);
    }

    $file = $_FILES['file'];
    $maxBytes = 10 * 1024 * 1024; // 10MB
    if ($file['size'] > $maxBytes) {
        jsonError('File size exceeds the 10MB limit', 400);
    }

    // Server-side MIME validation via finfo
    $finfo = new finfo(FILEINFO_MIME_TYPE);
    $mimeType = $finfo->file($file['tmp_name']);

    $allowedMimes = [
        'image/jpeg' => 'jpg',
        'image/png'  => 'png',
        'image/webp' => 'webp',
        'image/gif'  => 'gif',
    ];

    if (!isset($allowedMimes[$mimeType])) {
        jsonError("Unsupported media type: '{$mimeType}'. Allowed formats: JPG, PNG, WEBP, GIF.", 400);
    }

    $ext = $allowedMimes[$mimeType];
    $originalName = basename($file['name']);
    $cleanSlug = preg_replace('/[^a-zA-Z0-9_-]/', '-', pathinfo($originalName, PATHINFO_FILENAME));
    $cleanSlug = substr($cleanSlug, 0, 40);
    $uniqueName = 'rrf_' . $cleanSlug . '_' . bin2hex(random_bytes(6)) . '.' . $ext;

    $targetPath = $uploadDir . DIRECTORY_SEPARATOR . $uniqueName;

    if (!move_uploaded_file($file['tmp_name'], $targetPath)) {
        jsonError('Failed to move uploaded file to destination directory', 500);
    }

    // Inspect image dimensions
    $width = null;
    $height = null;
    $imgDetails = @getimagesize($targetPath);
    if ($imgDetails) {
        $width = $imgDetails[0];
        $height = $imgDetails[1];
    }

    $publicPath = '/assets/uploads/' . $uniqueName;
    $altText = trim($_POST['altText'] ?? $cleanSlug);

    $ins = $db->prepare("
        INSERT INTO media (filename, original_name, file_path, file_size, mime_type, width, height, alt_text, uploaded_by)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ");
    $ins->execute([$uniqueName, $originalName, $publicPath, $file['size'], $mimeType, $width, $height, $altText, $admin['id']]);
    $newId = (int)$db->lastInsertId();

    logAdminActivity($admin['id'], $admin['full_name'], 'upload_media', 'media', (string)$newId, "Uploaded {$originalName} -> {$uniqueName}");

    jsonResponse([
        'success' => true,
        'media' => [
            'id'           => $newId,
            'filename'     => $uniqueName,
            'originalName' => $originalName,
            'filePath'     => $publicPath,
            'fileSize'     => $file['size'],
            'mimeType'     => $mimeType,
            'width'        => $width,
            'height'       => $height,
            'altText'      => $altText
        ]
    ], 201);
}

// 3. DELETE: Remove Media File
if ($method === 'DELETE') {
    verifyCsrfToken();
    $id = (int)($_GET['id'] ?? 0);
    if (!$id) jsonError('Media ID required', 400);

    $stmt = $db->prepare("SELECT * FROM media WHERE id = ?");
    $stmt->execute([$id]);
    $item = $stmt->fetch();
    if (!$item) jsonError('Media asset not found', 404);

    // Safeguard: Check if used by any products as thumbnail or images
    $usedInProduct = $db->prepare("SELECT id, title FROM products WHERE thumbnail = ? OR images LIKE ? LIMIT 1");
    $usedInProduct->execute([$item['file_path'], '%' . $item['file_path'] . '%']);
    $pMatch = $usedInProduct->fetch();

    if ($pMatch && empty($_GET['force'])) {
        jsonError("Media asset is currently referenced by product '{$pMatch['title']}' ({$pMatch['id']}). Add &force=true to override.", 409, [
            'referencing_product' => $pMatch
        ]);
    }

    // Delete file from disk
    $fullPath = $uploadDir . DIRECTORY_SEPARATOR . $item['filename'];
    if (file_exists($fullPath)) {
        @unlink($fullPath);
    }

    // Delete record
    $del = $db->prepare("DELETE FROM media WHERE id = ?");
    $del->execute([$id]);

    logAdminActivity($admin['id'], $admin['full_name'], 'delete_media', 'media', (string)$id, "Deleted media {$item['filename']}");
    jsonResponse(['success' => true, 'message' => 'Media file deleted successfully']);
}

jsonError('Method not supported', 405);
