<?php
/**
 * RR FOUNDATIONS — CMS STATIC PUBLISHING ENGINE
 * Generates public JSON snapshots & XML Sitemap directly on Hostinger without Node daemon.
 */

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'config.php';
$admin = requireAdminAuth();
verifyCsrfToken();
$db = getDbConnection();

if (!$db) {
    jsonError('Database connection unavailable', 500);
}

$webRoot = dirname(__DIR__, 2);
$dataDir = $webRoot . DIRECTORY_SEPARATOR . 'data';
if (!is_dir($dataDir)) {
    @mkdir($dataDir, 0755, true);
}

// 1. Fetch Published Categories
$catStmt = $db->query("
    SELECT id, name, slug, description, image, banner_image, icon, featured_product_count, highlights, display_order
    FROM categories
    WHERE status = 'published'
    ORDER BY display_order ASC, name ASC
");
$categories = $catStmt->fetchAll();
foreach ($categories as &$c) {
    $c['highlights'] = json_decode($c['highlights'] ?? '[]', true);
}

// 2. Fetch Published Products
$prodStmt = $db->query("
    SELECT id, title, slug, sku, category_id, category_name, short_description, full_description, thumbnail, images, materials, specifications, featured, min_quantity, tags, aliases, seo_title, seo_description, canonical_url, display_order
    FROM products
    WHERE status = 'published'
    ORDER BY display_order ASC, id ASC
");
$products = $prodStmt->fetchAll();
foreach ($products as &$p) {
    $p['images'] = json_decode($p['images'] ?? '[]', true);
    $p['materials'] = json_decode($p['materials'] ?? '[]', true);
    $p['specifications'] = json_decode($p['specifications'] ?? '{}', true);
    $p['tags'] = json_decode($p['tags'] ?? '[]', true);
    $p['aliases'] = json_decode($p['aliases'] ?? '[]', true);
    $p['featured'] = (bool)$p['featured'];
}

// 3. Fetch Settings
$setStmt = $db->query("SELECT setting_key, setting_value FROM website_settings");
$settingsRows = $setStmt->fetchAll();
$settings = [];
foreach ($settingsRows as $sr) {
    $settings[$sr['setting_key']] = $sr['setting_value'];
}

// 4. Write Public Data Snapshots
$catFile  = $dataDir . DIRECTORY_SEPARATOR . 'categories.json';
$prodFile = $dataDir . DIRECTORY_SEPARATOR . 'catalog.json';
$setFile  = $dataDir . DIRECTORY_SEPARATOR . 'settings.json';

file_put_contents($catFile, json_encode($categories, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
file_put_contents($prodFile, json_encode($products, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
file_put_contents($setFile, json_encode($settings, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));

// 5. Generate Rebuilt sitemap.xml
$baseUrl = rtrim($settings['website'] ?? 'https://solutions.rrfoundations.org', '/');
$date = date('Y-m-d');

$coreRoutes = [
    ['url' => '', 'priority' => '1.0', 'freq' => 'weekly'],
    ['url' => '/about', 'priority' => '0.8', 'freq' => 'weekly'],
    ['url' => '/products', 'priority' => '0.9', 'freq' => 'weekly'],
    ['url' => '/manufacturing', 'priority' => '0.8', 'freq' => 'weekly'],
    ['url' => '/industries', 'priority' => '0.8', 'freq' => 'weekly'],
    ['url' => '/contact', 'priority' => '0.8', 'freq' => 'weekly'],
    ['url' => '/request-quote', 'priority' => '0.9', 'freq' => 'weekly'],
    ['url' => '/privacy-policy', 'priority' => '0.3', 'freq' => 'monthly'],
    ['url' => '/terms-and-conditions', 'priority' => '0.3', 'freq' => 'monthly'],
];

$xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
$xml .= "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n";

foreach ($coreRoutes as $cr) {
    $xml .= "  <url>\n    <loc>{$baseUrl}{$cr['url']}</loc>\n    <lastmod>{$date}</lastmod>\n    <changefreq>{$cr['freq']}</changefreq>\n    <priority>{$cr['priority']}</priority>\n  </url>\n";
}

$seenSlugs = [];
foreach ($products as $p) {
    if (!empty($p['slug']) && !isset($seenSlugs[$p['slug']])) {
        $seenSlugs[$p['slug']] = true;
        $xml .= "  <url>\n    <loc>{$baseUrl}/products/{$p['slug']}</loc>\n    <lastmod>{$date}</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.7</priority>\n  </url>\n";
    }
}
$xml .= "</urlset>\n";

$sitemapPath = $webRoot . DIRECTORY_SEPARATOR . 'sitemap.xml';
file_put_contents($sitemapPath, $xml);

// 6. Log publishing activity
logAdminActivity($admin['id'], $admin['full_name'], 'publish_website', 'publishing', null, "Published " . count($products) . " products, " . count($categories) . " categories. Sitemap entries: " . (count($coreRoutes) + count($seenSlugs)));

jsonResponse([
    'success' => true,
    'publishedAt' => date('c'),
    'metrics' => [
        'productsPublished'   => count($products),
        'categoriesPublished' => count($categories),
        'sitemapEntries'      => count($coreRoutes) + count($seenSlugs)
    ],
    'message' => 'Public website catalogue and sitemap published successfully.'
]);
