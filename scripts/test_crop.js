const sharp = require('sharp');

async function testCrop() {
  // Let's create multiple candidate crops for the logo and check where the exact RR logo sits:
  // Usually around left: 70-100, top: 60-120
  await sharp('public/assets/hero_reference_full.jpg')
    .extract({ left: 60, top: 65, width: 340, height: 55 })
    .toFile('public/assets/logo_header.png');

  // Let's also check the exact hero product right section:
  // From left: 780, top: 125, width: 994, height: 675
  await sharp('public/assets/hero_reference_full.jpg')
    .extract({ left: 780, top: 125, width: 994, height: 675 })
    .toFile('public/assets/hero_products_refined.png');

  console.log('Refined crops generated');
}
testCrop();
