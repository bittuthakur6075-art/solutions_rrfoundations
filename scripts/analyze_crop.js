const sharp = require('sharp');

// Let's analyze crop_test_860, 880, 900, 920
// Specifically, check the leftmost 100 pixels of each crop to see where the buttons or text "Discuss Your Requirement" ends.
async function analyze() {
  const meta = await sharp('public/assets/hero_reference_full.jpg').metadata();
  console.log('Original width:', meta.width, 'height:', meta.height);

  // In the original image:
  // Where does the "Discuss Your Requirement" button end?
  // Let's crop a strip at y: 600-750 (where the button and indicators are) from x: 600 to 1100
  await sharp('public/assets/hero_reference_full.jpg')
    .extract({ left: 600, top: 550, width: 450, height: 250 })
    .toFile('public/assets/strip_check.png');

  console.log('Generated strip_check.png');
}

analyze();
