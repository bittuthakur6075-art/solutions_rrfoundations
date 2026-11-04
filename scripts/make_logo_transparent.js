const sharp = require('sharp');

async function makeLogoTransparent() {
  const { data, info } = await sharp('public/assets/logo_header.png')
    .raw()
    .toBuffer({ resolveWithObject: true });

  const channels = info.channels;
  const output = Buffer.alloc(info.width * info.height * 4);

  for (let i = 0; i < info.width * info.height; i++) {
    const r = data[i * channels];
    const g = data[i * channels + 1];
    const b = data[i * channels + 2];

    // Compute brightness
    const brightness = (r * 0.299 + g * 0.587 + b * 0.114);

    // If brightness is above threshold, it's white logo text
    let alpha = 0;
    if (brightness > 60) {
      alpha = Math.min(255, Math.floor(((brightness - 60) / 100) * 255));
    }

    output[i * 4] = 255;
    output[i * 4 + 1] = 255;
    output[i * 4 + 2] = 255;
    output[i * 4 + 3] = alpha;
  }

  await sharp(output, {
    raw: {
      width: info.width,
      height: info.height,
      channels: 4,
    },
  })
    .trim()
    .png()
    .toFile('public/assets/rr_logo_white.png');

  console.log('Created rr_logo_white.png!');
}

makeLogoTransparent().catch(console.error);
