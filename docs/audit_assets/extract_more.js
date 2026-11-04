const fs = require('fs');
const code = fs.readFileSync('docs/audit_assets/index.js', 'utf8');

// Find all image URLs or asset links
const imageMatches = code.match(/https?:\/\/[^"'\s]+\.(?:png|jpg|jpeg|svg|webp)/gi) || [];
console.log('Images found:', [...new Set(imageMatches)]);

// Find phone numbers, addresses, social links
const socialMatches = code.match(/https?:\/\/(?:www\.)?(?:instagram|facebook|linkedin|twitter|wa\.me|api\.whatsapp)[^"'\s]*/gi) || [];
console.log('Social / WhatsApp:', [...new Set(socialMatches)]);

// Find all string literals longer than 20 chars
const allStrings = [];
const strRegex = /"([^"\\]*(?:\\.[^"\\]*)*)"|'([^'\\]*(?:\\.[^'\\]*)*)'/g;
let match;
while ((match = strRegex.exec(code)) !== null) {
  const str = match[1] || match[2];
  if (str && str.length > 25 && str.length < 300) {
    if (!str.includes('node_modules') && !str.includes('webpack') && !str.includes('http') && !str.includes('px ') && !str.includes('M0 ') && !str.includes('xmlns')) {
      allStrings.push(str);
    }
  }
}

fs.writeFileSync('docs/audit_assets/extracted_strings.txt', allStrings.join('\n'));
console.log('Extracted strings count:', allStrings.length);
