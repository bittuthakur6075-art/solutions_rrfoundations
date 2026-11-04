const fs = require('fs');
const lines = fs.readFileSync('docs/audit_assets/extracted_strings.txt', 'utf8').split('\n');

const businessLines = lines.filter(l => {
  if (l.length < 15) return false;
  if (/react|component|props|render|state|hook|dispatch|context|jsx|webpack|function|eval|typeof|return/i.test(l)) return false;
  return true;
});

console.log('Business lines found:', businessLines.length);
fs.writeFileSync('docs/audit_assets/business_copy.txt', businessLines.join('\n'));
businessLines.slice(0, 40).forEach((l, i) => console.log(`${i+1}: ${l}`));
