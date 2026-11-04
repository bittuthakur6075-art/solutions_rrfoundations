# RR FOUNDATIONS — HOSTINGER PRODUCTION FINAL SAFETY AUDIT & DEPLOYMENT CHECKLIST

**Project:** RR Foundations (B2B Manufacturing & Physical Product Showcase)  
**Target Domain:** `https://solutions.rrfoundations.org/`  
**Host Environment:** Hostinger Premium Web Hosting (Apache + PHP Engine)  
**Archive Package:** `rrfoundations-hostinger-deployment.zip` (77.5 MB)  
**Date:** November 4, 2026  
**Auditor:** Senior Frontend Architect & Production QA Lead  
**Deployment Policy:** **STAGED LOCALLY — AWAITING EXPLICIT USER APPROVAL BEFORE LIVE DEPLOYMENT**

---

## 1. Safety Audit Findings & Status Summary

| Audit Section | Description | Status | Verdict |
| :--- | :--- | :---: | :--- |
| **1. Enquiry Data Security** | Hardened `enquiry.php`, honeypot spam protection, `LOCK_EX` concurrency, path disclosure prevention | **PASSED** | Customer submissions secured; error suppression active. |
| **2. Email Delivery** | Recipient `help@rrfoundation.org`, native PHP `mail()` fallback + authenticated SMTP instructions | **PASSED** *(Delivery unverified until live)* | Zero credentials in frontend; safe error handling. |
| **3. Product SEO & Prerendering** | 268 product routes prerendered with canonical URLs, accurate specs & Product JSON-LD schema | **PASSED** | 277 total canonical URLs in `sitemap.xml`; zero duplicates. |
| **4. Apache `.htaccess` Hardening** | HTTPS enforcement, SPA rewriting, sensitive directory blocking, cache & security headers | **PASSED** | Reverse proxy loop safe; `data/` and config files forbidden. |
| **5. Production Build & Packaging** | `npm run build` generates `dist/`; standalone deployment archive created | **PASSED** | `rrfoundations-hostinger-deployment.zip` with `index.html` at root. |

---

## 2. Detailed Checklist & Verification Results

### 2.1 Enquiry Data Security
- [x] **File Permissions & Path Disclosure:** `public/api/enquiry.php` includes `error_reporting(0); ini_set('display_errors', '0');` to prevent internal server paths from leaking in error states.
- [x] **Concurrent Write Protection:** Data persistence utilizes `flock($fp, LOCK_EX)` to guarantee atomic updates without race-condition file corruption.
- [x] **Private Storage Isolation:** The endpoint automatically checks for `private_data` outside `public_html`. If written inside `public_html/data`, directory access is blocked by `.htaccess` (`Require all denied`) and an empty `index.html`.
- [x] **Direct Web Access Block:** Direct requests to `data/` or any `*.json` file return `403 Forbidden` via Apache rules.
- [x] **Spam Defense:** Server-side honeypot trap (`website_hp`) silently traps bots without saving spam.
- [x] **Input Boundary Constraints:** Enforces field length limits (`fullName` 100, `email` 100, `phone` 25, `message` 3000 chars) and sanitizes special characters.

### 2.2 Email Delivery Architecture
- [x] **Notification Recipient:** Verified hardcoded to **`help@rrfoundation.org`** across all files (`public/api/enquiry.php`, `lib/utils.ts`, `components/layout/Header.tsx`, `components/layout/Footer.tsx`, and prerender scripts).
  - *Domain Distinction Note:* The web production domain is `solutions.rrfoundations.org` (plural "foundations"), whereas the official Google Workspace / Hostinger mailbox is `help@rrfoundation.org` (singular "foundation"). This distinction is verified and consistent.
- [x] **Zero Credential Exposure:** No SMTP passwords, tokens, or private keys exist in client JavaScript bundles.
- [x] **Delivery Engine:** Utilizes PHP's native `mail()` dispatch with formatted MIME headers and UTF-8 encoding.
- [x] **Safe Confirmation:** Frontend receives an optimistic JSON confirmation `{ "success": true, "id": "enq_..." }` while server errors are logged safely.
- [!] **Unverified Check:** *Actual email inbox receipt at `help@rrfoundation.org` cannot be verified until the PHP script runs on Hostinger's live mail exchange.*

