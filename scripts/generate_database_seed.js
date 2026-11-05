const fs = require('fs');
const path = require('path');

// 1. Read Categories
const catContent = fs.readFileSync(path.join(__dirname, '../lib/data/categories.ts'), 'utf8')
  .replace(/import\s+.*?;/g, '')
  .replace(/export\s+const\s+CATEGORIES:\s*Category\[\]\s*=\s*/, 'const CATEGORIES = ') + '; module.exports = CATEGORIES;';
const categories = eval(catContent);

// 2. Read Products
const prodContent = fs.readFileSync(path.join(__dirname, '../lib/data/products.ts'), 'utf8')
  .replace(/import\s+.*?;/g, '')
  .replace(/export\s+const\s+PRODUCTS:\s*Product\[\]\s*=\s*/, 'const PRODUCTS = ') + '; module.exports = PRODUCTS;';
const products = eval(prodContent);

// 3. Read Existing Enquiries
let enquiries = [];
const enquiryPath = path.join(__dirname, '../docs/enquiry_submissions.json');
if (fs.existsSync(enquiryPath)) {
  enquiries = JSON.parse(fs.readFileSync(enquiryPath, 'utf8'));
}

// 4. Default Website Settings
const defaultSettings = [
  { key: 'company_name', val: 'RR Foundations', group: 'general' },
  { key: 'legal_name', val: 'RR Foundations & Manufacturing Solutions', group: 'general' },
  { key: 'tagline', val: 'Manufacturing Ideas Into Products That Matter', group: 'general' },
  { key: 'email', val: 'help@rrfoundation.org', group: 'contact' },
  { key: 'phone', val: '+91 74280 45813', group: 'contact' },
  { key: 'phone_raw', val: '917428045813', group: 'contact' },
  { key: 'address', val: 'Shop No. 12, Om Vihar, Opposite Metro Pillar No. 702, New Delhi – 110059, India', group: 'contact' },
  { key: 'hours', val: 'Monday to Friday, 9:00 AM – 6:00 PM IST', group: 'contact' },
  { key: 'website', val: 'https://solutions.rrfoundations.org', group: 'general' },
  { key: 'logo_url', val: '/assets/rr_logo_white.png', group: 'branding' },
  { key: 'favicon_url', val: '/favicon.ico', group: 'branding' },
  { key: 'meta_title', val: 'RR Foundations | Premium B2B Manufacturing & Custom Products', group: 'seo' },
  { key: 'meta_description', val: 'Direct physical manufacturing of precision metal badges, conference ID card kits, custom acrylic & MDF products, corporate drinkware, and executive gift hampers in New Delhi.', group: 'seo' }
];

