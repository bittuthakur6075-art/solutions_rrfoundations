const fs = require('fs');
const lines = fs.readFileSync('docs/audit_assets/business_copy.txt', 'utf8').split('\n');
const sentences = lines.filter(l => l.includes(' ') && l.split(' ').length > 3 && !/[{}()=;><$\\]/.test(l));
console.log('Found sentences count:', sentences.length);
sentences.forEach(s => console.log('-', s.trim()));
