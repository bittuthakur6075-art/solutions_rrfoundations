# RR FOUNDATIONS — HOSTINGER DEPLOYMENT GUIDE
## Step-by-Step Installation, Setup, and Operational Runbook

**Target Platform:** Hostinger Premium Web Hosting  
**Control Panel:** Hostinger hPanel  
**Database:** Hostinger MySQL Database (v8.0 / MariaDB 10.5+)  
**PHP Version:** 8.1 / 8.2 / 8.3  

---

## 1. Pre-Deployment Preparation

### 1.1 Local Build
Before uploading files to Hostinger, generate the production frontend build:

```bash
# 1. Install dependencies
npm install

# 2. Build static React SPA, sitemap, and prerendered routes
npm run build
```

This generates the complete static output in `dist/`.

---

## 2. Hostinger File Structure Setup

In Hostinger File Manager or via FTP (FileZilla), structure your hosting space as follows:

```text
/home/u123456789/
├── private_config/                        <-- Create this folder ABOVE public_html
│   └── db_config.php                      <-- Your secure database configuration
└── domains/solutions.rrfoundations.org/public_html/
    ├── .htaccess
    ├── index.html
    ├── sitemap.xml
    ├── robots.txt
    ├── assets/
    │   ├── products/
    │   └── uploads/
    │       └── .htaccess                  <-- Hardened upload .htaccess
    ├── data/
    │   ├── catalog.json
    │   ├── categories.json
    │   └── settings.json
    └── api/
        ├── enquiry.php
        ├── config.php
        └── admin/
            ├── auth.php
            ├── dashboard.php
            ├── products.php
            ├── categories.php
            ├── leads.php
            ├── media.php
            ├── settings.php
            ├── publish.php
            ├── setup.php
            └── logs.php
```

---

## 3. Database Creation & Configuration

1. Log in to **Hostinger hPanel**.
2. Navigate to **Databases -> Management**.
3. Create a new MySQL Database:
   - **Database Name:** `u123456789_rrf_admin`
   - **Username:** `u123456789_rrf_user`
   - **Password:** Generate a strong random password (24+ characters).
4. Open **phpMyAdmin** for this database.
5. Import `database/migrations/001_initial_schema.sql`.
6. Import `database/seeds/001_initial_catalogue_seed.sql` to populate all 268+ products, 10 categories, and existing customer enquiries.

---

## 4. Private Configuration Setup

Create `/home/u123456789/private_config/db_config.php`:

```php
<?php
// /home/u123456789/private_config/db_config.php
return [
    'db_host'     => 'localhost',
    'db_name'     => 'u123456789_rrf_admin',
    'db_user'     => 'u123456789_rrf_user',
    'db_pass'     => 'YOUR_STRONG_PASSWORD_HERE',
    'db_charset'  => 'utf8mb4',
    'app_env'     => 'production',
    'session_key' => 'YOUR_RANDOM_64_CHAR_HEX_KEY',
    'admin_email' => 'help@rrfoundation.org'
];
```

Ensure file permissions are set to `0600` or `0640`.

---

## 5. Initial Administrator Account Creation

You can initialize the first administrator in one of two secure ways:

### Option A: Using the One-Time Setup Endpoint
1. Visit: `https://solutions.rrfoundations.org/api/admin/setup.php` in your browser.
2. Complete the setup form with the Superadmin Name, Email, and Password.
3. Upon submission, the user is created and `setup.php` automatically self-destructs.

### Option B: Direct Password Hash via phpMyAdmin
Generate a secure password hash using PHP:
```php
echo password_hash('YourSecurePassword', PASSWORD_BCRYPT);
```
Insert into the `admins` table:
```sql
INSERT INTO admins (email, password_hash, full_name, role, status)
VALUES ('admin@rrfoundations.org', '$2y$10$...hash...', 'Primary Administrator', 'superadmin', 'active');
```

---

## 6. Accessing the Admin Management Panel

Visit:
`https://solutions.rrfoundations.org/admin`

Log in with your administrator email and password.

---

## 7. Post-Deployment Verification Checklist

- [ ] Log in at `/admin` with valid credentials.
- [ ] Confirm Dashboard displays accurate counts for products (268+), categories (10), and enquiries.
- [ ] Test modifying a product's description or tags and verify persistence.
- [ ] Test uploading an image to the Media Library.
- [ ] Click "Publish to Website" and verify `/data/catalog.json` and `/sitemap.xml` are updated.
- [ ] Submit a test enquiry on the public `/contact` page and verify it appears instantly under **Leads / Enquiries** in the admin panel.
