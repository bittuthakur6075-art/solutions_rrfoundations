# RR FOUNDATIONS — DATABASE BACKUP & DISASTER RECOVERY
## Automated Backup Schedules, phpMyAdmin Procedures & Restoration Runbook

**Document Version:** 1.0.0  
**Scope:** RR Foundations MySQL Database & Uploaded Media Assets  
**RTO (Recovery Time Objective):** < 30 minutes  
**RPO (Recovery Point Objective):** < 24 hours  

---

## 1. Backup Strategy Overview

A 3-2-1 backup strategy is established for RR Foundations:
1. **Hostinger Daily Automated Snapshots:** Enabled via Hostinger Premium Web Hosting.
2. **Scheduled Database Dumps (`mysqldump` / Cron):** Stored in `/home/u123456789/private_data/backups/`.
3. **Manual On-Demand Backups:** Downloadable SQL export directly from the Admin Panel or phpMyAdmin before major catalog revisions.

---

## 2. Automated Daily Database Backup via Hostinger Cron

In **Hostinger hPanel -> Advanced -> Cron Jobs**, add the following daily scheduled task:

```bash
# Run every day at 02:00 AM IST
0 2 * * * mysqldump -u u123456789_rrf_user -p'YOUR_DB_PASSWORD' u123456789_rrf_admin | gzip > /home/u123456789/private_data/backups/db_backup_$(date +\%Y\%m\%d).sql.gz && find /home/u123456789/private_data/backups/ -name "db_backup_*.sql.gz" -mtime +30 -delete
```

This retains a rolling 30-day archive of gzipped database dumps outside `public_html`.

---

## 3. Manual Export Procedure via phpMyAdmin

1. Log into **Hostinger hPanel**.
2. Go to **Databases -> phpMyAdmin**.
3. Select `u123456789_rrf_admin`.
4. Click the **Export** tab in the top navigation.
5. Select **Export method:** `Quick - display only the minimal options`.
6. Select **Format:** `SQL`.
7. Click **Export** to download the timestamped `.sql` file to your secure local storage.

---

## 4. Media Assets Backup

Uploaded media files are stored in `public_html/assets/uploads/`.
To back up media assets:
1. In Hostinger File Manager, right-click `public_html/assets/uploads/`.
2. Select **Archive** -> create `media_backup_YYYYMMDD.zip`.
3. Move the archive to `/home/u123456789/private_data/backups/` or download locally.

---

## 5. Restoration Runbook

In the event of data corruption, accidental deletion, or disaster recovery:

### Step 1: Database Restoration
1. Access phpMyAdmin for the target database.
2. Select the database and choose **Check all -> Drop** (or create a clean target database).
3. Click the **Import** tab.
4. Choose the backup file (`.sql` or `.sql.gz`).
5. Ensure character set is `utf8mb4`.
6. Click **Import** and verify all tables are restored.

### Step 2: Regenerate Static Artifacts
1. Log into the Admin Panel at `/admin`.
2. Click **"Publish to Website"** on the top navigation bar.
3. The system will read all restored records from the database and republish `/data/catalog.json` and `/sitemap.xml`.
