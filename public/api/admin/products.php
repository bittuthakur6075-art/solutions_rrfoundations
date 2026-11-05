<?php
/**
 * RR FOUNDATIONS — PRODUCT MANAGEMENT API
 * Full CRUD, Search, Filter, Bulk Actions, CSV Export & Slug Redirection
 */

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'config.php';
$admin = requireAdminAuth();
$db = getDbConnection();

if (!$db) {
    jsonError('Database connection unavailable', 500);
}

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

// 1. CSV Export
if ($method === 'GET' && $action === 'export') {
    header('Content-Type: text/csv; charset=UTF-8');
    header('Content-Disposition: attachment; filename="rrfoundations_products_' . date('Y-m-d') . '.csv"');
    
    $out = fopen('php://output', 'w');
    // UTF-8 BOM for Excel compatibility
    fputs($out, "\xEF\xBB\xBF");
    fputcsv($out, ['Product ID', 'SKU', 'Title', 'Slug', 'Category', 'Status', 'Featured', 'Min Quantity', 'Short Description', 'Thumbnail', 'Created At']);

    $stmt = $db->query("SELECT id, sku, title, slug, category_name, status, featured, min_quantity, short_description, thumbnail, created_at FROM products ORDER BY id ASC");
    while ($row = $stmt->fetch()) {
        fputcsv($out, [
            $row['id'],
            $row['sku'],
            $row['title'],
            $row['slug'],
            $row['category_name'],
            $row['status'],
            $row['featured'] ? 'Yes' : 'No',
            $row['min_quantity'],
            $row['short_description'],
            $row['thumbnail'],
            $row['created_at']
        ]);
    }
    fclose($out);
    exit;
}

// 2. Bulk Operations
if ($method === 'POST' && $action === 'bulk') {
    verifyCsrfToken();
    $payload = getJsonPayload();
    $ids = $payload['ids'] ?? [];
    $bulkAction = $payload['bulkAction'] ?? '';

    if (!is_array($ids) || empty($ids)) {
        jsonError('No product IDs supplied for bulk operation', 400);
    }

    $placeholders = implode(',', array_fill(0, count($ids), '?'));

    switch ($bulkAction) {
        case 'publish':
            $stmt = $db->prepare("UPDATE products SET status = 'published' WHERE id IN ($placeholders)");
            $stmt->execute($ids);
            logAdminActivity($admin['id'], $admin['full_name'], 'bulk_publish_products', 'products', null, count($ids) . ' products published');
            break;
        case 'unpublish':
            $stmt = $db->prepare("UPDATE products SET status = 'draft' WHERE id IN ($placeholders)");
            $stmt->execute($ids);
            logAdminActivity($admin['id'], $admin['full_name'], 'bulk_draft_products', 'products', null, count($ids) . ' products set to draft');
            break;
        case 'archive':
            $stmt = $db->prepare("UPDATE products SET status = 'archived' WHERE id IN ($placeholders)");
            $stmt->execute($ids);
            logAdminActivity($admin['id'], $admin['full_name'], 'bulk_archive_products', 'products', null, count($ids) . ' products archived');
            break;
        case 'delete':
            $stmt = $db->prepare("DELETE FROM products WHERE id IN ($placeholders)");
            $stmt->execute($ids);
            logAdminActivity($admin['id'], $admin['full_name'], 'bulk_delete_products', 'products', null, count($ids) . ' products permanently deleted');
            break;
        default:
            jsonError('Unknown bulk action', 400);
    }

    jsonResponse(['success' => true, 'count' => count($ids), 'action' => $bulkAction]);
}

