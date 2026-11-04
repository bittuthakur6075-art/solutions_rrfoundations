# RR FOUNDATIONS — HOSTINGER PREMIUM WEB HOSTING DEPLOYMENT GUIDE

**Project:** RR Foundations (B2B Manufacturing Showcase)  
**Production Domain:** `https://solutions.rrfoundations.org/`  
**Architecture:** Static Single Page Application (React 18 + Vite + Tailwind CSS)  
**Target Hosting:** Hostinger Premium Web Hosting (Apache + PHP Engine)  
**Status:** **MIGRATION COMPLETE & STAGED FOR DEPLOYMENT**  
**Policy:** **DO NOT DEPLOY WITHOUT EXPLICIT USER APPROVAL**

---

## 1. Build Instructions & Output Verification

### 1.1 Local Build Command
Run the standard build command:
```bash
npm run build
```
This triggers:
1. `vite build` — Compiles and minifies React, CSS, and assets into static bundles.
2. `node scripts/prerender.js` — Generates prerendered static `index.html` entry points for all public routes (`/about`, `/products`, `/manufacturing`, `/industries`, `/contact`, `/request-quote`, `/privacy-policy`, `/terms-and-conditions`).

### 1.2 Output Directory
- **Path:** `C:\Code\solutions_rrfoundations\dist`
- **Output Artifacts:**
  - `dist/index.html` (Homepage SPA root)
  - `dist/about/index.html` (Prerendered About page with Breadcrumb schema)
  - `dist/products/index.html` (Prerendered Product Catalogue with Collection schema)
  - `dist/manufacturing/index.html` (Prerendered Manufacturing page)
  - `dist/industries/index.html` (Prerendered Industries page)
  - `dist/contact/index.html` (Prerendered Contact page with ContactPage schema)
  - `dist/request-quote/index.html` (Prerendered RFQ page)
  - `dist/privacy-policy/index.html` (Prerendered Legal Privacy Policy)
  - `dist/terms-and-conditions/index.html` (Prerendered Commercial Terms)
  - `dist/api/enquiry.php` (Native Hostinger PHP form handler)
  - `dist/.htaccess` (Apache mod_rewrite, HTTPS enforcement, and cache rules)
  - `dist/sitemap.xml` (277 canonical URLs)
  - `dist/robots.txt` (Search crawler directives)
  - `dist/assets/` (Minified JS, CSS, and 268 high-res product photos)

---

## 2. Hostinger File Manager Upload Instructions

### 2.1 Domain Document Root
In Hostinger hPanel:
- If `solutions.rrfoundations.org` is a **Subdomain**:
  The document root is usually: `public_html/solutions` or `domains/solutions.rrfoundations.org/public_html`.
- If `solutions.rrfoundations.org` is the **Main Domain**:
  The document root is: `public_html/`.

### 2.2 Upload Step-by-Step
1. Open **Hostinger hPanel** → Go to **Websites** → Select your domain/subdomain → Click **File Manager**.
2. Navigate into the document root folder (`public_html/` or `public_html/solutions`).
3. If previous temporary or default files exist (e.g. `default.php`), delete or move them to a backup folder.
4. Compress the **contents** of your local `dist/` directory into a `dist.zip` archive.
   *(Important: Zip the files inside `dist/`, not the `dist` folder itself).*
5. In Hostinger File Manager, click **Upload** → Select `dist.zip`.
6. Right-click `dist.zip` in File Manager → Click **Extract** → Choose current folder (`.`).
7. Confirm that `.htaccess`, `index.html`, `sitemap.xml`, `robots.txt`, and the `assets/` and `api/` folders are directly at the root level of your domain.
8. Delete the `dist.zip` file to save space.

---

## 3. Apache SPA & Backend Routing (`.htaccess`)

The included `.htaccess` file is pre-configured and deployed inside `dist/`. It provides:
1. **Automatic HTTPS Redirection:** Forces all unencrypted HTTP traffic to `https://`.
2. **Native PHP Endpoint Routing:** Routes `/api/enquiry` directly to `/api/enquiry.php`.
3. **Static File Bypass:** Allows static files (`.css`, `.js`, `.png`, `.jpg`, `.xml`) to load directly.
4. **Prerendered Route Passthrough:** Serves `/products/index.html`, `/about/index.html`, etc. directly to crawlers.
5. **SPA Fallback:** Routes unmatched client-side navigation paths to `/index.html`.
6. **Security Hardening:** Forbids access to hidden files, git repositories, and JSON data stores.
7. **Cache Headers:** Caches static images, fonts, and CSS for 1 year while serving HTML fresh.

---

## 4. SSL & Security Setup

1. In **Hostinger hPanel** → Go to **Security** → **SSL**.
2. Ensure **Lifetime Free SSL (Let's Encrypt)** is installed and set to **Active** for `solutions.rrfoundations.org`.
3. Toggle **Force HTTPS** ON in hPanel (our `.htaccess` also enforces this at the server level).

---

## 5. B2B Enquiry Backend & Email Configuration

### 5.1 Native Hostinger PHP Endpoint (`/api/enquiry.php`)
- Requires **zero external subscriptions** or serverless infrastructure.
- Validates payload against minimum requirements, email regex, and phone length.
- Traps bot spam using a hidden honeypot (`website_hp`).
- Dispatches transactional email notifications directly to `help@rrfoundation.org` via Hostinger's PHP mail service.
- Persists submissions locally to `data/enquiry_submissions.json` (created automatically and protected from public HTTP access).

### 5.2 Optional External Webhook Configuration
If you prefer routing enquiries through an external provider (such as Formspree, Web3Forms, Resend, or Zapier):
1. Create a `.env.production` file locally:
   ```env
   VITE_API_ENQUIRY_URL=https://formspree.io/f/your_form_id
   ```
2. Re-run `npm run build` and upload the new `dist/`.

---

## 6. Pre-Launch Verification Checklist

After uploading to Hostinger, verify the live deployment:

- [ ] **Homepage:** Navigate to `https://solutions.rrfoundations.org/` — confirms 200 OK.
- [ ] **Direct Route Links:** Test `https://solutions.rrfoundations.org/about` and `https://solutions.rrfoundations.org/products` — confirms direct navigation without 404 errors.
- [ ] **Product Catalogue:** Verify all 268 products load, search filter works, and `#slug` deep-links scroll to the item.
- [ ] **RFQ Submission:** Submit a test inquiry via the modal or `/request-quote` — verify confirmation message.
- [ ] **Email Receipt:** Check inbox at `help@rrfoundation.org` for the test enquiry notification.
- [ ] **WhatsApp Links:** Tap the floating WhatsApp button and test connecting to `+91 74280 45813`.
- [ ] **Sitemap Check:** Verify `https://solutions.rrfoundations.org/sitemap.xml` renders valid XML.
- [ ] **Robots.txt Check:** Verify `https://solutions.rrfoundations.org/robots.txt` renders crawler rules.

---

## 7. Rollback Instructions

The complete original Next.js 14 implementation is preserved in Git:
- **Git Branch:** `nextjs-production-ready`
- To restore the Next.js project at any time:
  ```bash
  git checkout nextjs-production-ready
  npm run build
  npm run start
  ```
- No files from the original Next.js application have been destroyed or permanently deleted.
