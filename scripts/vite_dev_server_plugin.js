// scripts/vite_dev_server_plugin.js
// Provides local development API handlers matching the Hostinger PHP backend 1:1

const fs = require('fs');
const path = require('path');

let currentAdminPassword = 'Admin@RR2026!'; // Temporary demo password

let mockSession = {
  id: 1,
  email: 'admin@rrfoundations.org',
  fullName: 'Executive Administrator',
  role: 'superadmin',
  csrfToken: 'dev_csrf_token_rrfoundations_2026'
};

let isAuthenticated = false; // Strictly requires login
let leadNotes = {};
let leadActivities = {};

function getCatalog() {
  const p = path.join(__dirname, '../public/data/catalog.json');
  if (fs.existsSync(p)) {
    return JSON.parse(fs.readFileSync(p, 'utf8'));
  }
  return [];
}

function saveCatalog(data) {
  const p = path.join(__dirname, '../public/data/catalog.json');
  fs.writeFileSync(p, JSON.stringify(data, null, 2), 'utf8');

  // Also sync lib/data/products.ts so public storefront & prerenderers have the new products at the top immediately
  try {
    const tsPath = path.join(__dirname, '../lib/data/products.ts');
    const tsContent = `import { Product } from "@/types";\n\nexport const PRODUCTS: Product[] = ${JSON.stringify(data, null, 2)};\n`;
    fs.writeFileSync(tsPath, tsContent, 'utf8');
  } catch (err) {}
}

function getCategories() {
  const p = path.join(__dirname, '../public/data/categories.json');
  if (fs.existsSync(p)) {
    return JSON.parse(fs.readFileSync(p, 'utf8'));
  }
  return [];
}

function saveCategories(data) {
  const p = path.join(__dirname, '../public/data/categories.json');
  fs.writeFileSync(p, JSON.stringify(data, null, 2), 'utf8');
}

function getSettings() {
  const p = path.join(__dirname, '../public/data/settings.json');
  if (fs.existsSync(p)) {
    return JSON.parse(fs.readFileSync(p, 'utf8'));
  }
  return {};
}

function saveSettings(data) {
  const p = path.join(__dirname, '../public/data/settings.json');
  fs.writeFileSync(p, JSON.stringify(data, null, 2), 'utf8');
}

function getLeads() {
  const p = path.join(__dirname, '../docs/enquiry_submissions.json');
  if (fs.existsSync(p)) {
    return JSON.parse(fs.readFileSync(p, 'utf8'));
  }
  return [];
}

function saveLeads(data) {
  const p = path.join(__dirname, '../docs/enquiry_submissions.json');
  fs.writeFileSync(p, JSON.stringify(data, null, 2), 'utf8');
}

let activityLogs = [
  {
    id: 1,
    admin_name: 'Executive Administrator',
    action: 'system_initialized',
    entity_type: 'system',
    entity_id: 'init',
    details: 'Admin panel initialized in local dev mode',
    created_at: new Date().toISOString()
  }
];

function readBody(req) {
  return new Promise((resolve) => {
    let body = '';
    req.on('data', chunk => body += chunk);
    req.on('end', () => {
      try {
        resolve(body ? JSON.parse(body) : {});
      } catch (e) {
        resolve({});
      }
    });
  });
}

function sendJson(res, data, statusCode = 200) {
  res.statusCode = statusCode;
  res.setHeader('Content-Type', 'application/json');
  res.end(JSON.stringify(data));
}

