const sharp = require('sharp');

async function analyze() {
  const image = sharp('public/assets/hero_reference_full.jpg');
  const { data, info } = await image.raw().toBuffer({ resolveWithObject: true });
  const getPixel = (x, y) => {
    const idx = (y * info.width + x) * info.channels;
    return [data[idx], data[idx+1], data[idx+2]];
  };

  console.log('Image size:', info.width, 'x', info.height);

  // Scan vertically at x=50
  for (let y = 0; y < info.height; y += 30) {
    const p = getPixel(50, y);
    console.log(`y=${y}: rgb(${p[0]}, ${p[1]}, ${p[2]})`);
  }

  // Check where the bottom ivory line starts
  for (let y = 700; y < info.height; y += 10) {
    const p = getPixel(100, y);
    if (p[0] > 200 && p[1] > 200) {
      console.log(`Ivory starts at y=${y} at x=100`);
      break;
    }
  }

  // Check horizontal at y=400: where does the background change from dark green to arch/lanyard?
  for (let x = 600; x < info.width; x += 30) {
    const p = getPixel(x, 400);
    console.log(`x=${x}, y=400: rgb(${p[0]}, ${p[1]}, ${p[2]})`);
  }
}

analyze();
