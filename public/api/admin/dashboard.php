<?php
/**
 * RR FOUNDATIONS — ADMIN DASHBOARD METRICS API
 * Aggregates real-time operational statistics and analytics from MySQL.
 */

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'config.php';
$admin = requireAdminAuth();
$db = getDbConnection();

if (!$db) {
    jsonError('Database connection unavailable', 500);
}

// 1. Product Summary
$prodStats = $db->query("
    SELECT 
        COUNT(*) as total,
        SUM(CASE WHEN status = 'published' THEN 1 ELSE 0 END) as active,
        SUM(CASE WHEN status = 'draft' THEN 1 ELSE 0 END) as draft,
        SUM(CASE WHEN status = 'archived' THEN 1 ELSE 0 END) as archived
    FROM products
")->fetch();

// 2. Category Summary
$catStats = $db->query("
    SELECT COUNT(*) as total FROM categories WHERE status != 'archived'
")->fetch();

// 3. Lead Summary
$leadStats = $db->query("
    SELECT 
        COUNT(*) as total,
        SUM(CASE WHEN status = 'New' THEN 1 ELSE 0 END) as new_leads,
        SUM(CASE WHEN status IN ('Contacted', 'Qualified', 'Quotation Sent', 'Negotiation') THEN 1 ELSE 0 END) as in_progress,
        SUM(CASE WHEN status IN ('Converted', 'Lost') THEN 1 ELSE 0 END) as closed
    FROM leads
")->fetch();

// 4. Monthly Lead Trends (Last 6 Months)
$trends = $db->query("
    SELECT 
        DATE_FORMAT(created_at, '%b %Y') as month_label,
        COUNT(*) as count
    FROM leads
    WHERE created_at >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
    GROUP BY DATE_FORMAT(created_at, '%Y-%m'), DATE_FORMAT(created_at, '%b %Y')
    ORDER BY MIN(created_at) ASC
")->fetchAll();

// 5. Enquiries by Category
$leadsByCat = $db->query("
    SELECT 
        COALESCE(category, 'General') as category_name,
        COUNT(*) as count
    FROM leads
    GROUP BY category
    ORDER BY count DESC
    LIMIT 6
")->fetchAll();

// 6. Product Distribution by Category
$prodsByCat = $db->query("
    SELECT 
        c.name as category_name,
        COUNT(p.id) as product_count
    FROM categories c
    LEFT JOIN products p ON p.category_id = c.id AND p.status != 'archived'
    GROUP BY c.id, c.name
    ORDER BY product_count DESC
")->fetchAll();

// 7. Recent Enquiries (Latest 5)
$recentLeads = $db->query("
    SELECT id, full_name, company_name, email, phone, product_name, category, quantity, status, created_at
    FROM leads
    ORDER BY created_at DESC
    LIMIT 5
")->fetchAll();

// 8. Latest Added Products (Latest 5)
$latestProducts = $db->query("
    SELECT id, title, slug, sku, category_name, thumbnail, status, created_at
    FROM products
    ORDER BY created_at DESC
    LIMIT 5
")->fetchAll();

// 9. Recent Admin Activity (Latest 10)
$recentActivity = $db->query("
    SELECT id, admin_name, action, entity_type, entity_id, details, created_at
    FROM activity_logs
    ORDER BY created_at DESC
    LIMIT 10
")->fetchAll();

jsonResponse([
    'success' => true,
    'metrics' => [
        'totalProducts'    => (int)($prodStats['total'] ?? 0),
        'activeProducts'   => (int)($prodStats['active'] ?? 0),
        'draftProducts'    => (int)($prodStats['draft'] ?? 0),
        'archivedProducts' => (int)($prodStats['archived'] ?? 0),
        'totalCategories'  => (int)($catStats['total'] ?? 0),
        'totalLeads'       => (int)($leadStats['total'] ?? 0),
        'newLeads'         => (int)($leadStats['new_leads'] ?? 0),
        'inProgressLeads'  => (int)($leadStats['in_progress'] ?? 0),
        'closedLeads'      => (int)($leadStats['closed'] ?? 0),
    ],
    'charts' => [
        'monthlyTrends'         => $trends,
        'leadsByCategory'       => $leadsByCat,
        'productsByCategory'    => $prodsByCat,
    ],
    'widgets' => [
        'recentLeads'     => $recentLeads,
        'latestProducts'  => $latestProducts,
        'recentActivity'  => $recentActivity,
    ]
]);
