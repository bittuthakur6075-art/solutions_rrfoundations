<?php
/**
 * RR FOUNDATIONS — CATEGORY MANAGEMENT API
 * Full CRUD, Hierarchy, Dependency Safeguards, Reordering & SEO
 */

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'config.php';
$admin = requireAdminAuth();
$db = getDbConnection();

if (!$db) {
    jsonError('Database connection unavailable', 500);
}

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

// 1. Reorder Categories
if ($method === 'POST' && $action === 'reorder') {
    verifyCsrfToken();
    $payload = getJsonPayload();
    $orders = $payload['orders'] ?? []; // [{ id: 'badges-lapel-pins', order: 0 }, ...]

    if (!is_array($orders)) {
        jsonError('Invalid ordering payload', 400);
    }

    $stmt = $db->prepare("UPDATE categories SET display_order = ? WHERE id = ?");
    foreach ($orders as $item) {
        if (!empty($item['id'])) {
            $stmt->execute([(int)($item['order'] ?? 0), $item['id']]);
        }
    }

    logAdminActivity($admin['id'], $admin['full_name'], 'reorder_categories', 'categories', null, 'Reordered categories display sequence');
    jsonResponse(['success' => true, 'message' => 'Categories reordered successfully']);
}

// 2. GET: List All Categories or Single
if ($method === 'GET') {
    $id = $_GET['id'] ?? null;
    if ($id) {
        $stmt = $db->prepare("SELECT * FROM categories WHERE id = ? LIMIT 1");
        $stmt->execute([$id]);
        $cat = $stmt->fetch();
        if (!$cat) {
            jsonError('Category not found', 404);
        }
        $cat['highlights'] = json_decode($cat['highlights'] ?? '[]', true);
        jsonResponse(['success' => true, 'category' => $cat]);
    }

    // List all with count of associated products
    $stmt = $db->query("
        SELECT 
            c.*,
            COUNT(p.id) as actual_product_count
        FROM categories c
        LEFT JOIN products p ON p.category_id = c.id AND p.status != 'archived'
        GROUP BY c.id
        ORDER BY c.display_order ASC, c.name ASC
    ");
    $categories = $stmt->fetchAll();

    foreach ($categories as &$c) {
        $c['highlights'] = json_decode($c['highlights'] ?? '[]', true);
        $c['actual_product_count'] = (int)$c['actual_product_count'];
    }

    jsonResponse(['success' => true, 'categories' => $categories]);
}

// 3. POST: Add Category
if ($method === 'POST') {
    verifyCsrfToken();
    $payload = getJsonPayload();

    $name = trim($payload['name'] ?? '');
    $slug = trim($payload['slug'] ?? '');
    $description = trim($payload['description'] ?? '');
    $image = trim($payload['image'] ?? '');

    $errors = [];
    if (empty($name)) $errors[] = 'Category Name is required';
    if (empty($slug)) {
        $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $name), '-'));
    }
    if (empty($description)) $errors[] = 'Description is required';
    if (empty($image)) $errors[] = 'Thumbnail Image is required';

    // Slug uniqueness
    $slugStmt = $db->prepare("SELECT id FROM categories WHERE slug = ?");
    $slugStmt->execute([$slug]);
    if ($slugStmt->fetch()) {
        $errors[] = "A category with slug '{$slug}' already exists";
    }

    if (!empty($errors)) {
        jsonError('Validation failed', 400, $errors);
    }

    $id = $slug; // Id mirrors slug for consistency
    $bannerImage = !empty($payload['bannerImage']) ? trim($payload['bannerImage']) : null;
    $icon = !empty($payload['icon']) ? trim($payload['icon']) : null;
    $highlights = !empty($payload['highlights']) && is_array($payload['highlights']) ? json_encode($payload['highlights']) : json_encode([]);
    $displayOrder = (int)($payload['displayOrder'] ?? 0);
    $status = in_array($payload['status'] ?? '', ['published', 'draft', 'archived']) ? $payload['status'] : 'published';
    $seoTitle = trim($payload['seoTitle'] ?? ($name . ' | Direct Manufacturer RR Foundations'));
    $seoDesc  = trim($payload['seoDescription'] ?? ($description));

    $ins = $db->prepare("
        INSERT INTO categories (
            id, name, slug, description, image, banner_image, icon,
            featured_product_count, highlights, display_order, status, seo_title, seo_description
        ) VALUES (?, ?, ?, ?, ?, ?, ?, 0, ?, ?, ?, ?, ?)
    ");
    $ins->execute([
        $id, $name, $slug, $description, $image, $bannerImage, $icon,
        $highlights, $displayOrder, $status, $seoTitle, $seoDesc
    ]);

    logAdminActivity($admin['id'], $admin['full_name'], 'create_category', 'categories', $id, "Created category '{$name}'");
    jsonResponse(['success' => true, 'id' => $id, 'slug' => $slug, 'message' => 'Category created successfully'], 201);
}

