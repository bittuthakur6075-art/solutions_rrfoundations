const sharp = require('sharp');
const path = require('path');

async function processImage() {
  const metadata = await sharp('public/assets/hero_reference_full.jpg').metadata();
  console.log('Image dimensions:', metadata.width, metadata.height);

  // 1. Crop the clean product photography on the right
  // In a 1774 x 887 image:
  // Header is roughly 0 to 118px.
  // Hero content is 120px to 800px.
  // The product staging starts around x = 750px to 1774px.
  // Let's crop from x: 740, y: 120, width: 1774 - 740 = 1034, height: 680.
  await sharp('public/assets/hero_reference_full.jpg')
    .extract({ left: 740, top: 120, width: 1034, height: 680 })
    .toFile('public/assets/hero_products_clean.png');
  console.log('Created hero_products_clean.png');

  // 2. Also crop the official RR logo mark from the header (top left)
  // Let's inspect coordinates around top-left
  await sharp('public/assets/hero_reference_full.jpg')
    .extract({ left: 80, top: 70, width: 320, height: 60 })
    .toFile('public/assets/logo_extracted.png');
  console.log('Created logo_extracted.png');
}

processImage().catch(console.error);
