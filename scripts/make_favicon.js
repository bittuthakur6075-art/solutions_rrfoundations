process.env.npm_package_config_libvips = '';
const sharp = require('sharp');
const fs = require('fs');
const path = require('path');

const inputPath = 'C:/Users/bittu/.gemini/antigravity-cli/brain/b4bc8982-c2e3-485f-adbf-ce187adca7de/.user_uploaded/uploaded_media_1793762889204.jpg';

async function run() {
  console.log('Loading input:', inputPath);
  const { data, info } = await sharp(inputPath).raw().toBuffer({ resolveWithObject: true });
  const w = info.width;
  const h = info.height;
  console.log('Dimensions:', w, 'x', h);

  // 1. Transparent corners (Remove outer black)
  // Let's create an alpha mask where outer black is 0, squircle is 255.
  // Because the squircle has a subtle blue border and anti-aliased edge,
  // we can calculate distance/luminance from black.
  const rgbaCornersTransparent = Buffer.alloc(w * h * 4);
  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {
      const srcIdx = (y * w + x) * 3;
      const dstIdx = (y * w + x) * 4;
      const r = data[srcIdx];
      const g = data[srcIdx + 1];
      const b = data[srcIdx + 2];

      rgbaCornersTransparent[dstIdx] = r;
      rgbaCornersTransparent[dstIdx + 1] = g;
      rgbaCornersTransparent[dstIdx + 2] = b;

      // Check if it's in the outer corner black region
      // Corner check: x < w*0.3 or x > w*0.7, y < h*0.3 or y > h*0.7
      const isNearCorner = (x < w * 0.35 || x > w * 0.65) && (y < h * 0.35 || y > h * 0.65);
      
      if (isNearCorner) {
        // Luminance / color threshold
        const brightness = (r + g + b) / 3;
        if (brightness < 3) {
          rgbaCornersTransparent[dstIdx + 3] = 0;
        } else if (brightness < 20 && b < 30) {
          rgbaCornersTransparent[dstIdx + 3] = Math.round((brightness / 20) * 255);
        } else {
          rgbaCornersTransparent[dstIdx + 3] = 255;
        }
      } else {
        rgbaCornersTransparent[dstIdx + 3] = 255;
      }
    }
  }

  // Save full-res transparent corners badge
  await sharp(rgbaCornersTransparent, { raw: { width: w, height: h, channels: 4 } })
    .png()
    .toFile('public/assets/favicon_badge.png');
  console.log('Saved public/assets/favicon_badge.png');

  // 2. Emblem only (transparent background, both navy and white variations)
  // White RR + Gold swoosh
  const rgbaWhiteEmblem = Buffer.alloc(w * h * 4);
  // Navy RR + Gold swoosh (matches brand Navy on light tabs)
  const rgbaNavyEmblem = Buffer.alloc(w * h * 4);

  for (let i = 0; i < data.length; i += 3) {
    const dstIdx = (i / 3) * 4;
    const r = data[i];
    const g = data[i + 1];
    const b = data[i + 2];

    const isWhite = (r > 170 && g > 170 && b > 170);
    const isGold = (r > 150 && g > 90 && b < 80);

    if (isWhite) {
      // White emblem
      rgbaWhiteEmblem[dstIdx] = 255;
      rgbaWhiteEmblem[dstIdx + 1] = 255;
      rgbaWhiteEmblem[dstIdx + 2] = 255;
      rgbaWhiteEmblem[dstIdx + 3] = 255;

      // Navy emblem: brand navy #001738
      rgbaNavyEmblem[dstIdx] = 0;
      rgbaNavyEmblem[dstIdx + 1] = 23;
      rgbaNavyEmblem[dstIdx + 2] = 56;
      rgbaNavyEmblem[dstIdx + 3] = 255;
    } else if (isGold) {
      rgbaWhiteEmblem[dstIdx] = r;
      rgbaWhiteEmblem[dstIdx + 1] = g;
      rgbaWhiteEmblem[dstIdx + 2] = b;
      rgbaWhiteEmblem[dstIdx + 3] = 255;

      rgbaNavyEmblem[dstIdx] = r;
      rgbaNavyEmblem[dstIdx + 1] = g;
      rgbaNavyEmblem[dstIdx + 2] = b;
      rgbaNavyEmblem[dstIdx + 3] = 255;
    } else {
      // Background
      rgbaWhiteEmblem[dstIdx + 3] = 0;
      rgbaNavyEmblem[dstIdx + 3] = 0;
    }
  }

  // Trim emblem to bounds
  const trimmedWhiteEmblem = await sharp(rgbaWhiteEmblem, { raw: { width: w, height: h, channels: 4 } })
    .png()
    .trim()
    .toBuffer();

  const trimmedNavyEmblem = await sharp(rgbaNavyEmblem, { raw: { width: w, height: h, channels: 4 } })
    .png()
    .trim()
    .toBuffer();

  await sharp(trimmedWhiteEmblem)
    .png()
    .toFile('public/assets/favicon_emblem_white.png');
  console.log('Saved public/assets/favicon_emblem_white.png');

  await sharp(trimmedNavyEmblem)
    .png()
    .toFile('public/assets/favicon_emblem_navy.png');
  console.log('Saved public/assets/favicon_emblem_navy.png');

  // Let's create the favicon and app icons!
  // The badge (squircle with transparent rounded corners) is the premier icon design
  // because in browsers (Chrome, Edge, Firefox, Safari) whether the tab bar is white, grey, or black,
  // the dark navy squircle with crisp white RR and gold swoosh is always 100% visible, sharp, and looks like a verified app!
  
  // Standard sizes:
  // 1. app/icon.png: 512x512
  // 2. app/apple-icon.png: 180x180
  // 3. public/favicon.ico: 32x32 (or multi-size 48, 32, 16)
  // 4. public/favicon-32x32.png: 32x32
  // 5. public/favicon-16x16.png: 16x16
  // 6. public/apple-touch-icon.png: 180x180
  // 7. public/icon.png: 512x512

  const badgeSource = sharp(rgbaCornersTransparent, { raw: { width: w, height: h, channels: 4 } });

  await badgeSource.clone().resize(512, 512).png().toFile('app/icon.png');
  await badgeSource.clone().resize(512, 512).png().toFile('public/icon.png');
  await badgeSource.clone().resize(192, 192).png().toFile('public/icon-192.png');
  await badgeSource.clone().resize(180, 180).png().toFile('app/apple-icon.png');
  await badgeSource.clone().resize(180, 180).png().toFile('public/apple-touch-icon.png');
  await badgeSource.clone().resize(32, 32).png().toFile('public/favicon-32x32.png');
  await badgeSource.clone().resize(16, 16).png().toFile('public/favicon-16x16.png');
  await badgeSource.clone().resize(32, 32).png().toFile('public/favicon.ico');

  console.log('Successfully generated all favicon and icon sizes!');
}

run().catch(console.error);
