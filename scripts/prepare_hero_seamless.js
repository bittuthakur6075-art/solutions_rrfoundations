const sharp = require('sharp');

async function createSeamlessHero() {
  const width = 1094;
  const height = 680;

  // 1. Extract the product staging area from the reference image
  const extracted = await sharp('public/assets/hero_reference_full.jpg')
    .extract({ left: 680, top: 120, width, height })
    .toBuffer();

  // 2. Create an SVG linear gradient mask for the left edge (fading in from x=0 to x=180)
  const maskSvg = Buffer.from(`
    <svg width="${width}" height="${height}" xmlns="http://www.w3.org/2000/svg">
      <defs>
        <linearGradient id="fade" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%" stop-color="#000" stop-opacity="0" />
          <stop offset="12%" stop-color="#000" stop-opacity="0.7" />
          <stop offset="22%" stop-color="#000" stop-opacity="1" />
          <stop offset="100%" stop-color="#000" stop-opacity="1" />
        </linearGradient>
      </defs>
      <rect x="0" y="0" width="${width}" height="${height}" fill="url(#fade)" />
    </svg>
  `);

  // 3. Apply the mask as alpha channel
  await sharp(extracted)
    .ensureAlpha()
    .composite([
      {
        input: maskSvg,
        blend: 'dest-in',
      },
    ])
    .png()
    .toFile('public/assets/hero_products_seamless.png');

  console.log('Created hero_products_seamless.png with seamless edge feathering!');
}

createSeamlessHero().catch(console.error);
