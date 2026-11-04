const sharp = require('sharp');

async function testCleanProduct() {
  await sharp('public/assets/hero_reference_full.jpg')
    .extract({ left: 880, top: 115, width: 894, height: 685 })
    .toFile('public/assets/clean_products_only.png');
  console.log('Created clean_products_only.png!');
}

testCleanProduct();
