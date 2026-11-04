const sharp = require('sharp');

async function checkLeftEdge() {
  const { data, info } = await sharp('public/assets/clean_products_only.png')
    .raw()
    .toBuffer({ resolveWithObject: true });

  console.log('Width:', info.width, 'Height:', info.height);
  // Check first 20 columns
  for (let x = 0; x < 20; x += 5) {
    let avgR = 0, avgG = 0, avgB = 0;
    for (let y = 0; y < info.height; y++) {
      const idx = (y * info.width + x) * info.channels;
      avgR += data[idx];
      avgG += data[idx + 1];
      avgB += data[idx + 2];
    }
    avgR /= info.height;
    avgG /= info.height;
    avgB /= info.height;
    console.log(`Column ${x}: R=${avgR.toFixed(1)}, G=${avgG.toFixed(1)}, B=${avgB.toFixed(1)}`);
  }
}

checkLeftEdge();
