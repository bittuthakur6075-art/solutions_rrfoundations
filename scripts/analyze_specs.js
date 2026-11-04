const fs = require('fs');

const content = fs.readFileSync('lib/data/products.ts', 'utf8');
const regex = /"specifications":\s*\{([^}]+)\}/g;
let match;
const specKeys = new Map();

while ((match = regex.exec(content)) !== null) {
  const block = match[1];
  const keyMatches = block.match(/"([^"]+)":/g);
  if (keyMatches) {
    keyMatches.forEach(k => {
      const cleanKey = k.replace(/[" :]/g, '').trim();
      specKeys.set(cleanKey, (specKeys.get(cleanKey) || 0) + 1);
    });
  }
}

console.log('Total unique specification keys:', specKeys.size);
console.log('All spec keys and counts:');
[...specKeys.entries()].sort((a,b)=>b[1]-a[1]).forEach(([k,v]) => console.log('  ' + k + ': ' + v));
