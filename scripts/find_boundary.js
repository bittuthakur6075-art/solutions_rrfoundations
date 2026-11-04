const sharp = require('sharp');

async function findExactBoundary() {
  const { data, info } = await sharp('public/assets/hero_reference_full.jpg')
    .raw()
    .toBuffer({ resolveWithObject: true });

  const w = info.width;
  const h = info.height;

  // Let's inspect columns between x = 700 and 1000 at row y = 640 (where the Discuss button is)
  // The button has a white border: r ~ 255, g ~ 255, b ~ 255
  let buttonRightEdge = 0;
  for (let x = 600; x < 950; x++) {
    const idx = (650 * w + x) * 3;
    const r = data[idx];
    const g = data[idx+1];
    const b = data[idx+2];
    if (r > 150 && g > 150 && b > 150) {
      buttonRightEdge = x;
    }
  }
  console.log('Button right edge is around x =', buttonRightEdge);

  // Where does the lanyard metal clip start?
  // Let's inspect at y = 550 between x = 850 and 1000
  for (let x = 850; x < 1000; x++) {
    const idx = (550 * w + x) * 3;
    const r = data[idx];
    const g = data[idx+1];
    const b = data[idx+2];
    if (r > 180 && g > 180 && b > 180) {
      console.log('Metal lanyard clip starts at x =', x);
      break;
    }
  }

  // Where does the header end vertically?
  // The header line is around y = 115
  for (let y = 100; y < 140; y++) {
    const idx = (y * w + 500) * 3;
    const r = data[idx];
    const g = data[idx+1];
    const b = data[idx+2];
    // dark green line is around y = 115
  }
}

findExactBoundary();
