<?php
/**
 * RR FOUNDATIONS — WEBSITE & SEO SETTINGS API
 * Manages global corporate parameters, contact information, social links and SEO.
 */

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'config.php';
$admin = requireAdminAuth();
$db = getDbConnection();

if (!$db) {
    jsonError('Database connection unavailable', 500);
}

$method = $_SERVER['REQUEST_METHOD'];

// 1. GET: Fetch All Settings
if ($method === 'GET') {
    $stmt = $db->query("SELECT setting_key, setting_value, setting_group FROM website_settings ORDER BY setting_group, setting_key");
    $rows = $stmt->fetchAll();

    $settings = [];
    foreach ($rows as $r) {
        $settings[$r['setting_key']] = $r['setting_value'];
    }

    jsonResponse(['success' => true, 'settings' => $settings]);
}

// 2. POST: Update Settings
if ($method === 'POST') {
    verifyCsrfToken();
    $payload = getJsonPayload();
    $updates = $payload['settings'] ?? [];

    if (!is_array($updates) || empty($updates)) {
        jsonError('No settings payload provided', 400);
    }

    $stmt = $db->prepare("
        INSERT INTO website_settings (setting_key, setting_value, setting_group)
        VALUES (?, ?, ?)
        ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value), setting_group = VALUES(setting_group)
    ");

    foreach ($updates as $key => $val) {
        $group = 'general';
        if (str_starts_with($key, 'meta_') || str_starts_with($key, 'seo_')) $group = 'seo';
        if (in_array($key, ['phone', 'email', 'address', 'hours', 'phone_raw', 'whatsapp'])) $group = 'contact';
        if (in_array($key, ['logo_url', 'favicon_url', 'brand_color'])) $group = 'branding';

        $stmt->execute([$key, (string)$val, $group]);
    }

    logAdminActivity($admin['id'], $admin['full_name'], 'update_settings', 'website_settings', null, 'Updated ' . count($updates) . ' website settings');
    jsonResponse(['success' => true, 'message' => 'Settings updated successfully']);
}

jsonError('Method not supported', 405);
