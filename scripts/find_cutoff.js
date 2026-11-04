const sharp = require('sharp');

async function findCutoff() {
  // Let's generate crops at different X starting positions:
  // x = 850, x = 880, x = 900, x = 920, x = 950
  for (const x of [820, 860, 880, 900, 920, 950]) {
    await sharp('public/assets/hero_reference_full.jpg')
      .extract({ left: x, top: 110, width: 1774 - x, height: 690 })
      .toFile(`public/assets/crop_test_${x}.png`);
    console.log(`Generated crop_test_${x}.png`);
  }
}

findCutoff().catch(console.error);