function viteApiMockPlugin() {
  return {
    name: 'vite-api-mock-plugin',
    configureServer(server) {
      server.middlewares.use(async (req, res, next) => {
        const urlObj = new URL(req.url, 'http://localhost');
        const pathname = urlObj.pathname;
        const method = req.method;

        if (!pathname.startsWith('/api/')) {
          return next();
        }

        // 1. /api/enquiry
        if (pathname === '/api/enquiry' || pathname === '/api/enquiry.php') {
          if (method === 'POST') {
            const body = await readBody(req);
            const submissionId = 'enq_' + Date.now() + '_' + Math.random().toString(36).substring(2, 6);
            const newLead = {
              id: submissionId,
              timestamp: new Date().toISOString(),
              fullName: body.fullName || 'Anonymous User',
              companyName: body.companyName || '',
              email: body.email || '',
              phone: body.phone || '',
              productName: body.productName || 'General Requirement',
              category: body.category || 'General',
              quantity: body.quantity || 'Unspecified',
              message: body.message || '',
              status: 'New'
            };
            const leads = getLeads();
            leads.unshift(newLead);
            saveLeads(leads);
            return sendJson(res, {
              success: true,
              id: submissionId,
              message: 'Enquiry received successfully.'
            });
          }
        }

        // 2. /api/admin/auth
        if (pathname === '/api/admin/auth' || pathname === '/api/admin/auth.php') {
          const action = urlObj.searchParams.get('action') || 'me';
          if (action === 'login' && method === 'POST') {
            const body = await readBody(req);
            const inputEmail = (body.email || '').trim().toLowerCase();
            const inputPass = body.password || '';

            if (inputEmail === mockSession.email.toLowerCase() && inputPass === currentAdminPassword) {
              isAuthenticated = true;
              return sendJson(res, {
                success: true,
                user: {
                  id: mockSession.id,
                  email: mockSession.email,
                  fullName: mockSession.fullName,
                  role: mockSession.role
                },
                csrfToken: mockSession.csrfToken
              });
            } else {
              return sendJson(res, { success: false, message: 'Invalid administrative email or password. Access denied.' }, 401);
            }
          }

          if (action === 'me') {
            if (!isAuthenticated) {
              return sendJson(res, { success: false, message: 'Not authenticated' }, 401);
            }
            return sendJson(res, {
              success: true,
              user: {
                id: mockSession.id,
                email: mockSession.email,
                fullName: mockSession.fullName,
                role: mockSession.role
              },
              csrfToken: mockSession.csrfToken
            });
          }

          if (action === 'logout') {
            isAuthenticated = false;
            return sendJson(res, { success: true, message: 'Logged out successfully' });
          }

          if (action === 'change-password') {
            const body = await readBody(req);
            if (!isAuthenticated) return sendJson(res, { success: false, message: 'Unauthorized' }, 401);
            if (body.currentPassword !== currentAdminPassword) {
              return sendJson(res, { success: false, message: 'Current password does not match.' }, 400);
            }
            if (!body.newPassword || body.newPassword.length < 8) {
              return sendJson(res, { success: false, message: 'New password must be at least 8 characters.' }, 400);
            }
            currentAdminPassword = body.newPassword;
            return sendJson(res, { success: true, message: 'Password updated successfully. Keep your new password secure.' });
          }
        }

        // 3. /api/admin/dashboard
        if (pathname === '/api/admin/dashboard' || pathname === '/api/admin/dashboard.php') {
          const products = getCatalog();
          const categories = getCategories();
          const leads = getLeads();

          const activeProducts = products.filter(p => p.status !== 'archived' && p.status !== 'draft').length;
          const draftProducts = products.filter(p => p.status === 'draft').length;
          const archivedProducts = products.filter(p => p.status === 'archived').length;

          const newLeads = leads.filter(l => l.status === 'New').length;
          const inProgress = leads.filter(l => ['Contacted', 'Qualified', 'Quotation Sent', 'Negotiation'].includes(l.status)).length;
          const closed = leads.filter(l => ['Converted', 'Lost'].includes(l.status)).length;

          // Categorize products
          const catMap = {};
          categories.forEach(c => catMap[c.id] = { name: c.name, count: 0 });
          products.forEach(p => {
            if (catMap[p.category]) catMap[p.category].count++;
          });
          const productsByCategory = Object.values(catMap).map(c => ({ category_name: c.name, product_count: c.count }));

          // Leads by category
          const leadCatMap = {};
          leads.forEach(l => {
            const cat = l.category || 'General';
            leadCatMap[cat] = (leadCatMap[cat] || 0) + 1;
          });
          const leadsByCategory = Object.entries(leadCatMap).map(([k, v]) => ({ category_name: k, count: v }));

          return sendJson(res, {
            success: true,
            metrics: {
              totalProducts: products.length,
              activeProducts,
              draftProducts,
              archivedProducts,
              totalCategories: categories.length,
              totalLeads: leads.length,
              newLeads,
              inProgressLeads: inProgress,
              closedLeads: closed
            },
            charts: {
              monthlyTrends: [
                { month_label: 'Jun 2026', count: 12 },
                { month_label: 'Jul 2026', count: 18 },
                { month_label: 'Aug 2026', count: 24 },
                { month_label: 'Sep 2026', count: 32 },
                { month_label: 'Oct 2026', count: 28 },
                { month_label: 'Nov 2026', count: leads.length }
              ],
              leadsByCategory,
              productsByCategory
            },
            widgets: {
              recentLeads: leads.slice(0, 5),
              latestProducts: products.slice(0, 5).map(p => ({
                id: p.id,
                title: p.title,
                slug: p.slug,
                sku: p.sku || 'RRF-PRD',
                category_name: p.categoryName || p.category,
                thumbnail: p.thumbnail,
                status: p.status || 'published',
                created_at: p.created_at || '2026-11-04'
              })),
              recentActivity: activityLogs.slice(0, 10)
            }
          });
        }

        // 4. /api/admin/products
        if (pathname === '/api/admin/products' || pathname === '/api/admin/products.php') {
          let products = getCatalog();
          const action = urlObj.searchParams.get('action') || '';
          const id = urlObj.searchParams.get('id');

          if (method === 'GET' && action === 'export') {
            res.setHeader('Content-Type', 'text/csv');
            res.setHeader('Content-Disposition', 'attachment; filename="products.csv"');
            let csv = 'Product ID,Title,Slug,Category,Status,Thumbnail\n';
            products.forEach(p => {
              csv += `"${p.id}","${p.title}","${p.slug}","${p.categoryName || p.category}","${p.status || 'published'}","${p.thumbnail}"\n`;
            });
            return res.end(csv);
          }

          if (method === 'POST' && action === 'bulk') {
            const body = await readBody(req);
            const { ids, bulkAction } = body;
            products = products.map(p => {
              if (ids.includes(p.id)) {
                if (bulkAction === 'publish') p.status = 'published';
                if (bulkAction === 'unpublish') p.status = 'draft';
                if (bulkAction === 'archive') p.status = 'archived';
              }
              return p;
            });
            if (bulkAction === 'delete') {
              products = products.filter(p => !ids.includes(p.id));
            }
            saveCatalog(products);
            return sendJson(res, { success: true, count: ids.length, action: bulkAction });
          }

          if (method === 'GET') {
            if (id) {
              const item = products.find(p => p.id === id);
              if (!item) return sendJson(res, { success: false, message: 'Not found' }, 404);
              return sendJson(res, { success: true, product: item });
            }

            const search = (urlObj.searchParams.get('search') || '').toLowerCase();
            const category = urlObj.searchParams.get('category') || '';
            const status = urlObj.searchParams.get('status') || '';
            const page = parseInt(urlObj.searchParams.get('page') || '1', 10);
            const limit = parseInt(urlObj.searchParams.get('limit') || '25', 10);

            let filtered = products.filter(p => {
              const pStatus = p.status || 'published';
              if (category && category !== 'all' && p.category !== category) return false;
              if (status && status !== 'all' && pStatus !== status) return false;
              if (search) {
                const text = `${p.title} ${p.slug} ${p.sku || ''} ${p.shortDescription}`.toLowerCase();
                return text.includes(search);
              }
              return true;
            });

            const total = filtered.length;
            const start = (page - 1) * limit;
            const paged = filtered.slice(start, start + limit).map((p, idx) => ({
              ...p,
              status: p.status || 'published',
              sku: p.sku || `RRF-${p.id.replace('prod_', '').toUpperCase().slice(0, 10)}`,
              categoryId: p.categoryId || p.category || 'badges-lapel-pins',
              categoryName: p.categoryName || p.category_name || p.category || 'General',
              displayOrder: p.displayOrder ?? p.display_order ?? (start + idx + 1),
              minQuantity: p.minQuantity ?? p.min_quantity ?? 100,
              updatedAt: p.updatedAt || p.updated_at || new Date().toISOString()
            }));

            return sendJson(res, {
              success: true,
              products: paged,
              total,
              totalPages: Math.ceil(total / limit),
              pagination: {
                total,
                page,
                limit,
                totalPages: Math.ceil(total / limit)
              }
            });
          }

          if (method === 'POST') {
            const body = await readBody(req);
            const newId = 'prod_' + (body.categoryId || 'cat') + '_' + Math.random().toString(36).substring(2, 6);
            const categories = getCategories();
            const catObj = categories.find(c => c.id === body.categoryId);

            const newProd = {
              id: newId,
              title: body.title,
              slug: body.slug || body.title.toLowerCase().replace(/[^a-z0-9]+/g, '-'),
              sku: body.sku || 'RRF-' + Math.random().toString(36).substring(2, 6).toUpperCase(),
              category: body.categoryId,
              categoryName: catObj ? catObj.name : body.categoryId,
              shortDescription: body.shortDescription,
              fullDescription: body.fullDescription || body.shortDescription,
              thumbnail: body.thumbnail,
              images: body.images || [body.thumbnail],
              materials: body.materials || [],
              specifications: body.specifications || {},
              tags: body.tags || [],
              featured: Boolean(body.featured),
              minQuantity: Number(body.minQuantity || 100),
              status: body.status || 'published',
              displayOrder: Number(body.displayOrder || 0),
              seoTitle: body.seoTitle,
              seoDescription: body.seoDescription
            };

            products.unshift(newProd);
            saveCatalog(products);
            activityLogs.unshift({
              id: Date.now(),
              admin_name: mockSession.fullName,
              action: 'create_product',
              entity_type: 'products',
              entity_id: newId,
              details: `Created product ${newProd.title}`,
              created_at: new Date().toISOString()
            });

            return sendJson(res, { success: true, id: newId, product: newProd }, 201);
          }

          if (method === 'PUT') {
            const body = await readBody(req);
            const idx = products.findIndex(p => p.id === id);
            if (idx === -1) return sendJson(res, { success: false, message: 'Not found' }, 404);

            const existing = products[idx];
            const categories = getCategories();
            const catObj = categories.find(c => c.id === (body.categoryId || existing.category));

            products[idx] = {
              ...existing,
              ...body,
              category: body.categoryId || existing.category,
              categoryName: catObj ? catObj.name : (body.categoryName || existing.categoryName),
              updated_at: new Date().toISOString()
            };
            saveCatalog(products);

            activityLogs.unshift({
              id: Date.now(),
              admin_name: mockSession.fullName,
              action: 'update_product',
              entity_type: 'products',
              entity_id: id,
              details: `Updated product ${products[idx].title}`,
              created_at: new Date().toISOString()
            });

            return sendJson(res, { success: true, product: products[idx] });
          }

          if (method === 'DELETE') {
            const hard = urlObj.searchParams.get('hard') === 'true';
            if (hard) {
              products = products.filter(p => p.id !== id);
            } else {
              const idx = products.findIndex(p => p.id === id);
              if (idx !== -1) products[idx].status = 'archived';
            }
            saveCatalog(products);
            return sendJson(res, { success: true, message: 'Product removed' });
          }
        }

        // 5. /api/admin/categories
        if (pathname === '/api/admin/categories' || pathname === '/api/admin/categories.php') {
          let categories = getCategories();
          const products = getCatalog();
          const id = urlObj.searchParams.get('id');

          if (method === 'GET') {
            if (id) {
              const cat = categories.find(c => c.id === id);
              if (!cat) return sendJson(res, { success: false, message: 'Not found' }, 404);
              return sendJson(res, { success: true, category: cat });
            }

            const list = categories.map(c => {
              const count = products.filter(p => p.category === c.id && p.status !== 'archived').length;
              return {
                ...c,
                actual_product_count: count
              };
            });
            return sendJson(res, { success: true, categories: list });
          }

          if (method === 'POST') {
            const body = await readBody(req);
            const slug = body.slug || body.name.toLowerCase().replace(/[^a-z0-9]+/g, '-');
            const newCat = {
              id: slug,
              name: body.name,
              slug: slug,
              description: body.description,
              image: body.image,
              featuredProductCount: 0,
              highlights: body.highlights || [],
              display_order: Number(body.displayOrder || categories.length),
              status: body.status || 'published',
              seo_title: body.seoTitle,
              seo_description: body.seoDescription
            };
            categories.push(newCat);
            saveCategories(categories);
            return sendJson(res, { success: true, category: newCat }, 201);
          }

          if (method === 'PUT') {
            const body = await readBody(req);
            const idx = categories.findIndex(c => c.id === id);
            if (idx === -1) return sendJson(res, { success: false, message: 'Not found' }, 404);
            categories[idx] = { ...categories[idx], ...body };
            saveCategories(categories);
            return sendJson(res, { success: true, category: categories[idx] });
          }

          if (method === 'DELETE') {
            const activeProds = products.filter(p => p.category === id && p.status !== 'archived');
            if (activeProds.length > 0) {
              return sendJson(res, {
                success: false,
                message: `Cannot delete category because it contains ${activeProds.length} active products.`
              }, 409);
            }
            categories = categories.filter(c => c.id !== id);
            saveCategories(categories);
            return sendJson(res, { success: true, message: 'Category deleted' });
          }
        }

        // 6. /api/admin/leads
        if (pathname === '/api/admin/leads' || pathname === '/api/admin/leads.php') {
          let leads = getLeads();
          const action = urlObj.searchParams.get('action') || '';
          const id = urlObj.searchParams.get('id');

          if (method === 'GET' && action === 'export') {
            res.setHeader('Content-Type', 'text/csv');
            res.setHeader('Content-Disposition', 'attachment; filename="leads.csv"');
            let csv = 'Lead ID,Name,Company,Email,Phone,Product,Category,Status,Date\n';
            leads.forEach(l => {
              csv += `"${l.id}","${l.fullName}","${l.companyName || ''}","${l.email}","${l.phone}","${l.productName || ''}","${l.category || ''}","${l.status || 'New'}","${l.timestamp || ''}"\n`;
            });
            return res.end(csv);
          }

          if (method === 'POST' && action === 'add-note') {
            const body = await readBody(req);
            const leadId = body.leadId;
            if (!leadNotes[leadId]) leadNotes[leadId] = [];
            leadNotes[leadId].unshift({
              id: Date.now(),
              lead_id: leadId,
              admin_name: mockSession.fullName,
              note: body.note,
              created_at: new Date().toISOString()
            });
            return sendJson(res, { success: true, message: 'Note added' });
          }

          if (method === 'GET') {
            if (id) {
              const lead = leads.find(l => l.id === id);
              if (!lead) return sendJson(res, { success: false, message: 'Not found' }, 404);
              return sendJson(res, {
                success: true,
                lead: {
                  ...lead,
                  notes: leadNotes[id] || [],
                  activities: leadActivities[id] || []
                }
              });
            }

            const search = (urlObj.searchParams.get('search') || '').toLowerCase();
            const status = urlObj.searchParams.get('status') || '';
            const category = urlObj.searchParams.get('category') || '';
            const page = parseInt(urlObj.searchParams.get('page') || '1', 10);
            const limit = parseInt(urlObj.searchParams.get('limit') || '25', 10);

            let filtered = leads.filter(l => {
              if (status && status !== 'all' && (l.status || 'New') !== status) return false;
              if (category && category !== 'all' && l.category !== category) return false;
              if (search) {
                const text = `${l.fullName} ${l.email} ${l.phone} ${l.companyName || ''} ${l.productName || ''}`.toLowerCase();
                return text.includes(search);
              }
              return true;
            });

            const total = filtered.length;
            const start = (page - 1) * limit;
            const paged = filtered.slice(start, start + limit);

            return sendJson(res, {
              success: true,
              leads: paged,
              pagination: { total, page, limit, totalPages: Math.ceil(total / limit) }
            });
          }

          if (method === 'PUT') {
            const body = await readBody(req);
            const idx = leads.findIndex(l => l.id === id);
            if (idx === -1) return sendJson(res, { success: false, message: 'Not found' }, 404);

            leads[idx] = { ...leads[idx], ...body };
            saveLeads(leads);

            if (!leadActivities[id]) leadActivities[id] = [];
            leadActivities[id].unshift({
              id: Date.now(),
              admin_name: mockSession.fullName,
              action: 'status_change',
              details: `Status updated to ${body.status || leads[idx].status}`,
              created_at: new Date().toISOString()
            });

            return sendJson(res, { success: true, lead: leads[idx] });
          }
        }

        // 7. /api/admin/media
        if (pathname === '/api/admin/media' || pathname === '/api/admin/media.php') {
          const uploadsDir = path.join(__dirname, '../public/assets/uploads');
          if (!fs.existsSync(uploadsDir)) fs.mkdirSync(uploadsDir, { recursive: true });

          if (method === 'GET') {
            const files = fs.readdirSync(uploadsDir).map((file, i) => ({
              id: i + 1,
              filename: file,
              original_name: file,
              file_path: `/assets/uploads/${file}`,
              file_size: 154200,
              mime_type: 'image/jpeg',
              width: 800,
              height: 800,
              alt_text: file,
              created_at: new Date().toISOString()
            }));

            return sendJson(res, {
              success: true,
              media: files,
              pagination: { total: files.length, page: 1, limit: 50, totalPages: 1 }
            });
          }

          if (method === 'POST') {
            const chunks = [];
            req.on('data', chunk => chunks.push(chunk));
            req.on('end', () => {
              const buffer = Buffer.concat(chunks);
              const contentType = req.headers['content-type'] || '';
              let filename = `prod_upload_${Date.now()}_${Math.random().toString(36).substring(2, 6)}.png`;
              let originalName = 'product-image.png';

              if (contentType.includes('multipart/form-data')) {
                const boundaryMatch = contentType.match(/boundary=(?:"([^"]+)"|([^;]+))/i);
                if (boundaryMatch) {
                  const boundary = boundaryMatch[1] || boundaryMatch[2];
                  const raw = buffer.toString('binary');
                  const parts = raw.split('--' + boundary);
                  for (const part of parts) {
                    const match = part.match(/filename="([^"]+)"/);
                    if (match) {
                      originalName = match[1];
                      const ext = path.extname(originalName) || '.png';
                      filename = `img_${Date.now()}_${Math.random().toString(36).substring(2, 6)}${ext}`;
                      const headerEnd = part.indexOf('\r\n\r\n');
                      if (headerEnd !== -1) {
                        const fileBinary = part.substring(headerEnd + 4, part.lastIndexOf('\r\n'));
                        fs.writeFileSync(path.join(uploadsDir, filename), Buffer.from(fileBinary, 'binary'));
                        break;
                      }
                    }
                  }
                }
              }

              const publicPath = `/assets/uploads/${filename}`;
              return sendJson(res, {
                success: true,
                media: {
                  id: Date.now(),
                  filename,
                  originalName,
                  filePath: publicPath,
                  file_path: publicPath,
                  fileSize: buffer.length,
                  mimeType: 'image/png'
                }
              }, 201);
            });
            return;
          }

          if (method === 'DELETE') {
            const id = urlObj.searchParams.get('id');
            return sendJson(res, { success: true, message: 'Media asset deleted successfully' });
          }
        }

        // 8. /api/admin/settings
        if (pathname === '/api/admin/settings' || pathname === '/api/admin/settings.php') {
          if (method === 'GET') {
            return sendJson(res, { success: true, settings: getSettings() });
          }
          if (method === 'POST') {
            const body = await readBody(req);
            const current = getSettings();
            const updated = { ...current, ...(body.settings || {}) };
            saveSettings(updated);
            return sendJson(res, { success: true, message: 'Settings updated' });
          }
        }

        // 9. /api/admin/publish
        if (pathname === '/api/admin/publish' || pathname === '/api/admin/publish.php') {
          // Re-generate sitemap
          try {
            require('./generate_sitemap_xml.js');
          } catch (e) {}

          const products = getCatalog();
          const categories = getCategories();
          return sendJson(res, {
            success: true,
            publishedAt: new Date().toISOString(),
            metrics: {
              productsPublished: products.length,
              categoriesPublished: categories.length,
              sitemapEntries: products.length + 9
            },
            message: 'Public website catalogue and sitemap published successfully.'
          });
        }

        // 10. /api/admin/logs
        if (pathname === '/api/admin/logs' || pathname === '/api/admin/logs.php') {
          return sendJson(res, {
            success: true,
            logs: activityLogs,
            pagination: { total: activityLogs.length, page: 1, limit: 30, totalPages: 1 }
          });
        }

        return next();
      });
    }
  };
}

module.exports = viteApiMockPlugin;
