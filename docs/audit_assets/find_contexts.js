const fs = require('fs');
const code = fs.readFileSync('docs/audit_assets/index.js', 'utf8');

const terms = ['Modern manufacturing', 'Metal, stainless', 'Lanyards', 'help@rrfoundation.org', '7428045813', 'store_01'];
for (const t of terms) {
  let idx = 0;
  while ((idx = code.indexOf(t, idx)) !== -1) {
    const start = Math.max(0, idx - 200);
    const end = Math.min(code.length, idx + 400);
    console.log(`=== FOUND: ${t} at ${idx} ===`);
    console.log(code.substring(start, end));
    console.log('\n-------------------\n');
    idx += t.length;
  }
}
