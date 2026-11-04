const fs = require('fs');
const code = fs.readFileSync('docs/audit_assets/index.js', 'utf8');
console.log('File size:', code.length);

const emails = code.match(/[\w.-]+@[\w.-]+\.\w+/g) || [];
console.log('Unique emails:', [...new Set(emails)]);

const routes = code.match(/path:\s*["'][^"']+["']/g) || [];
console.log('Routes:', [...new Set(routes)]);

// Search for strings mentioning RR Foundations or products
const matches = code.match(/"([^"]{10,120})"/g) || [];
const interesting = matches
  .map(s => s.replace(/"/g, ''))
  .filter(s => /foundation|product|mdf|acrylic|keychain|lanyard|print|manufactur|contact|about/i.test(s));

console.log('Interesting snippets count:', interesting.length);
console.log('Sample interesting snippets:', interesting.slice(0, 30));