// 4. PUT: Update Category
if ($method === 'PUT') {
    verifyCsrfToken();
    $id = $_GET['id'] ?? null;
    if (!$id) jsonError('Category ID is required', 400);

    $stmt = $db->prepare("SELECT * FROM categories WHERE id = ?");
    $stmt->execute([$id]);
    $cat = $stmt->fetch();
    if (!$cat) jsonError('Category not found', 404);

    $payload = getJsonPayload();
    $name = trim($payload['name'] ?? $cat['name']);
    $slug = trim($payload['slug'] ?? $cat['slug']);
    $description = trim($payload['description'] ?? $cat['description']);
    $image = trim($payload['image'] ?? $cat['image']);
    $bannerImage = isset($payload['bannerImage']) ? trim($payload['bannerImage']) : $cat['banner_image'];
    $icon = isset($payload['icon']) ? trim($payload['icon']) : $cat['icon'];
    $highlights = isset($payload['highlights']) ? json_encode($payload['highlights']) : $cat['highlights'];
    $displayOrder = isset($payload['displayOrder']) ? (int)$payload['displayOrder'] : $cat['display_order'];
    $status = isset($payload['status']) && in_array($payload['status'], ['published', 'draft', 'archived']) ? $payload['status'] : $cat['status'];
    $seoTitle = trim($payload['seoTitle'] ?? $cat['seo_title']);
    $seoDesc  = trim($payload['seoDescription'] ?? $cat['seo_description']);

    // Check slug collision
    $slugStmt = $db->prepare("SELECT id FROM categories WHERE slug = ? AND id != ?");
    $slugStmt->execute([$slug, $id]);
    if ($slugStmt->fetch()) {
        jsonError("Slug '{$slug}' is already taken", 400);
    }

    $up = $db->prepare("
        UPDATE categories SET
            name = ?, slug = ?, description = ?, image = ?, banner_image = ?, icon = ?,
            highlights = ?, display_order = ?, status = ?, seo_title = ?, seo_description = ?
        WHERE id = ?
    ");
    $up->execute([
        $name, $slug, $description, $image, $bannerImage, $icon,
        $highlights, $displayOrder, $status, $seoTitle, $seoDesc, $id
    ]);

    // Also synchronize category_name in products table
    if ($cat['name'] !== $name) {
        $syncProd = $db->prepare("UPDATE products SET category_name = ? WHERE category_id = ?");
        $syncProd->execute([$name, $id]);
    }

    logAdminActivity($admin['id'], $admin['full_name'], 'update_category', 'categories', $id, "Updated category '{$name}'");
    jsonResponse(['success' => true, 'id' => $id, 'slug' => $slug, 'message' => 'Category updated successfully']);
}

// 5. DELETE: Delete Category (CRITICAL SAFEGUARD)
if ($method === 'DELETE') {
    verifyCsrfToken();
    $id = $_GET['id'] ?? null;
    if (!$id) jsonError('Category ID is required', 400);

    // Safeguard check: Count products belonging to this category
    $prodCountStmt = $db->prepare("SELECT COUNT(*) as cnt FROM products WHERE category_id = ? AND status != 'archived'");
    $prodCountStmt->execute([$id]);
    $activeProductCount = (int)($prodCountStmt->fetch()['cnt'] ?? 0);

    if ($activeProductCount > 0) {
        jsonError("Cannot delete category '{$id}' because it contains {$activeProductCount} active products. Please reassign or archive these products first.", 409, [
            'active_products' => $activeProductCount
        ]);
    }

    $del = $db->prepare("DELETE FROM categories WHERE id = ?");
    $del->execute([$id]);

    logAdminActivity($admin['id'], $admin['full_name'], 'delete_category', 'categories', $id, "Deleted category '{$id}'");
    jsonResponse(['success' => true, 'message' => 'Category deleted successfully']);
}

jsonError('Method not supported', 405);
