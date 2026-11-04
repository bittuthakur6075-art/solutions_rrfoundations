const fs = require('fs');
const path = require('path');

const code = fs.readFileSync(path.join(__dirname, '../lib/data/products.ts'), 'utf8')
  .replace(/import\s+.*?;/g, '')
  .replace(/export\s+const\s+PRODUCTS:\s*Product\[\]\s*=\s*/, 'const PRODUCTS = ') + '; module.exports = PRODUCTS;';
const products = eval(code);

const baseUrl = "https://solutions.rrfoundations.org";
const date = new Date().toISOString().split('T')[0];

const staticRoutes = [
  { url: "", priority: "1.0", changefreq: "weekly" },
  { url: "/about", priority: "0.8", changefreq: "weekly" },
  { url: "/products", priority: "0.9", changefreq: "weekly" },
  { url: "/manufacturing", priority: "0.8", changefreq: "weekly" },
  { url: "/industries", priority: "0.8", changefreq: "weekly" },
  { url: "/contact", priority: "0.8", changefreq: "weekly" },
  { url: "/request-quote", priority: "0.9", changefreq: "weekly" },
  { url: "/privacy-policy", priority: "0.3", changefreq: "monthly" },
  { url: "/terms-and-conditions", priority: "0.3", changefreq: "monthly" },
];

let xml = `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n`;

// 1. Static Routes
staticRoutes.forEach(r => {
  xml += `  <url>\n    <loc>${baseUrl}${r.url}</loc>\n    <lastmod>${date}</lastmod>\n    <changefreq>${r.changefreq}</changefreq>\n    <priority>${r.priority}</priority>\n  </url>\n`;
});

// 2. Canonical Product Routes (268 unique products)
const seenSlugs = new Set();
products.forEach(prod => {
  if (!seenSlugs.has(prod.slug)) {
    seenSlugs.add(prod.slug);
    xml += `  <url>\n    <loc>${baseUrl}/products/${prod.slug}</loc>\n    <lastmod>${date}</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.7</priority>\n  </url>\n`;
  }
});

xml += `</urlset>\n`;

fs.writeFileSync(path.join(__dirname, '../public/sitemap.xml'), xml, 'utf8');
console.log(`Generated public/sitemap.xml with ${staticRoutes.length + seenSlugs.size} canonical entries.`);
