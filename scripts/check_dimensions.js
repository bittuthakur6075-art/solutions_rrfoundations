const fs = require('fs');
const content = fs.readFileSync('lib/data/products.ts', 'utf8');

// Find all products with Dimensions
const prodMatches = content.split('  {\n    "id":');
console.log('Total products count approx:', prodMatches.length);

const dimensionLines = [];
content.split('\n').forEach((line, idx) => {
  if (line.includes('"Dimensions"') || line.includes('"Dimension"')) {
    dimensionLines.push({ lineNum: idx + 1, text: line.trim() });
  }
});

console.log('Lines with Dimensions:', dimensionLines.length);
dimensionLines.slice(0, 10).forEach(d => console.log('  L' + d.lineNum + ': ' + d.text));