// 3. GET: Single Product or Paginated List
if ($method === 'GET') {
    $id = $_GET['id'] ?? null;
    if ($id) {
        $stmt = $db->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
        $stmt->execute([$id]);
        $prod = $stmt->fetch();
        if (!$prod) {
            jsonError('Product not found', 404);
        }
        $prod['images'] = json_decode($prod['images'] ?? '[]', true);
        $prod['materials'] = json_decode($prod['materials'] ?? '[]', true);
        $prod['specifications'] = json_decode($prod['specifications'] ?? '{}', true);
        $prod['tags'] = json_decode($prod['tags'] ?? '[]', true);
        $prod['aliases'] = json_decode($prod['aliases'] ?? '[]', true);
        $prod['featured'] = (bool)$prod['featured'];
        jsonResponse(['success' => true, 'product' => $prod]);
    }

    // List with filters
    $search = trim($_GET['search'] ?? '');
    $category = trim($_GET['category'] ?? '');
    $status = trim($_GET['status'] ?? '');
    $sort = $_GET['sort'] ?? 'newest';
    $page = max(1, (int)($_GET['page'] ?? 1));
    $limit = min(100, max(10, (int)($_GET['limit'] ?? 25)));
    $offset = ($page - 1) * $limit;

    $where = ["1=1"];
    $params = [];

    if (!empty($search)) {
        $where[] = "(title LIKE ? OR sku LIKE ? OR slug LIKE ? OR short_description LIKE ?)";
        $term = "%{$search}%";
        $params = array_merge($params, [$term, $term, $term, $term]);
    }

    if (!empty($category) && $category !== 'all') {
        $where[] = "category_id = ?";
        $params[] = $category;
    }

    if (!empty($status) && $status !== 'all') {
        $where[] = "status = ?";
        $params[] = $status;
    }

    $whereClause = implode(' AND ', $where);

    $orderBy = "created_at DESC";
    if ($sort === 'oldest') $orderBy = "created_at ASC";
    if ($sort === 'title_asc') $orderBy = "title ASC";
    if ($sort === 'title_desc') $orderBy = "title DESC";
    if ($sort === 'sku_asc') $orderBy = "sku ASC";

    // Count query
    $countStmt = $db->prepare("SELECT COUNT(*) as total FROM products WHERE $whereClause");
    $countStmt->execute($params);
    $total = (int)($countStmt->fetch()['total'] ?? 0);

    // Data query
    $dataStmt = $db->prepare("
        SELECT id, sku, title, slug, category_id, category_name, thumbnail, status, featured, min_quantity, display_order, created_at, updated_at
        FROM products
        WHERE $whereClause
        ORDER BY $orderBy
        LIMIT $limit OFFSET $offset
    ");
    $dataStmt->execute($params);
    $products = $dataStmt->fetchAll();

    foreach ($products as &$p) {
        $p['featured'] = (bool)$p['featured'];
    }

    jsonResponse([
        'success' => true,
        'products' => $products,
        'pagination' => [
            'total'       => $total,
            'page'        => $page,
            'limit'       => $limit,
            'totalPages'  => ceil($total / $limit)
        ]
    ]);
}

// 4. POST: Create Product
if ($method === 'POST') {
    verifyCsrfToken();
    $payload = getJsonPayload();

    $title = trim($payload['title'] ?? '');
    $slug  = trim($payload['slug'] ?? '');
    $categoryId = trim($payload['categoryId'] ?? '');
    $shortDesc = trim($payload['shortDescription'] ?? '');
    $fullDesc  = trim($payload['fullDescription'] ?? '');
    $thumbnail = trim($payload['thumbnail'] ?? '');

    $errors = [];
    if (empty($title)) $errors[] = 'Product Title is required';
    if (empty($slug)) {
        // Auto slugify
        $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $title), '-'));
    }
    if (empty($categoryId)) $errors[] = 'Category is required';
    if (empty($shortDesc)) $errors[] = 'Short Description is required';
    if (empty($thumbnail)) $errors[] = 'Thumbnail Image is required';

    // Verify Category exists
    $catStmt = $db->prepare("SELECT id, name FROM categories WHERE id = ?");
    $catStmt->execute([$categoryId]);
    $catRow = $catStmt->fetch();
    if (!$catRow) {
        $errors[] = 'Selected Category does not exist';
    }

    // Verify Slug uniqueness
    $slugStmt = $db->prepare("SELECT id FROM products WHERE slug = ?");
    $slugStmt->execute([$slug]);
    if ($slugStmt->fetch()) {
        $errors[] = "A product with the slug '{$slug}' already exists";
    }

    if (!empty($errors)) {
        jsonError('Validation failed', 400, $errors);
    }

    $id = 'prod_' . preg_replace('/[^a-z0-9_]/', '', $categoryId) . '_' . bin2hex(random_bytes(3));
    $sku = !empty($payload['sku']) ? trim($payload['sku']) : 'RRF-' . strtoupper(substr(md5($id), 0, 6));

    $images = !empty($payload['images']) && is_array($payload['images']) ? json_encode($payload['images']) : json_encode([$thumbnail]);
    $materials = !empty($payload['materials']) && is_array($payload['materials']) ? json_encode($payload['materials']) : json_encode([]);
    $specifications = !empty($payload['specifications']) && is_array($payload['specifications']) ? json_encode($payload['specifications']) : json_encode((object)[]);
    $tags = !empty($payload['tags']) && is_array($payload['tags']) ? json_encode($payload['tags']) : json_encode([]);
    $aliases = !empty($payload['aliases']) && is_array($payload['aliases']) ? json_encode($payload['aliases']) : json_encode([]);
    $featured = !empty($payload['featured']) ? 1 : 0;
    $minQuantity = max(1, (int)($payload['minQuantity'] ?? 100));
    $status = in_array($payload['status'] ?? '', ['published', 'draft', 'archived']) ? $payload['status'] : 'published';

    // When display order is not specified, place new product at the very top (lowest display_order)
    if (!isset($payload['displayOrder']) || $payload['displayOrder'] === '' || $payload['displayOrder'] === 0) {
        $minStmt = $db->query("SELECT COALESCE(MIN(display_order), 0) - 1 as next_order FROM products");
        $displayOrder = (int)($minStmt->fetch()['next_order'] ?? -1);
    } else {
        $displayOrder = (int)$payload['displayOrder'];
    }

    $seoTitle = trim($payload['seoTitle'] ?? ($title . ' | Direct Manufacturer RR Foundations'));
    $seoDesc  = trim($payload['seoDescription'] ?? ($shortDesc . ' Manufactured in New Delhi by RR Foundations.'));
    $canonicalUrl = !empty($payload['canonicalUrl']) ? trim($payload['canonicalUrl']) : null;

    $stmt = $db->prepare("
        INSERT INTO products (
            id, title, slug, sku, category_id, category_name, short_description, full_description,
            thumbnail, images, materials, specifications, featured, min_quantity, tags, aliases,
            status, display_order, seo_title, seo_description, canonical_url
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ");

    $stmt->execute([
        $id, $title, $slug, $sku, $categoryId, $catRow['name'], $shortDesc, $fullDesc,
        $thumbnail, $images, $materials, $specifications, $featured, $minQuantity, $tags, $aliases,
        $status, $displayOrder, $seoTitle, $seoDesc, $canonicalUrl
    ]);

    logAdminActivity($admin['id'], $admin['full_name'], 'create_product', 'products', $id, "Created product '{$title}' ({$id})");

    jsonResponse(['success' => true, 'id' => $id, 'slug' => $slug, 'message' => 'Product created successfully'], 201);
}

// 5. PUT: Update Product
if ($method === 'PUT') {
    verifyCsrfToken();
    $id = $_GET['id'] ?? null;
    if (!$id) {
        jsonError('Product ID required', 400);
    }

    $existingStmt = $db->prepare("SELECT * FROM products WHERE id = ?");
    $existingStmt->execute([$id]);
    $existing = $existingStmt->fetch();
    if (!$existing) {
        jsonError('Product not found', 404);
    }

    $payload = getJsonPayload();
    $title = trim($payload['title'] ?? $existing['title']);
    $slug  = trim($payload['slug'] ?? $existing['slug']);
    $categoryId = trim($payload['categoryId'] ?? $existing['category_id']);
    $shortDesc = trim($payload['shortDescription'] ?? $existing['short_description']);
    $fullDesc  = trim($payload['fullDescription'] ?? $existing['full_description']);
    $thumbnail = trim($payload['thumbnail'] ?? $existing['thumbnail']);
    $sku = trim($payload['sku'] ?? $existing['sku']);

    // Check slug uniqueness excluding self
    $slugStmt = $db->prepare("SELECT id FROM products WHERE slug = ? AND id != ?");
    $slugStmt->execute([$slug, $id]);
    if ($slugStmt->fetch()) {
        jsonError("Slug '{$slug}' is already taken by another product", 400);
    }

    // Auto-create 301 Redirect if slug was changed
    if ($existing['slug'] !== $slug) {
        $oldPath = "/products/{$existing['slug']}";
        $newPath = "/products/{$slug}";
        $redirStmt = $db->prepare("INSERT INTO seo_redirects (source_path, target_path, status_code) VALUES (?, ?, 301) ON DUPLICATE KEY UPDATE target_path = VALUES(target_path)");
        $redirStmt->execute([$oldPath, $newPath]);
        logAdminActivity($admin['id'], $admin['full_name'], 'slug_redirect_created', 'seo_redirects', $id, "Slug changed from {$oldPath} to {$newPath}");
    }

    // Category name check
    $catStmt = $db->prepare("SELECT name FROM categories WHERE id = ?");
    $catStmt->execute([$categoryId]);
    $catName = $catStmt->fetch()['name'] ?? $existing['category_name'];

    $images = isset($payload['images']) ? json_encode($payload['images']) : $existing['images'];
    $materials = isset($payload['materials']) ? json_encode($payload['materials']) : $existing['materials'];
    $specifications = isset($payload['specifications']) ? json_encode($payload['specifications']) : $existing['specifications'];
    $tags = isset($payload['tags']) ? json_encode($payload['tags']) : $existing['tags'];
    $aliases = isset($payload['aliases']) ? json_encode($payload['aliases']) : $existing['aliases'];
    $featured = isset($payload['featured']) ? ($payload['featured'] ? 1 : 0) : $existing['featured'];
    $minQuantity = isset($payload['minQuantity']) ? max(1, (int)$payload['minQuantity']) : $existing['min_quantity'];
    $status = isset($payload['status']) && in_array($payload['status'], ['published', 'draft', 'archived']) ? $payload['status'] : $existing['status'];
    $displayOrder = isset($payload['displayOrder']) ? (int)$payload['displayOrder'] : $existing['display_order'];
    $seoTitle = trim($payload['seoTitle'] ?? $existing['seo_title']);
    $seoDesc  = trim($payload['seoDescription'] ?? $existing['seo_description']);
    $canonicalUrl = isset($payload['canonicalUrl']) ? trim($payload['canonicalUrl']) : $existing['canonical_url'];

    $up = $db->prepare("
        UPDATE products SET
            title = ?, slug = ?, sku = ?, category_id = ?, category_name = ?, short_description = ?, full_description = ?,
            thumbnail = ?, images = ?, materials = ?, specifications = ?, featured = ?, min_quantity = ?, tags = ?, aliases = ?,
            status = ?, display_order = ?, seo_title = ?, seo_description = ?, canonical_url = ?
        WHERE id = ?
    ");

    $up->execute([
        $title, $slug, $sku, $categoryId, $catName, $shortDesc, $fullDesc,
        $thumbnail, $images, $materials, $specifications, $featured, $minQuantity, $tags, $aliases,
        $status, $displayOrder, $seoTitle, $seoDesc, $canonicalUrl, $id
    ]);

    logAdminActivity($admin['id'], $admin['full_name'], 'update_product', 'products', $id, "Updated product '{$title}' ({$id})");

    jsonResponse(['success' => true, 'id' => $id, 'slug' => $slug, 'message' => 'Product updated successfully']);
}

// 6. DELETE: Permanently Delete Product
if ($method === 'DELETE') {
    verifyCsrfToken();
    $id = $_GET['id'] ?? null;

    if (!$id) jsonError('Product ID required', 400);

    $stmt = $db->prepare("SELECT title FROM products WHERE id = ?");
    $stmt->execute([$id]);
    $prod = $stmt->fetch();
    if (!$prod) jsonError('Product not found', 404);

    $del = $db->prepare("DELETE FROM products WHERE id = ?");
    $del->execute([$id]);
    logAdminActivity($admin['id'], $admin['full_name'], 'delete_product_permanent', 'products', $id, "Permanently deleted '{$prod['title']}' ({$id})");
    jsonResponse(['success' => true, 'message' => "Product '{$prod['title']}' permanently deleted"]);
}

jsonError('Method not supported', 405);