### 2.3 Product SEO & Prerendering Architecture
- [x] **Reconciled Route Counts (100% 1:1 Parity):**
  - **Catalogue Source:** Exactly 268 unique products defined in `lib/data/products.ts`.
  - **Core Static Routes:** Exactly 9 core pages: Homepage (`/`), `/about`, `/products`, `/manufacturing`, `/industries`, `/contact`, `/request-quote`, `/privacy-policy`, `/terms-and-conditions`.
  - **Sitemap XML:** Exactly **277 canonical entries** generated in `public/sitemap.xml` and `dist/sitemap.xml` (9 core pages + 268 products).
  - **Prerendered HTML Files:** Exactly **277 static HTML files** generated on disk:
    - `dist/index.html` (Homepage root)
    - 8 core sub-page HTML files: `dist/<page>/index.html`
    - 268 individual product HTML files: `dist/products/<slug>/index.html`
  - **Route Reconciliation Verdict:** Resolved the previous 276 count by explicitly prerendering and logging `dist/index.html` as the 9th core route alongside the 8 sub-pages and 268 products. Zero missing routes, zero duplicate entries.
- [x] **Unique Product Titles & Descriptions:** Every product contains its dedicated title, description, and canonical URL pointing to `https://solutions.rrfoundations.org/products/<slug>`.
- [x] **Product Structured Data (JSON-LD):** Each product includes Schema.org `@type: "Product"` with accurate title, category, manufacturer, Indian Rupee (`INR`) currency, and high-resolution thumbnail URL.
- [x] **XML Sitemap Integrity:** `sitemap.xml` contains exactly **277 canonical entries** with matching canonical tags and zero duplicates.
- [x] **Robots.txt:** Verified allowing all search engine bots and referencing the canonical sitemap.

### 2.4 Apache `.htaccess` Configuration
- [x] **HTTPS Enforcement:** Multi-condition check (`HTTPS !=on`, `HTTP:X-Forwarded-Proto !=https`, `HTTP:X-Forwarded-SSL !=on`) preventing redirect loops on Hostinger and Cloudflare.
- [x] **API Route Passthrough:** Rewrite rule routes `/api/enquiry` directly to `/api/enquiry.php`.
- [x] **Prerendered Route Preservation:** Serves `about/index.html`, `products/index.html`, and `products/<slug>/index.html` directly from disk.
- [x] **SPA Routing Fallback:** Rewrites client-side navigation requests to `index.html`.
- [x] **Sensitive File Forbid Rule:** Denies access to `.(env|git|json|lock|config|bak|sql|log|md|sh|ps1)`.
- [x] **Security Headers:** Emits `X-Content-Type-Options: nosniff`, `X-Frame-Options: SAMEORIGIN`, and `Referrer-Policy: strict-origin-when-cross-origin`.

### 2.5 Production Build & Package
- [x] **Build Verification:** `npm run build` compiled all client assets in 3.90s.
- [x] **Deployment Archive:** `rrfoundations-hostinger-deployment.zip` (77.5 MB) created with `index.html` and `.htaccess` at the root.

---

## 3. Manual Configuration Required on Hostinger (Post-Upload)

1. **Activate SSL:**
   - In Hostinger hPanel → **Security** → **SSL**.
   - Verify that **Let's Encrypt SSL** is active for `solutions.rrfoundations.org`.
   - Enable **Force HTTPS** toggle.
2. **Recommended Authenticated SMTP (Optional but Recommended for High Deliverability):**
   - Hostinger provides free business email accounts (e.g. `help@rrfoundation.org` or `sales@rrfoundation.org`).
   - If PHP `mail()` is delayed by spam filters, configure Hostinger Webmail SMTP:
     - **Host:** `smtp.hostinger.com`
     - **Port:** `465` (SSL) or `587` (TLS)
     - **Authentication:** Standard email password (kept in a private file outside `public_html`).

