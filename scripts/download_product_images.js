const fs = require('fs');
const https = require('https');
const path = require('path');

let raw = fs.readFileSync('docs/audit_assets/api_products.json', 'utf8');
if (raw.charCodeAt(0) === 0xFEFF) raw = raw.slice(1);
const data = JSON.parse(raw);

const targetDir = path.join(__dirname, '..', 'public', 'assets', 'products');
if (!fs.existsSync(targetDir)) {
  fs.mkdirSync(targetDir, { recursive: true });
}

function downloadImage(url, dest) {
  return new Promise((resolve, reject) => {
    https.get(url, (res) => {
      if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
        return downloadImage(res.headers.location, dest).then(resolve).catch(reject);
      }
      if (res.statusCode !== 200) {
        return reject(new Error(`Failed to download ${url}: status code ${res.statusCode}`));
      }
      const fileStream = fs.createWriteStream(dest);
      res.pipe(fileStream);
      fileStream.on('finish', () => {
        fileStream.close(resolve);
      });
    }).on('error', reject);
  });
}

async function run() {
  console.log(`Starting download of ${data.products.length} product images...`);
  for (let i = 0; i < data.products.length; i++) {
    const prod = data.products[i];
    const ext = prod.thumbnail.endsWith('.jpg') ? '.jpg' : '.png';
    const filename = `${prod.slug}${ext}`;
    const dest = path.join(targetDir, filename);
    try {
      await downloadImage(prod.thumbnail, dest);
      console.log(`[${i+1}/${data.products.length}] Downloaded ${filename}`);
    } catch (err) {
      console.error(`Error downloading ${prod.slug}:`, err.message);
    }
  }
  console.log('All product images processed.');
}

run();
