const fs = require('fs');
let raw = fs.readFileSync('docs/audit_assets/api_products.json', 'utf8');
if (raw.charCodeAt(0) === 0xFEFF) {
  raw = raw.slice(1);
}
const data = JSON.parse(raw);

console.log('Total products:', data.products.length);
data.products.forEach((p, idx) => {
  console.log(`${idx + 1}. [${p.id}] ${p.title}`);
  console.log(`   Slug: ${p.slug}`);
  console.log(`   Description: ${p.description}`);
  console.log(`   Image: ${p.thumbnail}`);
  console.log('---');
});
