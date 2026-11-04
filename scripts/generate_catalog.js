const fs = require('fs');
const path = require('path');

const manifest = JSON.parse(fs.readFileSync('public/assets/products_manifest.json', 'utf8'));

// 8 Master Categories matching RR Foundations manufacturing portfolio
const CATEGORIES = [
  {
    id: "badges-lapel-pins",
    name: "Badges & Lapel Pins",
    slug: "badges-lapel-pins",
    description: "In-house manufactured stainless steel name badges, magnetic fastener badges, die-struck brass lapel pins, acrylic badges, and political campaign insignias.",
    image: "/assets/products/badge-001.png",
    featuredProductCount: 46,
    highlights: ["Pure copper & steel cores", "Magnetic & safety clasp backings", "UV micro-print & fiber laser etching", "Pan-India institutional supply"]
  },
  {
    id: "designer-wall-clocks",
    name: "Designer Wall Clocks",
    slug: "designer-wall-clocks",
    description: "Luxury mechanical moving gear clocks, precision laser-cut MDF acrylic timepieces, and customized corporate dial clocks for executive gifting.",
    image: "/assets/products/wall-clock-001.jpeg",
    featuredProductCount: 60,
    highlights: ["Real moving gear mechanisms", "Silent sweep quartz movement", "Precision engineered MDF & acrylic", "Customized corporate dials"]
  },
  {
    id: "executive-pens",
    name: "Executive Pens & Writing",
    slug: "executive-pens",
    description: "Premium metallic ballpoint pens, rollerball pens, laser-engraved stylus pens, and corporate gift boxed writing instruments.",
    image: "/assets/products/pen-001.png",
    featuredProductCount: 50,
    highlights: ["Solid metallic brass & aluminum barrels", "High-precision fiber laser etching", "German ultra-smooth ink refills", "Corporate velvet & hard box packing"]
  },
  {
    id: "magnets-souvenirs",
    name: "Custom Fridge Magnets & Souvenirs",
    slug: "magnets-souvenirs",
    description: "Vibrant custom-shaped acrylic fridge magnets, embossed rubberized magnets, and commemorative corporate & tourism souvenir plaques.",
    image: "/assets/products/magnet-001.jpeg",
    featuredProductCount: 42,
    highlights: ["High-strength isotropic magnetic backing", "Glossy scratch-proof acrylic & rubber", "Full-bleed photographic UV printing", "Custom contour die-cut shapes"]
  },
  {
    id: "photo-frames-awards",
    name: "Photo Frames & Awards",
    slug: "photo-frames-awards",
    description: "Intricately detailed Balaji gold foil divine frames, crystal clear acrylic desktop photo frames, and institutional recognition mementos.",
    image: "/assets/products/frame-001.jpeg",
    featuredProductCount: 20,
    highlights: ["Gold foil embossed religious & civic artwork", "Durable engineered frame borders", "Shatterproof acrylic glass fronts", "Custom engraved dedication plaques"]
  },
  {
    id: "examboards-stationery",
    name: "Exam Boards & Desk Stationery",
    slug: "examboards-stationery",
    description: "Heavy-duty transparent acrylic examination pads, printed wooden MDF clipboards, and institutional office desk accessories.",
    image: "/assets/products/examboard-001.jpeg",
    featuredProductCount: 21,
    highlights: ["High-impact shatter-resistant acrylic", "Heavy-gauge steel spring clips", "UV flatbed scratch-resistant prints", "Educational & institutional bulk dispatch"]
  },
  {
    id: "lanyards-credentials",
    name: "Lanyards & Identification",
    slug: "lanyards-credentials",
    description: "Custom multi-color heat transfer satin lanyards, woven neck cords, transparent acrylic ID card holders, and turnkey event credentials.",
    image: "/assets/products/lanyard-id-001.jpeg",
    featuredProductCount: 12,
    highlights: ["High-density satin & polyester ribbon", "Safety quick-release breakaway buckles", "Rotatable metal lobster clasps", "Rigid acrylic & waterproof PVC pouches"]
  },
  {
    id: "keychains-acrylic-crafts",
    name: "Keychains & Acrylic Crafts",
    slug: "keychains-acrylic-crafts",
    description: "Custom die-struck metal keychains, laser-cut acrylic key tags, molded silicone accessories, and desktop paperweights.",
    image: "/assets/products/craft-001.png",
    featuredProductCount: 17,
    highlights: ["Heavyweight zinc alloy & brass stamping", "Crystal clear edge-polished acrylic", "Heavy nickel split ring & chain", "Bespoke company shapes and 3D reliefs"]
  }
];