function escapeSql(val) {
  if (val === null || val === undefined) return 'NULL';
  if (typeof val === 'number') return val;
  if (typeof val === 'boolean') return val ? 1 : 0;
  if (typeof val === 'object') val = JSON.stringify(val);
  return "'" + String(val).replace(/\\/g, '\\\\').replace(/'/g, "\\'") + "'";
}

// Ensure database directories exist
const dbDir = path.join(__dirname, '../database');
const migrationsDir = path.join(dbDir, 'migrations');
const seedsDir = path.join(dbDir, 'seeds');
const publicDataDir = path.join(__dirname, '../public/data');

[dbDir, migrationsDir, seedsDir, publicDataDir].forEach(d => {
  if (!fs.existsSync(d)) fs.mkdirSync(d, { recursive: true });
});

// Write Schema SQL
const schemaSql = `-- ==============================================================================
-- RR FOUNDATIONS — DATABASE INITIALIZATION SCHEMA (001_initial_schema.sql)
-- Target: MySQL 8.0+ / MariaDB 10.5+ (Hostinger Premium Web Hosting)
-- ==============================================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Admins
CREATE TABLE IF NOT EXISTS \`admins\` (
  \`id\` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  \`email\` VARCHAR(191) NOT NULL UNIQUE,
  \`password_hash\` VARCHAR(255) NOT NULL,
  \`full_name\` VARCHAR(100) NOT NULL,
  \`role\` ENUM('superadmin', 'admin', 'editor') NOT NULL DEFAULT 'admin',
  \`status\` ENUM('active', 'inactive', 'suspended') NOT NULL DEFAULT 'active',
  \`failed_login_attempts\` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  \`lockout_until\` DATETIME NULL,
  \`last_login_at\` DATETIME NULL,
  \`last_login_ip\` VARCHAR(45) NULL,
  \`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  \`updated_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX \`idx_admins_email_status\` (\`email\`, \`status\`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Admin Sessions
CREATE TABLE IF NOT EXISTS \`admin_sessions\` (
  \`id\` VARCHAR(128) PRIMARY KEY,
  \`admin_id\` INT UNSIGNED NOT NULL,
  \`ip_address\` VARCHAR(45) NOT NULL,
  \`user_agent\` TEXT NULL,
  \`csrf_token\` VARCHAR(64) NOT NULL,
  \`last_activity\` INT UNSIGNED NOT NULL,
  \`expires_at\` DATETIME NOT NULL,
  INDEX \`idx_admin_sessions_admin\` (\`admin_id\`),
  INDEX \`idx_admin_sessions_expiry\` (\`expires_at\`),
  CONSTRAINT \`fk_sessions_admin\` FOREIGN KEY (\`admin_id\`) 
    REFERENCES \`admins\` (\`id\`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Categories
CREATE TABLE IF NOT EXISTS \`categories\` (
  \`id\` VARCHAR(64) PRIMARY KEY,
  \`name\` VARCHAR(150) NOT NULL,
  \`slug\` VARCHAR(150) NOT NULL UNIQUE,
  \`description\` TEXT NOT NULL,
  \`image\` VARCHAR(255) NOT NULL,
  \`banner_image\` VARCHAR(255) NULL,
  \`icon\` VARCHAR(64) NULL,
  \`featured_product_count\` INT UNSIGNED NOT NULL DEFAULT 0,
  \`highlights\` JSON NULL,
  \`display_order\` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  \`status\` ENUM('published', 'draft', 'archived') NOT NULL DEFAULT 'published',
  \`seo_title\` VARCHAR(255) NULL,
  \`seo_description\` TEXT NULL,
  \`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  \`updated_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX \`idx_categories_slug\` (\`slug\`),
  INDEX \`idx_categories_status_order\` (\`status\`, \`display_order\`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Products
CREATE TABLE IF NOT EXISTS \`products\` (
  \`id\` VARCHAR(64) PRIMARY KEY,
  \`title\` VARCHAR(255) NOT NULL,
  \`slug\` VARCHAR(255) NOT NULL UNIQUE,
  \`sku\` VARCHAR(100) NULL UNIQUE,
  \`category_id\` VARCHAR(64) NOT NULL,
  \`category_name\` VARCHAR(150) NOT NULL,
  \`short_description\` TEXT NOT NULL,
  \`full_description\` LONGTEXT NOT NULL,
  \`thumbnail\` VARCHAR(255) NOT NULL,
  \`images\` JSON NOT NULL,
  \`materials\` JSON NULL,
  \`specifications\` JSON NULL,
  \`featured\` TINYINT(1) NOT NULL DEFAULT 0,
  \`min_quantity\` INT UNSIGNED NOT NULL DEFAULT 100,
  \`tags\` JSON NULL,
  \`aliases\` JSON NULL,
  \`status\` ENUM('published', 'draft', 'archived') NOT NULL DEFAULT 'published',
  \`display_order\` INT UNSIGNED NOT NULL DEFAULT 0,
  \`seo_title\` VARCHAR(255) NULL,
  \`seo_description\` TEXT NULL,
  \`canonical_url\` VARCHAR(255) NULL,
  \`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  \`updated_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX \`idx_products_slug\` (\`slug\`),
  INDEX \`idx_products_category\` (\`category_id\`),
  INDEX \`idx_products_status\` (\`status\`),
  INDEX \`idx_products_featured\` (\`featured\`),
  INDEX \`idx_products_sku\` (\`sku\`),
  FULLTEXT INDEX \`ft_products_search\` (\`title\`, \`short_description\`),
  CONSTRAINT \`fk_products_category\` FOREIGN KEY (\`category_id\`) 
    REFERENCES \`categories\` (\`id\`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. Product Category Relations
CREATE TABLE IF NOT EXISTS \`product_category_relations\` (
  \`product_id\` VARCHAR(64) NOT NULL,
  \`category_id\` VARCHAR(64) NOT NULL,
  \`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (\`product_id\`, \`category_id\`),
  CONSTRAINT \`fk_pcr_product\` FOREIGN KEY (\`product_id\`) 
    REFERENCES \`products\` (\`id\`) ON DELETE CASCADE,
  CONSTRAINT \`fk_pcr_category\` FOREIGN KEY (\`category_id\`) 
    REFERENCES \`categories\` (\`id\`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. Leads (Enquiries)
CREATE TABLE IF NOT EXISTS \`leads\` (
  \`id\` VARCHAR(64) PRIMARY KEY,
  \`full_name\` VARCHAR(100) NOT NULL,
  \`company_name\` VARCHAR(100) NULL,
  \`email\` VARCHAR(120) NOT NULL,
  \`phone\` VARCHAR(35) NOT NULL,
  \`product_name\` VARCHAR(200) NULL,
  \`category\` VARCHAR(100) NULL,
  \`quantity\` VARCHAR(50) NULL,
  \`message\` TEXT NOT NULL,
  \`source\` VARCHAR(50) NOT NULL DEFAULT 'Website',
  \`status\` ENUM('New', 'Contacted', 'Qualified', 'Quotation Sent', 'Negotiation', 'Converted', 'Lost', 'Spam') NOT NULL DEFAULT 'New',
  \`is_starred\` TINYINT(1) NOT NULL DEFAULT 0,
  \`assigned_to\` INT UNSIGNED NULL,
  \`email_dispatched\` TINYINT(1) NOT NULL DEFAULT 0,
  \`ip_address\` VARCHAR(45) NULL,
  \`follow_up_date\` DATE NULL,
  \`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  \`updated_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX \`idx_leads_status\` (\`status\`),
  INDEX \`idx_leads_created\` (\`created_at\`),
  INDEX \`idx_leads_assigned\` (\`assigned_to\`),
  INDEX \`idx_leads_email\` (\`email\`),
  CONSTRAINT \`fk_leads_assigned\` FOREIGN KEY (\`assigned_to\`) 
    REFERENCES \`admins\` (\`id\`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. Lead Notes
CREATE TABLE IF NOT EXISTS \`lead_notes\` (
  \`id\` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  \`lead_id\` VARCHAR(64) NOT NULL,
  \`admin_id\` INT UNSIGNED NULL,
  \`admin_name\` VARCHAR(100) NOT NULL,
  \`note\` TEXT NOT NULL,
  \`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX \`idx_lead_notes_lead\` (\`lead_id\`),
  CONSTRAINT \`fk_notes_lead\` FOREIGN KEY (\`lead_id\`) 
    REFERENCES \`leads\` (\`id\`) ON DELETE CASCADE,
  CONSTRAINT \`fk_notes_admin\` FOREIGN KEY (\`admin_id\`) 
    REFERENCES \`admins\` (\`id\`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8. Lead Activity
CREATE TABLE IF NOT EXISTS \`lead_activity\` (
  \`id\` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  \`lead_id\` VARCHAR(64) NOT NULL,
  \`admin_id\` INT UNSIGNED NULL,
  \`action\` VARCHAR(60) NOT NULL,
  \`details\` TEXT NULL,
  \`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX \`idx_lead_activity_lead\` (\`lead_id\`),
  CONSTRAINT \`fk_activity_lead\` FOREIGN KEY (\`lead_id\`) 
    REFERENCES \`leads\` (\`id\`) ON DELETE CASCADE,
  CONSTRAINT \`fk_activity_admin\` FOREIGN KEY (\`admin_id\`) 
    REFERENCES \`admins\` (\`id\`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 9. Media Library
CREATE TABLE IF NOT EXISTS \`media\` (
  \`id\` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  \`filename\` VARCHAR(255) NOT NULL,
  \`original_name\` VARCHAR(255) NOT NULL,
  \`file_path\` VARCHAR(255) NOT NULL,
  \`file_size\` INT UNSIGNED NOT NULL,
  \`mime_type\` VARCHAR(100) NOT NULL,
  \`width\` SMALLINT UNSIGNED NULL,
  \`height\` SMALLINT UNSIGNED NULL,
  \`alt_text\` VARCHAR(255) NULL,
  \`uploaded_by\` INT UNSIGNED NULL,
  \`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX \`idx_media_filename\` (\`filename\`),
  INDEX \`idx_media_created\` (\`created_at\`),
  CONSTRAINT \`fk_media_admin\` FOREIGN KEY (\`uploaded_by\`) 
    REFERENCES \`admins\` (\`id\`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 10. Website Settings
CREATE TABLE IF NOT EXISTS \`website_settings\` (
  \`setting_key\` VARCHAR(100) PRIMARY KEY,
  \`setting_value\` LONGTEXT NULL,
  \`setting_group\` VARCHAR(50) NOT NULL DEFAULT 'general',
  \`updated_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX \`idx_settings_group\` (\`setting_group\`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 11. SEO Redirects
CREATE TABLE IF NOT EXISTS \`seo_redirects\` (
  \`id\` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  \`source_path\` VARCHAR(255) NOT NULL UNIQUE,
  \`target_path\` VARCHAR(255) NOT NULL,
  \`status_code\` SMALLINT UNSIGNED NOT NULL DEFAULT 301,
  \`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX \`idx_redirects_source\` (\`source_path\`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 12. Activity Logs
CREATE TABLE IF NOT EXISTS \`activity_logs\` (
  \`id\` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  \`admin_id\` INT UNSIGNED NULL,
  \`admin_name\` VARCHAR(100) NULL,
  \`action\` VARCHAR(100) NOT NULL,
  \`entity_type\` VARCHAR(50) NOT NULL,
  \`entity_id\` VARCHAR(100) NULL,
  \`details\` TEXT NULL,
  \`ip_address\` VARCHAR(45) NULL,
  \`user_agent\` TEXT NULL,
  \`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX \`idx_logs_admin\` (\`admin_id\`),
  INDEX \`idx_logs_action\` (\`action\`),
  INDEX \`idx_logs_entity\` (\`entity_type\`, \`entity_id\`),
  INDEX \`idx_logs_created\` (\`created_at\`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
`;

fs.writeFileSync(path.join(migrationsDir, '001_initial_schema.sql'), schemaSql, 'utf8');
console.log('Created database/migrations/001_initial_schema.sql');

// Generate Seed SQL
let seedSql = `-- ==============================================================================
-- RR FOUNDATIONS — SEED DATA SCRIPT (001_initial_catalogue_seed.sql)
-- Populates 10 Categories, 278 Verified Products, Initial Leads, and Settings
-- ==============================================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Insert Categories
`;

categories.forEach((cat, idx) => {
  seedSql += `INSERT INTO \`categories\` (\`id\`, \`name\`, \`slug\`, \`description\`, \`image\`, \`featured_product_count\`, \`highlights\`, \`display_order\`, \`status\`)
VALUES (${escapeSql(cat.id)}, ${escapeSql(cat.name)}, ${escapeSql(cat.slug)}, ${escapeSql(cat.description)}, ${escapeSql(cat.image)}, ${cat.featuredProductCount || 0}, ${escapeSql(cat.highlights)}, ${idx}, 'published')
ON DUPLICATE KEY UPDATE \`name\` = VALUES(\`name\`), \`description\` = VALUES(\`description\`), \`image\` = VALUES(\`image\`);\n`;
});

seedSql += `\n-- 2. Insert Products (${products.length} verified products)\n`;

products.forEach((prod, idx) => {
  const sku = prod.id.replace('prod_', 'RRF-').toUpperCase();
  seedSql += `INSERT INTO \`products\` (\`id\`, \`title\`, \`slug\`, \`sku\`, \`category_id\`, \`category_name\`, \`short_description\`, \`full_description\`, \`thumbnail\`, \`images\`, \`materials\`, \`specifications\`, \`featured\`, \`min_quantity\`, \`tags\`, \`aliases\`, \`status\`, \`display_order\`, \`seo_title\`, \`seo_description\`)
VALUES (
  ${escapeSql(prod.id)},
  ${escapeSql(prod.title)},
  ${escapeSql(prod.slug)},
  ${escapeSql(sku)},
  ${escapeSql(prod.category)},
  ${escapeSql(prod.categoryName)},
  ${escapeSql(prod.shortDescription)},
  ${escapeSql(prod.fullDescription)},
  ${escapeSql(prod.thumbnail)},
  ${escapeSql(prod.images || [prod.thumbnail])},
  ${escapeSql(prod.materials || [])},
  ${escapeSql(prod.specifications || {})},
  ${prod.featured ? 1 : 0},
  ${prod.minQuantity || 100},
  ${escapeSql(prod.tags || [])},
  ${escapeSql(prod.aliases || [])},
  'published',
  ${idx},
  ${escapeSql(prod.seoTitle || prod.title)},
  ${escapeSql(prod.seoDescription || prod.shortDescription)}
)
ON DUPLICATE KEY UPDATE 
  \`title\` = VALUES(\`title\`),
  \`short_description\` = VALUES(\`short_description\`),
  \`full_description\` = VALUES(\`full_description\`),
  \`thumbnail\` = VALUES(\`thumbnail\`);\n`;
});

seedSql += `\n-- 3. Insert Existing Leads (${enquiries.length} customer records)\n`;

enquiries.forEach(enq => {
  seedSql += `INSERT INTO \`leads\` (\`id\`, \`full_name\`, \`company_name\`, \`email\`, \`phone\`, \`product_name\`, \`category\`, \`quantity\`, \`message\`, \`status\`, \`created_at\`)
VALUES (
  ${escapeSql(enq.id)},
  ${escapeSql(enq.fullName)},
  ${escapeSql(enq.companyName || null)},
  ${escapeSql(enq.email)},
  ${escapeSql(enq.phone)},
  ${escapeSql(enq.productName || null)},
  ${escapeSql(enq.category || null)},
  ${escapeSql(enq.quantity || null)},
  ${escapeSql(enq.message)},
  ${escapeSql(enq.status || 'New')},
  ${escapeSql(enq.timestamp ? enq.timestamp.replace('T', ' ').replace('Z', '').split('.')[0] : new Date().toISOString().slice(0, 19).replace('T', ' '))}
)
ON DUPLICATE KEY UPDATE \`status\` = VALUES(\`status\`);\n`;
});

seedSql += `\n-- 4. Insert Website Settings\n`;

defaultSettings.forEach(s => {
  seedSql += `INSERT INTO \`website_settings\` (\`setting_key\`, \`setting_value\`, \`setting_group\`)
VALUES (${escapeSql(s.key)}, ${escapeSql(s.val)}, ${escapeSql(s.group)})
ON DUPLICATE KEY UPDATE \`setting_value\` = VALUES(\`setting_value\`);\n`;
});

seedSql += `\nSET FOREIGN_KEY_CHECKS = 1;\n`;

fs.writeFileSync(path.join(seedsDir, '001_initial_catalogue_seed.sql'), seedSql, 'utf8');
console.log('Created database/seeds/001_initial_catalogue_seed.sql');

// Also write initial public data JSON files for instant fallback
fs.writeFileSync(path.join(publicDataDir, 'categories.json'), JSON.stringify(categories, null, 2), 'utf8');
fs.writeFileSync(path.join(publicDataDir, 'catalog.json'), JSON.stringify(products, null, 2), 'utf8');
const settingsMap = {};
defaultSettings.forEach(s => settingsMap[s.key] = s.val);
fs.writeFileSync(path.join(publicDataDir, 'settings.json'), JSON.stringify(settingsMap, null, 2), 'utf8');
console.log('Generated public/data/catalog.json, categories.json, settings.json');