---

## 4. Exact Hostinger Upload Instructions

1. Log into your **Hostinger Account** → Navigate to **Websites** → Select `solutions.rrfoundations.org`.
2. Open **File Manager** and enter the document root (usually `public_html` or `public_html/solutions`).
3. If default or placeholder files exist in the document root, backup and remove them.
4. Upload `rrfoundations-hostinger-deployment.zip` to the document root.
5. Right-click `rrfoundations-hostinger-deployment.zip` → Select **Extract** → Destination: `.` (current directory).
6. Verify that `index.html`, `.htaccess`, `sitemap.xml`, `robots.txt`, and the `assets/`, `api/`, and `products/` directories are directly in the document root.
7. Delete `rrfoundations-hostinger-deployment.zip` after extraction.

---

## 5. Safe Live-Server Testing & Email Delivery Verification Protocol

Since email delivery via PHP `mail()` depends on Hostinger's MTA (Mail Transfer Agent) and DNS SPF/DKIM records, follow this exact procedure once the archive is extracted:

### 5.1 Step-by-Step Live Testing Procedure
1. **Frontend RFQ Submission Test:**
   - Visit `https://solutions.rrfoundations.org/request-quote` (or open the "Request a Quote" modal on any product page).
   - Fill in:
     - **Full Name:** `Hostinger Verification QA`
     - **Email:** A test client email address you have access to.
     - **Phone:** `+91 98765 43210`
     - **Product:** `Metal Badge Pin (Gold Finish)`
     - **Quantity:** `500`
     - **Message:** `Live server deliverability and UTF-8 verification test.`
   - Submit the form. Confirm the green success banner appears with a generated enquiry tracking ID (e.g., `enq_...`).

2. **Check Official Inbox (`help@rrfoundation.org`):**
   - Log into Webmail or your mail client for `help@rrfoundation.org`.
   - Look for email with subject: `New B2B Manufacturing RFQ: Metal Badge Pin (Gold Finish) [enq_...]`.
   - Check headers to verify sender: `From: RR Foundations Web <noreply@rrfoundations.org>`.

3. **Check Spam / Junk Folder & SPF/DKIM Alignment:**
   - If the notification does not appear in the primary inbox within 2 minutes, check the **Spam / Junk** folder.
   - If found in Spam:
     - Check email authentication headers for `spf=pass` and `dkim=pass`.
     - In Hostinger hPanel → **DNS Zone Editor**, ensure the SPF record includes Hostinger's mail server: `v=spf1 include:_spf.mail.hostinger.com ~all`.

4. **PHP Error Logging Inspection:**
   - If no email is received at all, check Hostinger File Manager for `public_html/error_log` or `public_html/api/error_log`.
   - Verify that no PHP exceptions or `mail()` warnings were raised.

5. **Datastore Fallback Audit:**
   - In Hostinger File Manager, check `public_html/data/enquiry_submissions.json` (or `private_data/enquiry_submissions.json`).
   - Confirm that the submission was safely written to the datastore regardless of external mail delivery status.

---

## 6. Local Development Note (Fix for Screenshot / Port 3000)

- **Issue Observed:** An earlier running Next.js instance on port 3000 caused 404 errors for `_next/static/css/...` because the Next.js `.next` cache had been replaced by the React + Vite migration build.
- **Resolution:**
  - The zombie Next.js dev process on port 3000 was stopped.
  - `vite.config.ts` was updated with `server: { port: 3000 }` and `preview: { port: 3000 }`.
  - Running `npm run dev` now serves the React + Vite application on `http://localhost:3000/`.
  - Running `npm run preview` now serves the static prerendered production build on `http://localhost:3000/`.

---

## 7. Rollback Instructions

If you ever wish to revert to the Next.js 14 version:
- **Git Branch:** `nextjs-production-ready`
- Command to restore locally:
  ```bash
  git checkout nextjs-production-ready
  ```
- The original Next.js implementation remains 100% intact with zero code loss.