// Helper to generate human-readable titles and descriptions
function generateProductMeta(item, idx, catCount) {
  const catSlug = item.catSlug;
  const num = String(idx + 1).padStart(2, '0');
  
  let title = '';
  let shortDesc = '';
  let fullDesc = '';
  let materials = [];
  let specs = {};
  let tags = [];
  let minQty = 100;

  switch (catSlug) {
    case 'badges-lapel-pins':
      title = `Custom Precision Badge Pin — Model BD-${num}`;
      shortDesc = "Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.";
      fullDesc = "Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.";
      materials = ["Stainless Steel 304 / Brass Core", "Neodymium Magnetic Bar", "Scratch-Resistant Topcoat"];
      specs = {
        "Fastening": "Triple Magnet Bar / Safety Locking Pin",
        "Branding": "UV Micro-Print / Precision Fiber Laser",
        "Finish Options": "Mirror Gold / Brushed Steel / Matte Black",
        "Lead Time": "3-7 Days for Production Batches"
      };
      tags = ["Badge", "Lapel Pin", "Corporate ID", "Metal", "Magnetic"];
      minQty = 50;
      break;

    case 'designer-wall-clocks':
      title = `Mechanical Gear & Designer Wall Clock — Model WC-${num}`;
      shortDesc = "Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.";
      fullDesc = "A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.";
      materials = ["Engineered MDF / High-Gloss Acrylic", "Moving Brass & Steel Gears", "Silent Quartz Movement"];
      specs = {
        "Diameter": "12 Inch / 16 Inch / 20 Inch Custom",
        "Movement": "Silent Sweep Non-Ticking Quartz",
        "Power": "Standard AA Battery Operated",
        "Customization": "Logo Dial Foil Stamping & Dial Print"
      };
      tags = ["Wall Clock", "Gear Clock", "Corporate Gift", "Interior Decor", "MDF"];
      minQty = 25;
      break;

    case 'executive-pens':
      title = `Executive Metallic Ballpoint Pen — Model PN-${num}`;
      shortDesc = "Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.";
      fullDesc = "Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.";
      materials = ["Brass / Aluminum Barrel", "German Tungsten Carbide Ball Refill", "Chrome / Rose Gold Trims"];
      specs = {
        "Refill": "0.7mm / 1.0mm Blue / Black German Ink",
        "Finish": "Matte Lacquer / Brushed Gunmetal / Chrome",
        "Branding": "360-Degree Rotary Fiber Laser Etch",
        "Packaging": "Velvet Pouch / Premium Hard Gift Box"
      };
      tags = ["Pen", "Executive Pen", "Corporate Stationery", "Laser Engraved", "Metal Pen"];
      minQty = 100;
      break;

    case 'magnets-souvenirs':
      title = `Custom Die-Cut Refrigerator Magnet — Model MG-${num}`;
      shortDesc = "Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.";
      fullDesc = "Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.";
      materials = ["Isotropic High-Tack Flexible Magnet", "Cast Acrylic / Molded PVC", "UV Lamination"];
      specs = {
        "Thickness": "2mm - 4mm Solid Construction",
        "Printing": "CMYK Digital Direct Flatbed Printing",
        "Shape": "Custom Die-Cut to Client Silhouette",
        "Durability": "Moisture and Fade Resistant"
      };
      tags = ["Fridge Magnet", "Souvenir", "Promotional Merchandise", "Acrylic Magnet", "PVC"];
      minQty = 100;
      break;

    case 'photo-frames-awards':
      title = `Traditional Divine & Corporate Photo Frame — Model FR-${num}`;
      shortDesc = "Intricately detailed gold foil embossed frame and commemorative award memento.";
      fullDesc = "Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.";
      materials = ["Embossed Metallic Gold Foil", "Engineered Polished Molding", "Shatterproof Acrylic Shield"];
      specs = {
        "Sizes": "6x8 Inch / 8x10 Inch / 10x12 Inch / Custom",
        "Mounting": "Desktop Easel Stand + Dual Wall Hooks",
        "Finish": "Antique Teak / Polished Gold / Deep Mahogany",
        "Customization": "Laser Inscribed Brass Dedication Plaque"
      };
      tags = ["Photo Frame", "Balaji Frame", "Divine Art", "Corporate Award", "Memento"];
      minQty = 20;
      break;

    case 'examboards-stationery':
      title = `Heavy-Duty Examination Writing Pad — Model EB-${num}`;
      shortDesc = "Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.";
      fullDesc = "Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.";
      materials = ["High-Impact Virgin Acrylic / Waterproof MDF", "Chrome Plated Spring Clip", "Corner Rubber Grips"];
      specs = {
        "Dimensions": "Standard A4 / Legal Exam Size",
        "Thickness": "3.0mm - 4.5mm Rigid Substrate",
        "Safety": "Smooth Radius Chamfered Corners",
        "Print": "Back-Surface Scratchproof Printing"
      };
      tags = ["Exam Board", "Clipboard", "School Stationery", "Acrylic Pad", "MDF Board"];
      minQty = 50;
      break;

    case 'lanyards-credentials':
      title = `Custom Sublimation Satin Lanyard & ID Kit — Model LN-${num}`;
      shortDesc = "Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.";
      fullDesc = "Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.";
      materials = ["Woven Polyester / Satin Ribbon", "Zinc Alloy Swivel Clasp", "Rigid Acrylic ID Case"];
      specs = {
        "Width": "16mm / 20mm / 25mm Width Options",
        "Print": "Full-Bleed Heat Transfer Sublimation",
        "Safety": "Quick-Release Breakaway Nape Clasp",
        "Badge Holder": "Top-Loading Clear Acrylic Case"
      };
      tags = ["Lanyard", "ID Card", "Conference Kit", "Event Credential", "Neck Cord"];
      minQty = 100;
      break;

    case 'keychains-acrylic-crafts':
      title = `Custom Die-Struck Metal & Acrylic Keychain — Model KC-${num}`;
      shortDesc = "Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.";
      fullDesc = "Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.";
      materials = ["Zinc Alloy / Cast Acrylic / Silicone", "Tempered Nickel Split Ring", "Color Enamel Fill"];
      specs = {
        "Thickness": "3mm - 4mm Heavy Solid Feel",
        "Hardware": "Flat Ring + 4-Link Heavy Gauge Chain",
        "Plating": "Polished Nickel / Antique Brass / Black Nickel",
        "Packaging": "Individual Clear Blister or Presentation Box"
      };
      tags = ["Keychain", "Metal Keychain", "Acrylic Key Tag", "Automotive", "Promotional"];
      minQty = 100;
      break;
  }

  const slug = title.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
  const id = `prod_${catSlug}_${num}`;

  // Make first 2 of each category featured for homepage highlights
  const featured = idx < 2;

  return {
    id,
    title,
    slug,
    category: catSlug,
    categoryName: CATEGORIES.find(c => c.slug === catSlug)?.name || 'Custom Manufacturing',
    shortDescription: shortDesc,
    fullDescription: fullDesc,
    thumbnail: item.publicPath,
    images: [item.publicPath],
    materials,
    specifications: specs,
    featured,
    minQuantity: minQty,
    tags,
    seoTitle: `${title} | Direct Manufacturer RR Foundations`,
    seoDescription: `${shortDesc} Manufactured in Delhi by RR Foundations.`
  };
}

// Group manifest by category to assign index per category
const catGroups = {};
for (const item of manifest) {
  catGroups[item.catSlug] = catGroups[item.catSlug] || [];
  catGroups[item.catSlug].push(item);
}

const allProducts = [];
for (const [catSlug, items] of Object.entries(catGroups)) {
  items.forEach((item, idx) => {
    allProducts.push(generateProductMeta(item, idx, items.length));
  });
}

console.log('Generated ' + allProducts.length + ' complete product entries!');

// Write lib/data/categories.ts
const categoriesCode = `import { Category } from "@/types";

export const CATEGORIES: Category[] = ${JSON.stringify(CATEGORIES, null, 2)};
`;
fs.writeFileSync('lib/data/categories.ts', categoriesCode, 'utf8');
console.log('Wrote lib/data/categories.ts');

// Write lib/data/products.ts
const productsCode = `import { Product } from "@/types";

export const PRODUCTS: Product[] = ${JSON.stringify(allProducts, null, 2)};
`;
fs.writeFileSync('lib/data/products.ts', productsCode, 'utf8');
console.log('Wrote lib/data/products.ts with ' + allProducts.length + ' products');
