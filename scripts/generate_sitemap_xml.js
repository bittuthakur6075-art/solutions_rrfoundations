const fs = require('fs');
const path = require('path');

const prodFile = fs.readFileSync(path.join(__dirname, '../lib/data/products.ts'), 'utf8');
const prodSlugs = [...prodFile.matchAll(/"slug":\s*["']([^"']+)["']/g)].map(m => m[1]);

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

staticRoutes.forEach(r => {
  xml += `  <url>\n    <loc>${baseUrl}${r.url}</loc>\n    <lastmod>${date}</lastmod>\n    <changefreq>${r.changefreq}</changefreq>\n    <priority>${r.priority}</priority>\n  </url>\n`;
});

prodSlugs.forEach(slug => {
  xml += `  <url>\n    <loc>${baseUrl}/products#${slug}</loc>\n    <lastmod>${date}</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.7</priority>\n  </url>\n`;
});

xml += `</urlset>\n`;

fs.writeFileSync(path.join(__dirname, '../public/sitemap.xml'), xml, 'utf8');
console.log(`Generated public/sitemap.xml with ${staticRoutes.length + prodSlugs.length} entries.`);
