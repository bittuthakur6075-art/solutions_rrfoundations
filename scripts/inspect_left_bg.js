const sharp = require('sharp');

async function inspectLeftBg() {
  const { data, info } = await sharp('public/assets/hero_reference_full.jpg')
    .raw()
    .toBuffer({ resolveWithObject: true });

  const w = info.width;
  // Inspect background colors at various points where there is no text:
  // e.g. x = 100, y = 200 (between kicker and headline)
  // x = 100, y = 140 (top left)
  // x = 400, y = 140
  // x = 700, y = 160
  const points = [
    [100, 140], [200, 140], [400, 140], [700, 140], [800, 160],
    [50, 400], [50, 500], [50, 800]
  ];

  for (const [x, y] of points) {
    const idx = (y * w + x) * 3;
    console.log(`Point (${x}, ${y}): rgb(${data[idx]}, ${data[idx+1]}, ${data[idx+2]}) = #${data[idx].toString(16).padStart(2,'0')}${data[idx+1].toString(16).padStart(2,'0')}${data[idx+2].toString(16).padStart(2,'0')}`);
  }
}

inspectLeftBg();
