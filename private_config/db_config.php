<?php
/**
 * RR FOUNDATIONS — PRIVATE DATABASE CONFIGURATION
 * Hostinger MySQL & Production Environment Parameters
 * 
 * IMPORTANT: In production, place this directory OUTSIDE public_html:
 * Example: /home/u123456789/private_config/db_config.php
 */

return [
    'db_host'      => getenv('DB_HOST') ?: 'localhost',
    'db_name'      => getenv('DB_NAME') ?: 'u123456789_rrf_admin',
    'db_user'      => getenv('DB_USER') ?: 'u123456789_rrf_user',
    'db_pass'      => getenv('DB_PASS') ?: 'CHANGE_ME_IN_PRODUCTION_f9d8a1c3',
    'db_charset'   => 'utf8mb4',
    'app_env'      => getenv('APP_ENV') ?: 'production', // 'production' or 'development'
    'session_name' => 'rrf_session',
    'session_key'  => getenv('SESSION_KEY') ?: '9c56fa7e1d830b42981ceea25b17da534b8c9d2ef071a62458e3dfb298c11e74',
    'admin_email'  => 'help@rrfoundation.org'
];
