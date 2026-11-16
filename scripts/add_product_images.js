const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

const SOURCE_DIR = 'D:\\PRODUCT\\product images';
const TARGET_DIR = path.join(__dirname, '..', 'public', 'assets', 'products');

if (!fs.existsSync(TARGET_DIR)) {
  fs.mkdirSync(TARGET_DIR, { recursive: true });
}

// Complete definitions for all 26 new products and their 41 corresponding source image files
const PRODUCT_DEFINITIONS = [
  // --- LANYARDS & IDENTIFICATION ---
  {
    id: "prod_lanyards-credentials_satin_multi",
    title: "Multi-Colour Custom Satin Lanyard with Breakaway Clasp",
    slug: "multicolour-custom-satin-lanyard-breakaway",
    category: "lanyards-credentials",
    categoryName: "Lanyards & Identification",
    shortDescription: "Vibrant full-colour heat transfer printed satin lanyard with safety breakaway clasp and card attachment.",
    fullDescription: "Manufactured from high-density woven polyester satin ribbon, this lanyard features photographic quality thermal transfer printing on both sides. Equipped with an ergonomic quick-release neck breakaway mechanism for safety in industrial and school environments, paired with heavy-duty snap clips.",
    primaryFile: "WhatsApp Image 2026-11-14 at 10.01.38 PM (1).jpeg",
    primaryDest: "lanyard-satin-multicolor-breakaway.jpeg",
    secondaryFiles: [
      { src: "WhatsApp Image 2026-11-14 at 10.01.38 PM.jpeg", dest: "lanyard-satin-multicolor-breakaway-alt.jpeg" }
    ],
    materials: ["High-Density Polyester Satin", "ABS Breakaway Clasp", "Nickel-Plated Snap Buckle"],
    specifications: {
      "Ribbon Width": "20mm / 25mm",
      "Standard Length": "900mm (Total Loop)",
      "Print Technology": "Sublimation Heat Transfer (Full Color CMYK)",
      "Safety Mechanism": "Quick-Release Breakaway Nape Clasp",
      "Attachment": "Durable Crocodile Clip & Plastic Push Fastener"
    },
    featured: true,
    minQuantity: 100,
    tags: ["Satin Lanyard", "Safety Breakaway", "Event Credentials", "Custom Lanyards", "ID Card Neck Cord"],
    seoTitle: "Custom Multi-Colour Satin Lanyard with Safety Breakaway | RR Foundations",
    seoDescription: "Direct manufacturer of custom printed satin neck lanyards with quick-release breakaway clasps in Delhi. Bulk pricing available."
  },
  {
    id: "prod_lanyards-credentials_satin_dualtone",
    title: "Dual-Tone Printed Satin Lanyard with Quick-Release Detachable Buckle",
    slug: "dualtone-printed-satin-lanyard-quick-release",
    category: "lanyards-credentials",
    categoryName: "Lanyards & Identification",
    shortDescription: "Executive dual-tone corporate lanyard with lower detachable buckle and heavy-duty badge attachment.",
    fullDescription: "Premium double-faced smooth satin neck strap custom branded for institutional apparel and corporate identity programs. Features a front-accessible heavy-duty acetal detachable buckle for quick swipe-card detachment, along with durable reinforced bar-tack stitching.",
    primaryFile: "WhatsApp Image 2026-11-14 at 10.01.39 PM (1).jpeg",
    primaryDest: "lanyard-satin-royal-dualtone.jpeg",
    secondaryFiles: [
      { src: "WhatsApp Image 2026-11-14 at 10.01.38 PM (2).jpeg", dest: "lanyard-satin-royal-dualtone-alt1.jpeg" },
      { src: "WhatsApp Image 2026-11-14 at 10.01.39 PM.jpeg", dest: "lanyard-satin-royal-dualtone-alt2.jpeg" }
    ],
    materials: ["Soft-Touch Gloss Satin", "Engineered Polyacetal (POM) Buckle", "Stainless Steel Rivet Fasteners"],
    specifications: {
      "Width": "20mm",
      "Strap Length": "450mm folded",
      "Buckle Type": "Lower Quick-Release Detachable Clip",
      "Colorway": "High-Contrast Dual Tone (Custom Pantone Matched)",
      "Print Process": "Silk Screen & Sublimation Dye Infusion"
    },
    featured: false,
    minQuantity: 100,
    tags: ["Corporate Lanyard", "Detachable Buckle", "Dual Tone Lanyard", "Employee Badge Strap"],
    seoTitle: "Dual-Tone Printed Satin Lanyard with Detachable Buckle | RR Foundations",
    seoDescription: "Custom manufactured dual-tone corporate satin lanyards with quick-release lower buckles for seamless access card usage."
  },
  {
    id: "prod_lanyards-credentials_satin_yellow",
    title: "Executive High-Visibility Satin Lanyard with Swivel Dog Hook",
    slug: "executive-high-visibility-satin-lanyard-swivel-hook",
    category: "lanyards-credentials",
    categoryName: "Lanyards & Identification",
    shortDescription: "High-visibility canary yellow satin neck strap with 360-degree swivel lobster dog hook and release buckle.",
    fullDescription: "Engineered for high visibility in manufacturing facilities, logistics hubs, and large conferences. Woven with smooth anti-fray edges and printed with water-resistant eco-solvent inks that retain vibrancy through prolonged daily wear.",
    primaryFile: "WhatsApp Image 2026-11-14 at 10.01.38 PM (3).jpeg",
    primaryDest: "lanyard-satin-corporate-yellow-buckle.jpeg",
    secondaryFiles: [],
    materials: ["Reinforced High-Visibility Satin", "Die-Cast Zinc Swivel Lobster Clasp", "Tough Acetal Buckle"],
    specifications: {
      "Ribbon Width": "20mm",
      "Total Loop Length": "900mm",
      "Hardware Hook": "Heavy-Duty 360° Rotating Dog Hook",
      "Washability": "Machine washable & fade resistant",
      "Branding": "Repeating continuous precision logo print"
    },
    featured: false,
    minQuantity: 100,
    tags: ["High Visibility Lanyard", "Swivel Dog Hook", "Yellow Lanyard", "Factory ID Strap"],
    seoTitle: "High-Visibility Satin Lanyard with Swivel Lobster Hook | RR Foundations",
    seoDescription: "Industrial grade high-visibility yellow satin printed neck lanyards with metal swivel dog hooks for corporate staff."
  },

  // --- EXAM BOARDS & DESK STATIONERY ---
  {
    id: "prod_examboards-stationery_asian_paints",
    title: "Custom Printed Heavy-Duty Corporate Clipboard & Exam Pad",
    slug: "custom-printed-heavy-duty-corporate-clipboard-exam-pad",
    category: "examboards-stationery",
    categoryName: "Exam Boards & Desk Stationery",
    shortDescription: "Commercial grade shatterproof clipboard with high-tension steel spring clip and full-bleed corporate graphics.",
    fullDescription: "Manufactured from rigid high-impact molded composite polymer with an extended top arch header for brand visibility. Fitted with a heavy-gauge nickel-plated wire clip featuring protective rubberized corner grips that firmly hold up to 80 sheets without slipping.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.10.00 PM.jpeg",
    primaryDest: "clipboard-asian-paints-trucare.jpeg",
    secondaryFiles: [
      { src: "WhatsApp Image 2026-11-14 at 7.10.00 PM (1).jpeg", dest: "clipboard-asian-paints-trucare-alt1.jpeg" },
      { src: "WhatsApp Image 2026-11-14 at 7.10.00 PM (2).jpeg", dest: "clipboard-asian-paints-trucare-alt2.jpeg" }
    ],
    materials: ["High-Impact Shatter-Resistant Polypropylene", "Tempered Carbon Steel Clip", "Anti-Scratch Polycarbonate Overlay"],
    specifications: {
      "Dimensions": "225mm x 350mm (Accommodates A4 / Legal)",
      "Clip Capacity": "Up to 80 Sheets",
      "Board Thickness": "3.2mm Rigid Core",
      "Header Detail": "Raised Contour Branding Header with High-Gloss Badge",
      "Hanging Option": "Retractable Wall Mount Eyelet"
    },
    featured: true,
    minQuantity: 50,
    tags: ["Exam Board", "Corporate Clipboard", "Writing Pad", "Asian Paints Merchandise", "Stationery Board"],
    seoTitle: "Custom Printed Heavy-Duty Corporate Clipboard & Writing Pad | RR Foundations",
    seoDescription: "Direct factory manufacturer of rigid promotional clipboards and examination pads with steel spring clips in Delhi."
  },
  {
    id: "prod_examboards-stationery_calendar_stand",
    title: "Molded Desktop Perpetual Calendar Stand & Mobile Dock",
    slug: "molded-desktop-perpetual-calendar-stand-mobile-dock",
    category: "examboards-stationery",
    categoryName: "Exam Boards & Desk Stationery",
    shortDescription: "Multi-functional desktop promotional calendar frame with integrated smartphone rest and corporate dial banner.",
    fullDescription: "An indispensable corporate desk companion featuring high-precision molded ABS construction with an angled viewing stand. Includes a perpetual sliding month/date selector, custom printed company badge aperture, and an ergonomic front phone ledge.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.23.43 PM.jpeg",
    primaryDest: "desktop-calendar-stand-mobile-holder.jpeg",
    secondaryFiles: [
      { src: "WhatsApp Image 2026-11-14 at 7.23.43 PM (1).jpeg", dest: "desktop-calendar-stand-mobile-holder-alt.jpeg" }
    ],
    materials: ["Engineering Grade Molded ABS", "Matte Coated Calendar Inserts", "Non-Skid Base Pads"],
    specifications: {
      "Dimensions": "110mm x 190mm x 75mm",
      "Base Style": "Dual-Purpose Mobile Stand + Card Slot",
      "Calendar Window": "Smooth Gliding Month / Date Index",
      "Branding Area": "Dual Surface (Top Header & Base Lip)",
      "Finish": "Pastel Satin Turquoise / Custom Pantone"
    },
    featured: false,
    minQuantity: 100,
    tags: ["Desktop Calendar", "Mobile Stand", "Havells Astura", "Desk Stationery", "Promotional Gift"],
    seoTitle: "Desktop Perpetual Calendar Stand & Phone Rest | RR Foundations",
    seoDescription: "Custom manufactured desktop calendar stands with phone holders for corporate brand merchandising and executive gifting."
  },
  {
    id: "prod_examboards-stationery_tri_organizer",
    title: "Tri-Compartment Industrial Desk Pen Stand & Utility Organizer",
    slug: "tri-compartment-industrial-desk-pen-stand-organizer",
    category: "examboards-stationery",
    categoryName: "Exam Boards & Desk Stationery",
    shortDescription: "Heavy-duty 3-slot desktop pen container with weighted flared base and wrap-around branding plate.",
    fullDescription: "Constructed with thick-walled molded polypropylene for rugged daily desk usage in offices, retail counters, and dealer networks. Features one wide rear pocket for scissors and rulers and two forward divisions for pens and highlighters.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.23.44 PM.jpeg",
    primaryDest: "desk-organizer-iffco-nano-zinc.jpeg",
    secondaryFiles: [
      { src: "WhatsApp Image 2026-11-14 at 7.23.45 PM.jpeg", dest: "desk-organizer-iffco-nano-zinc-alt1.jpeg" },
      { src: "WhatsApp Image 2026-11-14 at 7.23.46 PM.jpeg", dest: "desk-organizer-iffco-nano-zinc-alt2.jpeg" }
    ],
    materials: ["Molded Polypropylene Plastic", "UV Gloss Printed In-Mold Label (IML)"],
    specifications: {
      "Compartments": "3 Compartments (1 Rear Arch + 2 Front Wells)",
      "Overall Dimensions": "95mm x 90mm x 110mm",
      "Base": "Flared Anti-Tip Weighted Footprint",
      "Branding": "Wrap-Around High Resolution Direct Graphic Print",
      "Color": "Industrial Charcoal Black / Custom"
    },
    featured: false,
    minQuantity: 150,
    tags: ["Pen Stand", "Desk Organizer", "Stationery Holder", "IFFCO Merchandise", "Dealer Counter Gift"],
    seoTitle: "Tri-Compartment Industrial Desk Pen Stand Organizer | RR Foundations",
    seoDescription: "Bulk manufacturer of durable 3-division plastic desk pen stands with custom full-color promotional branding panels."
  },
  {
    id: "prod_examboards-stationery_doctor_coat",
    title: "Doctor Coat & Stethoscope Ceramic Desktop Pen Holder Memento",
    slug: "doctor-coat-stethoscope-ceramic-desktop-pen-holder-memento",
    category: "examboards-stationery",
    categoryName: "Exam Boards & Desk Stationery",
    shortDescription: "3D sculpted white ceramic physician lab coat pen stand with embossed stethoscope for medical and pharmaceutical gifting.",
    fullDescription: "A specialized commemorative desktop memento handcrafted in fine glazed porcelain ceramic. Features intricate relief sculpting of a medical doctor's lab coat, lapel collar, buttons, and hanging stethoscope with an interior deep hollow for medical pens.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.23.46 PM (3).jpeg",
    primaryDest: "desk-organizer-doctor-coat-memento.jpeg",
    secondaryFiles: [
      { src: "WhatsApp Image 2026-11-14 at 7.23.46 PM (1).jpeg", dest: "desk-organizer-doctor-coat-memento-alt1.jpeg" },
      { src: "WhatsApp Image 2026-11-14 at 7.23.46 PM (2).jpeg", dest: "desk-organizer-doctor-coat-memento-alt2.jpeg" }
    ],
    materials: ["High-Fired Glazed Ceramic Porcelain", "Enamel Black Accent Detailing", "Felt Cushion Base"],
    specifications: {
      "Height": "125mm",
      "Width": "85mm",
      "Hollow Depth": "115mm (Holds 4-6 Writing Instruments)",
      "Finish": "Gloss White Enamel with Relief Molded Details",
      "Target Industry": "Pharmaceuticals, Hospitals, Medical Conferences"
    },
    featured: true,
    minQuantity: 50,
    tags: ["Doctor Pen Stand", "Medical Memento", "Pharma Gift", "Ceramic Pen Holder", "Doctor Day Gift"],
    seoTitle: "Doctor Lab Coat Ceramic Pen Stand Memento | RR Foundations",
    seoDescription: "Exclusive manufacturer of sculpted ceramic doctor coat and stethoscope desktop pen holders for pharma branding and clinic desks."
  },
  {
    id: "prod_examboards-stationery_drum_pen_stand",
    title: "Industrial Oil Drum Cylinder Desktop Pen Holder",
    slug: "industrial-oil-drum-cylinder-desktop-pen-holder",
    category: "examboards-stationery",
    categoryName: "Exam Boards & Desk Stationery",
    shortDescription: "Miniature 55-gallon steel barrel replica molded pen cup for automotive, petroleum, and lubricants branding.",
    fullDescription: "Styled after classic industrial storage drums with authentic triple-rib contours. Precision injection-molded from durable polypropylene with high impact resistance and ample internal volume for scissors, pens, markers, and stylus tools.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.23.47 PM.jpeg",
    primaryDest: "desk-organizer-industrial-drum-barrel.jpeg",
    secondaryFiles: [
      { src: "WhatsApp Image 2026-11-14 at 7.23.47 PM (1).jpeg", dest: "desk-organizer-industrial-drum-barrel-alt.jpeg" }
    ],
    materials: ["Tough Molded Polypropylene", "Scratch-Resistant Pigmentation"],
    specifications: {
      "Diameter": "78mm",
      "Height": "105mm",
      "Design": "Triple Ribbed Industrial Drum Silhouette",
      "Capacity": "Up to 15 Writing Instruments",
      "Customization": "Full-Body Screen Print or Laser Engraved Metal Badge"
    },
    featured: false,
    minQuantity: 100,
    tags: ["Barrel Pen Holder", "Drum Pen Stand", "Industrial Merchandise", "Automotive Gift", "Petroleum Gifting"],
    seoTitle: "Industrial Drum Barrel Cylinder Desk Pen Holder | RR Foundations",
    seoDescription: "Custom molded barrel and oil drum replica pen stands for automotive, lubricant, and construction industry corporate gifting."
  },
  {
    id: "prod_examboards-stationery_srmb_pen_stand",
    title: "Segmented Revolving Round Desk Pen Stand",
    slug: "segmented-revolving-round-desk-pen-stand",
    category: "examboards-stationery",
    categoryName: "Exam Boards & Desk Stationery",
    shortDescription: "Cylindrical desktop pen organizer with tri-split inner divider and high-contrast protective rim for building material brands.",
    fullDescription: "A sturdy, compact desktop organizer engineered for construction, steel, and cement dealer networks. Equipped with an internal triple-separator to segregate ballpoints, highlighters, and small stationery items, featuring vibrant custom silk screen branding on the exterior drum.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.23.47 PM (2).jpeg",
    primaryDest: "desk-organizer-srmb-tmt-revolving.jpeg",
    secondaryFiles: [
      { src: "WhatsApp Image 2026-11-14 at 7.23.48 PM (1).jpeg", dest: "desk-organizer-srmb-tmt-revolving-alt1.jpeg" },
      { src: "WhatsApp Image 2026-11-14 at 7.23.48 PM.jpeg", dest: "desk-organizer-srmb-tmt-revolving-alt2.jpeg" }
    ],
    materials: ["Engineering Polymer Housing", "Weighted Base Ring", "High-Gloss Screen-Printed Body"],
    specifications: {
      "Diameter": "82mm",
      "Height": "100mm",
      "Internal Partition": "Tri-Sector Y-Divider",
      "Upper Lip": "Accent Colored Protective Collar",
      "Branding": "360° Wrap Silk Screen Print"
    },
    featured: false,
    minQuantity: 150,
    tags: ["Segmented Pen Stand", "SRMB TMT", "Dealer Merchandising", "Desk Stationery", "Corporate Pen Cup"],
    seoTitle: "Segmented Round Desk Pen Stand Organizer | RR Foundations",
    seoDescription: "Custom manufactured round segmented desk pen cups with internal dividers for corporate gifting and distributor networks."
  },

  // --- BADGES & LAPEL PINS ---
  {
    id: "prod_badges-lapel-pins_ndrf_medallion",
    title: "National Disaster Response Force (NDRF) Commemorative Gold Medallion",
    slug: "ndrf-commemorative-gold-relief-medallion-lapel-pin",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Heavyweight die-struck solid brass medallion with mirror gold plating, high-relief Ashoka Lion crest, and hard enamel.",
    fullDescription: "Commissioned for rescue force commandos and institutional honors, this master-crafted circular medallion features ultra-high multi-level relief stamping. Finished in electroplated 24K real gold with raised lettering and hand-filled vibrant fire enamel in deep black, safety orange, and medical red.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.16.18 PM (3).jpeg",
    primaryDest: "badge-metal-ndrf-gold-relief.jpeg",
    secondaryFiles: [],
    materials: ["Solid Forged Brass Core", "24K Real Gold Electroplating", "High-Fired Vitreous Hard Enamel"],
    specifications: {
      "Diameter": "45mm / 50mm",
      "Thickness": "3.5mm Heavy Gauge",
      "Edge Type": "Diamond-Cut Beveled Mirror Rim",
      "Relief Detail": "3D Sculpted National Emblem & Rescue Operative Figure",
      "Attachment": "Heavy Dual Military Clutch Posts or Display Easel"
    },
    featured: true,
    minQuantity: 25,
    tags: ["NDRF Medallion", "Disaster Response Badge", "Military Insignia", "Gold Crest Pin", "Institutional Commemorative"],
    seoTitle: "NDRF Commemorative Gold Relief Medallion & Crest Pin | RR Foundations",
    seoDescription: "Manufacturer of official commemorative die-struck gold relief medallions, police medals, and force insignias in New Delhi."
  },
  {
    id: "prod_badges-lapel-pins_bjp_oval_badge",
    title: "Oval Political Campaign Button & Lapel Badge",
    slug: "oval-political-campaign-button-lapel-badge",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "High-contrast molded oval campaign badge with saffron bezel, UV printed emblem, and safety pin backing.",
    fullDescription: "Specially designed for political election rallies, worker assemblies, and public movement campaigns. Constructed with a shatterproof polymer molded bezel frame that locks around a vivid, high-resolution UV printed aluminum plate, delivering crisp lettering and symbol clarity across distance.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.16.18 PM (8).jpeg",
    primaryDest: "badge-pin-bjp-campaign-oval.jpeg",
    secondaryFiles: [],
    materials: ["High-Impact Molded Polymer Frame", "Anodized Aluminum Graphic Plate", "Tempered Steel Brooch Safety Pin"],
    specifications: {
      "Dimensions": "42mm x 68mm Oval",
      "Frame Profile": "Saffron Molded Protective Border with Integrated Lanyard Loop",
      "Print Quality": "1440 DPI Direct Flatbed UV Print",
      "Fastener": "Rear Molded Safety Pin Bar",
      "Weight": "Ultra-Lightweight 12g (Apparel Friendly)"
    },
    featured: true,
    minQuantity: 200,
    tags: ["Political Badge", "BJP Badge", "Election Campaign Pin", "Oval Lapel Badge", "Party Merchandise"],
    seoTitle: "Oval Political Campaign Lapel Badge & Button | RR Foundations",
    seoDescription: "High-speed bulk manufacturing of political campaign lapel badges, election insignias, and worker buttons in Delhi."
  },
  {
    id: "prod_badges-lapel-pins_nsg_enamel_pin",
    title: "Elite Commando & Institutional Gold Plated Enamel Lapel Pin",
    slug: "elite-commando-institutional-gold-plated-enamel-lapel-pin",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Circular die-struck brass lapel pin with 24K gold rim, Ashoka Lion center crest, and glossy epoxy finish.",
    fullDescription: "Crafted for prestigious defense organizations, VIP protection units, and corporate security councils. Produced via precision hydraulic die-stamping with razor-sharp micro-typography along the outer perimeter, electroplated gold border, and protective liquid crystal resin doming.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.16.18 PM (9).jpeg",
    primaryDest: "badge-metal-nsg-gold-enamel.jpeg",
    secondaryFiles: [],
    materials: ["Die-Struck Brass Core", "Liquid Polyurethane Crystal Doming", "Gilded Gold Mirror Finish"],
    specifications: {
      "Diameter": "30mm / 35mm",
      "Thickness": "2.2mm",
      "Finish": "High-Gloss Mirror Gold with Black Enamel Ring",
      "Attachment": "Anti-Rotational Dual Spur Spur Butterfly Clutch",
      "Water & Chemical Resistance": "100% Sealed Waterproof Epoxy"
    },
    featured: false,
    minQuantity: 50,
    tags: ["NSG Pin", "Security Guard Badge", "Commando Lapel Pin", "Institutional Metal Pin", "Gold Crest"],
    seoTitle: "Elite Commando & Security Gold Plated Lapel Pin | RR Foundations",
    seoDescription: "Custom manufacturer of defense, commando, and police gold plated lapel pins with durable epoxy doming in India."
  },
  {
    id: "prod_badges-lapel-pins_brass_nameplate_magnetic",
    title: "Heavy-Gauge Solid Brass Staff Name Badge with Magnetic Fastener",
    slug: "heavy-gauge-solid-brass-staff-name-badge-magnetic-fastener",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Executive jeweler and luxury retail brass name badge with triple neodymium magnet bar and UV gloss print.",
    fullDescription: "Specifically engineered for luxury retail personnel, fine jewelry showrooms, hospitality executives, and private banking staff. Made with mirror-polished jeweler's brass featuring rounded corners, micro-beveled borders, and apparel-safe multi-magnet backings that eliminate pinhole damage to fine clothing.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.17.30 PM.jpeg",
    primaryDest: "badge-nameplate-magnetic-brass-trimurti.jpeg",
    secondaryFiles: [],
    materials: ["C260 Solid Cartridge Brass", "Neodymium N42 Triple Magnet Bar", "Scratch-Resistant Polyurethane Dome"],
    specifications: {
      "Dimensions": "75mm x 25mm x 1.5mm",
      "Base Metal": "Brushed & Polished Natural Brass",
      "Fastener": "Anti-Slip Magnetic Backing Bar (2.5kg holding strength)",
      "Customization": "Full-Color Photographic UV Micro-Print + Individual Staff Names",
      "Safety": "Zero Fabric Penetration (Suit & Silk Safe)"
    },
    featured: true,
    minQuantity: 20,
    tags: ["Brass Name Badge", "Magnetic Name Tag", "Jewelry Showroom Badge", "Staff ID Badge", "Luxury Nameplate"],
    seoTitle: "Solid Brass Magnetic Staff Name Badges | RR Foundations Delhi",
    seoDescription: "Manufacturer of executive solid brass name badges with triple neodymium magnetic clasps for luxury showrooms and hotels."
  },
  {
    id: "prod_badges-lapel-pins_beveled_nameplate_bezel",
    title: "Luxury Beveled Metal Name Badges with High-Gloss Doming",
    slug: "luxury-beveled-metal-name-badges-high-gloss-doming",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Two-tone metallic name tag with polished gold or chrome perimeter rim and crystal-clear epoxy crystal face.",
    fullDescription: "A standout name badge engineered for high-end luxury stores, financial institutes, and five-star concierge teams. Built with a solid cast metallic frame with prominent polished bezels that frame a brushed gold and royal midnight blue or piano black face.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.17.30 PM (3).jpeg",
    primaryDest: "badge-nameplate-executive-gold-bezel.jpeg",
    secondaryFiles: [],
    materials: ["Die-Cast Zinc Alloy Frame", "Brushed Metallic Core Layer", "Optical-Clear Polyurethane Lens"],
    specifications: {
      "Dimensions": "70mm x 28mm",
      "Bezel Finish": "High-Mirror Gold / Polished Silver Chrome",
      "Backing Options": "Dual Neodymium Magnetic Bar or Safety Brooch Pin",
      "Corner Radius": "Smooth 4mm Ergonomic Rounded Corners",
      "Text Process": "Metallic Foil Thermal Stamping & Sublimation"
    },
    featured: false,
    minQuantity: 30,
    tags: ["Beveled Name Badge", "Luxury Name Tag", "Tiffany Style Badge", "Executive Badge", "Corporate Nameplate"],
    seoTitle: "Luxury Beveled Metal Name Badges with Epoxy Doming | RR Foundations",
    seoDescription: "Custom luxury beveled gold and chrome framed staff name badges with optical resin coating for premier retail brands."
  },
  {
    id: "prod_badges-lapel-pins_india_map_tiranga",
    title: "Sovereign India Map Gold-Plated Tricolor Enamel Lapel Pin",
    slug: "sovereign-india-map-gold-plated-tricolor-enamel-lapel-pin",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Iconic geographical silhouette of India in gold-plated brass with authentic tricolor enamel and radiant 24-spoke Ashoka Chakra.",
    fullDescription: "A sovereign patriotic masterpiece manufactured to exact territorial contours. Stamped from pure jewelry-grade brass with genuine 24K bright gold plating along all coastline borders and internal partition fences. Features hand-leveled hard enamel in deep saffron, pure white, and India green with an ultra-fine navy blue Ashoka Chakra.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.18.20 PM.jpeg",
    primaryDest: "badge-lapel-pin-india-map-tiranga.jpeg",
    secondaryFiles: [],
    materials: ["Jeweler's Solid Brass", "24K Gold Electroplate", "Hard Cloisonné Style Glass Enamel"],
    specifications: {
      "Height": "38mm",
      "Width": "32mm",
      "Thickness": "2.2mm",
      "Chakra Detail": "Micro-Etched 24 Spoke Radiant Blue Wheel",
      "Fastener": "Dual Gold Butterfly Clutch Pins (Prevents Spin on Lapels)"
    },
    featured: true,
    minQuantity: 50,
    tags: ["India Map Pin", "Tiranga Lapel Pin", "Indian Flag Badge", "Patriotic Metal Pin", "Republic Day Merchandise"],
    seoTitle: "India Map Gold Plated Tricolor Enamel Lapel Pin | RR Foundations",
    seoDescription: "Direct manufacturer of precision die-struck India map tricolor enamel lapel pins with 24K gold plating in Delhi."
  },
  {
    id: "prod_badges-lapel-pins_rotaract_women",
    title: "Custom Die-Struck Soft Enamel Lapel Pin — Rotaract Edition",
    slug: "custom-die-struck-soft-enamel-lapel-pin-rotaract",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Contour die-cut silver-plated lapel pin featuring intricate recessed soft enamel artwork and polished metal ridges.",
    fullDescription: "Manufactured for social leadership initiatives, Rotary clubs, and charitable foundations. Custom die-cut to follow the exact profile of the emblem, with raised nickel-silver ridges and recessed Pantone-matched royal navy blue and crisp white enamel fills.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.18.21 PM.jpeg",
    primaryDest: "badge-lapel-pin-rotaract-women.jpeg",
    secondaryFiles: [],
    materials: ["Die-Struck Iron / Zinc Core", "Bright Nickel Silver Electroplate", "Low-Bake Soft Enamel Color Fill"],
    specifications: {
      "Width": "35mm",
      "Height": "24mm",
      "Edge Type": "Custom Contour Die-Cut",
      "Colorway": "Pantone 287C Navy & Pure White",
      "Fastener": "Spurred Butterfly Clutch or Rubber Pin Back"
    },
    featured: false,
    minQuantity: 100,
    tags: ["Rotaract Pin", "Soft Enamel Pin", "Rotary Club Badge", "Die Cut Lapel Pin", "Custom Enamel Badge"],
    seoTitle: "Custom Die-Struck Soft Enamel Lapel Pins | RR Foundations",
    seoDescription: "Custom manufactured soft enamel lapel pins with nickel and silver plating for Rotary clubs, NGOs, and student movements."
  },
  {
    id: "prod_badges-lapel-pins_rope_border_gold",
    title: "Heritage Rope-Bordered Die-Struck Lapel Pins & Tie Clips",
    slug: "heritage-rope-bordered-die-struck-lapel-pins-tie-clips",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Vintage nautical twisted rope edge circular medallion pins in polished gold with clutch pin and tie clip variants.",
    fullDescription: "Exuding classic institutional elegance, this line features high-relief nautical braided rope edging around a circular recessed dial. Available with hard enamel insignia filling or full-bleed micro-print coated in crystal clear epoxy, with versatile fastening fixtures including tie clips, butterfly clutches, and brooch pins.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.19.28 PM (1).jpeg",
    primaryDest: "badge-lapel-pin-rope-edge-gold-plated.jpeg",
    secondaryFiles: [],
    materials: ["Forged Brass Core", "24K Mirror Gold Electroplate", "Vitreous Color Enamels"],
    specifications: {
      "Diameter": "25mm / 28mm / 32mm",
      "Edge Detailing": "Precision 3D Braided Nautical Rope Border",
      "Backing Options": "Spring Tie Bar / Military Clutch / Safety Clasp",
      "Base Plating": "Rich 24K Yellow Gold",
      "Applications": "Naval Clubs, Maritime Institutions, Universities, Annual Honors"
    },
    featured: true,
    minQuantity: 50,
    tags: ["Rope Edge Lapel Pin", "Tie Pin", "Heritage Metal Badge", "Gold Medallion Pin", "Maritime Insignia"],
    seoTitle: "Heritage Rope Bordered Die-Struck Lapel Pins & Tie Bars | RR Foundations",
    seoDescription: "Manufacturer of luxury rope edge gold plated lapel pins, naval badges, and corporate tie pins in New Delhi."
  },
  {
    id: "prod_badges-lapel-pins_executive_tie_bar",
    title: "Gold-Plated Corporate Tie Bar & Tie Clip with Custom Insignia",
    slug: "gold-plated-corporate-tie-bar-tie-clip-custom-insignia",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "High-polish alligator jaw gold tie clip featuring die-struck corporate emblem and spring-tension grip.",
    fullDescription: "Engineered for executive gifting, aviation crews, and banking institutions. Stamped from spring-tempered jeweler's brass with heavy gold plating and ribbed alligator tooth jaws that hold neckties firmly in place without snagging silk fabrics. Decorated with circular or custom-contoured brand medallions.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.19.28 PM (3).jpeg",
    primaryDest: "tie-clip-corporate-executive-gold-plated.jpeg",
    secondaryFiles: [],
    materials: ["Spring-Tempered Brass Bar", "24K Hard Gold Electroplating", "Cloisonné Enamel Medallion"],
    specifications: {
      "Bar Length": "55mm",
      "Bar Width": "6mm",
      "Medallion Size": "16mm Diameter / Custom Contour",
      "Spring Action": "High-Tensile Steel Pivot Spring with Serrated Alligator Grip",
      "Packaging": "Executive Velvet Lined Presentation Gift Box"
    },
    featured: false,
    minQuantity: 50,
    tags: ["Tie Clip", "Corporate Tie Bar", "Bank of Baroda Tie Pin", "Executive Gifting", "Gold Tie Bar"],
    seoTitle: "Gold-Plated Corporate Tie Clips & Tie Bars | RR Foundations",
    seoDescription: "Custom manufacturer of high-polish gold plated corporate tie clips and necktie bars with bespoke brand insignias in Delhi."
  },
  {
    id: "prod_badges-lapel-pins_caza_combo",
    title: "Dual Shape Corporate Identity Badge & Lapel Pin Combo",
    slug: "dual-shape-corporate-identity-badge-lapel-pin-combo",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Chrome finish circular domed badge alongside square gold beveled lapel pin for multi-tier executive branding.",
    fullDescription: "A turnkey corporate identity set designed for real estate developers and infrastructure groups. Features a large silver chrome beveled round badge for site managers paired with an executive 20mm square gold-plated lapel pin with rich royal blue and gold hot-stamped branding for boardroom presentations.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.19.28 PM (4).jpeg",
    primaryDest: "badge-lapel-pin-caza-round-square.jpeg",
    secondaryFiles: [],
    materials: ["Solid Brass & Zinc Alloy", "Bright Chrome & 24K Gold Electroplating", "High-Optic Epoxy Resin"],
    specifications: {
      "Round Badge Size": "35mm Diameter (Silver Chrome Bezel)",
      "Square Pin Size": "20mm x 20mm (Gold Beveled Border)",
      "Coatings": "UV Cured Non-Yellowing Polyurethane Dome",
      "Backing Hardware": "Magnetic Dual Disk & Butterfly Pin Clutch",
      "Application": "Real Estate Executives, Corporate Staff, Site Engineers"
    },
    featured: false,
    minQuantity: 50,
    tags: ["Corporate Badge Set", "Developer Lapel Pin", "Square Lapel Pin", "Chrome Dome Badge", "Executive Combo"],
    seoTitle: "Dual Shape Corporate Badge & Lapel Pin Set | RR Foundations",
    seoDescription: "Custom manufactured round chrome dome badges and square gold lapel pin sets for corporate branding in Delhi."
  },
  {
    id: "prod_badges-lapel-pins_icai_member",
    title: "ICAI CA Member Gold-Foil Embossed Crystal Dome Lapel Pin",
    slug: "icai-ca-member-gold-foil-embossed-crystal-dome-lapel-pin",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Circular official Chartered Accountant insignia pin with shimmering gold border and protective crystal dome.",
    fullDescription: "Manufactured for qualified Chartered Accountants, audit partners, and financial advisors. Boasts a radiant gold-plated coin rim, micro-screened CA logo with the national emerald-green upward trajectory arrow, and a curved domed crystal resin face that amplifies depth and light reflection.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.19.28 PM (6).jpeg",
    primaryDest: "badge-lapel-pin-icai-member-dome.jpeg",
    secondaryFiles: [],
    materials: ["Jeweler's Brass Base", "24K Gold Electroplated Bezel", "Optical Grade Flexible Resin Dome"],
    specifications: {
      "Diameter": "22mm / 25mm",
      "Thickness": "2.5mm",
      "Graphic Layer": "Gold Foil Underlay with High-Precision Black & Green Print",
      "Backing": "Deluxe Flat-Head Butterfly Clutch Pin",
      "Resistance": "Scratch-Proof & Fade Resistant"
    },
    featured: false,
    minQuantity: 50,
    tags: ["ICAI Badge", "CA Lapel Pin", "Chartered Accountant Pin", "Professional Badge", "Gold Dome Pin"],
    seoTitle: "ICAI CA Member Gold Foil Crystal Dome Lapel Pin | RR Foundations",
    seoDescription: "Official manufacturer of Chartered Accountant (ICAI) gold plated crystal dome lapel pins for professionals in India."
  },
  {
    id: "prod_badges-lapel-pins_armed_forces_flag_day",
    title: "Armed Forces Flag Day Official Gold Commemorative Lapel Pins",
    slug: "armed-forces-flag-day-official-gold-commemorative-lapel-pins",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Official tricolor military tri-service emblem lapel pins with bright gold rim and butterfly clutch for Armed Forces Day.",
    fullDescription: "Produced in bulk quantities for Rajya Sainik Boards, military welfare departments, and institutional patriotic observances. Features the official tri-service Indian Armed Forces crest in authentic defense red and navy blue enamel with golden crossed anchors and swords, framed by a polished golden ring.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.20.12 PM.jpeg",
    primaryDest: "badge-lapel-pin-armed-forces-flag-day.jpeg",
    secondaryFiles: [],
    materials: ["Die-Struck Brass / Iron Alloy", "Bright Gold Finish", "Liquid Glass Epoxy Shield"],
    specifications: {
      "Diameter": "25mm",
      "Crest": "Tri-Service Indian Army, Navy & Air Force Shield",
      "Outer Band": "Armed Forces Flag Day State / National Text",
      "Fastener": "Rear Center Spur with Spring Butterfly Clutch",
      "Packaging": "Individual Carded Header Bags for Easy Distribution"
    },
    featured: true,
    minQuantity: 200,
    tags: ["Armed Forces Flag Day", "Military Lapel Pin", "Defense Badge", "Tri-Service Crest", "Commemorative Pin"],
    seoTitle: "Armed Forces Flag Day Official Gold Lapel Pins | RR Foundations",
    seoDescription: "Government and defense approved supplier of Armed Forces Flag Day commemorative lapel pins and buttons in India."
  },
  {
    id: "prod_badges-lapel-pins_korero_dome_badge",
    title: "Executive Roundtable Dome Badges with Polished Gold Rim",
    slug: "executive-roundtable-dome-badges-polished-gold-rim",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Circular VIP conference badge with deep midnight blue face, raised gold border, and high-gloss 3D dome.",
    fullDescription: "Created for executive summits, founder forums, and annual conclaves. Features an extra-deep die-struck brass blank with a stepped golden flange and crystal resin dome that highlights executive names and club insignias with luxurious clarity.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.22.04 PM.jpeg",
    primaryDest: "badge-lapel-pin-korero-founders-forum.jpeg",
    secondaryFiles: [],
    materials: ["C360 Solid Brass Core", "24K Gold Flange", "High-Refractive Polyurethane Dome"],
    specifications: {
      "Diameter": "30mm",
      "Rim Thickness": "2.0mm Raised Profile",
      "Dial Color": "Midnight Navy / Custom Executive Dark Tones",
      "Attachment": "Strong Dual Magnet Backing or Tie Tack Pin",
      "Durability": "Scratch-Proof Self-Healing Resin Face"
    },
    featured: false,
    minQuantity: 50,
    tags: ["Founder Badge", "Executive Roundtable Pin", "VIP Badge", "Gold Rim Dome Pin", "Conference Lapel Pin"],
    seoTitle: "Executive Roundtable Gold Rim Dome Badges | RR Foundations",
    seoDescription: "Manufacturer of executive round table dome lapel pins with raised gold borders for business summits and leadership forums."
  },
  {
    id: "prod_badges-lapel-pins_civil_defence_india",
    title: "Civil Defence India Official Crest & Motto Enamel Lapel Pin",
    slug: "civil-defence-india-official-crest-motto-enamel-lapel-pin",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Shield-profile metal badge with Ashoka Lion, Civil Defence triangle insignia, and crimson scroll motto.",
    fullDescription: "Faithfully reproduces the official insignia of the Civil Defence Organization of India. Features the Ashoka emblem over the protective blue and orange triangle inside an olive laurel wreath, accented by a lower curved banner reading 'Sarva Bhuta Hite Ratah' on a deep crimson enamel ribbon.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.22.59 PM (1).jpeg",
    primaryDest: "badge-lapel-pin-civil-defence-india.jpeg",
    secondaryFiles: [],
    materials: ["Solid Forged Brass Core", "High-Polish Gold Electroplate", "Vitreous Oven-Baked Enamels"],
    specifications: {
      "Height": "38mm",
      "Width": "32mm",
      "Lower Scroll": "Crimson Enamel Ribbon with Gilded Motto",
      "Fastener": "Dual Butterfly Clutches with Anti-Turn Spurs",
      "Plating": "Tarnish-Proof 24K Yellow Gold"
    },
    featured: false,
    minQuantity: 50,
    tags: ["Civil Defence Badge", "Civil Defence Lapel Pin", "Government Insignia", "Police Badge", "State Crest Pin"],
    seoTitle: "Civil Defence India Crest & Motto Enamel Lapel Pin | RR Foundations",
    seoDescription: "Official manufacturer of Civil Defence India enameled crest lapel pins and government uniform insignias in New Delhi."
  },
  {
    id: "prod_badges-lapel-pins_nit_rourkela_crest",
    title: "NIT Rourkela University Crest Pin with Dual Neodymium Magnetic Backing",
    slug: "nit-rourkela-university-crest-pin-magnetic-backing",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Precision die-cut engineering gear & torch crest badge with clothing-safe high-strength magnetic backing.",
    fullDescription: "Crafted for prestigious alumni convocations, faculty robes, and visiting delegates. Precision die-cut in the complex mechanical gear contour of the National Institute of Technology Rourkela crest, with multi-color hard enamel infills and a zero-puncture round neodymium magnet fastener.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.22.59 PM (3).jpeg",
    primaryDest: "badge-lapel-pin-nit-rourkela-magnetic.jpeg",
    secondaryFiles: [],
    materials: ["Die-Struck Brass / Nickel Core", "Hard Baked Cloisonné Enamel", "Grade N50 Neodymium Magnetic Disk"],
    specifications: {
      "Dimensions": "32mm x 32mm Gear Contour",
      "Enamel Colors": "Terracotta Orange, Pure White, Cobalt Blue",
      "Fastener": "Round Magnetic Backing Plate (Preserves Silk & Suits)",
      "Edges": "Mirror Polished Silver Nickel",
      "Applications": "Alumni Meets, Convocations, Faculty Identity"
    },
    featured: true,
    minQuantity: 50,
    tags: ["NIT Rourkela Pin", "University Crest Badge", "Alumni Lapel Pin", "Magnetic Crest Pin", "College Insignia"],
    seoTitle: "NIT Rourkela Magnetic University Crest Lapel Pin | RR Foundations",
    seoDescription: "Precision manufacturer of university crest lapel pins and institutional academic badges with magnetic fasteners in India."
  },
  {
    id: "prod_badges-lapel-pins_akzvii_square_gold",
    title: "Die-Struck Square Gold Plated Corporate Lapel Pin",
    slug: "die-struck-square-gold-plated-corporate-lapel-pin",
    category: "badges-lapel-pins",
    categoryName: "Badges & Lapel Pins",
    shortDescription: "Minimalist square metallic lapel badge with wide recessed stepped border and mirror-finish gold plating.",
    fullDescription: "A geometric corporate lapel badge engineered for contemporary technology firms, architecture studios, and corporate headquarters. Constructed with dual-level stepped square molding, bright 24K gold mirror plating, and a silk-screened or fiber-laser engraved center emblem.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.23.22 PM (1).jpeg",
    primaryDest: "badge-lapel-pin-akzvii-square-gold.jpeg",
    secondaryFiles: [
      { src: "WhatsApp Image 2026-11-14 at 7.23.22 PM.jpeg", dest: "badge-lapel-pin-akzvii-square-gold-alt.jpeg" }
    ],
    materials: ["C260 Jewelry Grade Brass", "24K Real Gold Electroplating", "Crystal Hard Clearcoat"],
    specifications: {
      "Dimensions": "20mm x 20mm Square",
      "Frame Profile": "Stepped Beveled Picture-Frame Golden Lip",
      "Fastener": "Standard Brass Butterfly Clutch Post",
      "Center Infill": "Vitreous White Enamel with Cyan & Black Logo",
      "Wear Resistance": "High (Anti-Tarnish Clear Lacquer Sealed)"
    },
    featured: false,
    minQuantity: 50,
    tags: ["Square Lapel Pin", "Gold Plated Pin", "Corporate Identity Badge", "Minimalist Pin", "Tech Company Pin"],
    seoTitle: "Die-Struck Square Gold Plated Corporate Lapel Pin | RR Foundations",
    seoDescription: "Manufacturer of custom square gold plated corporate lapel pins with stepped borders and precision logos in New Delhi."
  },

  // --- KEYCHAINS & ACRYLIC CRAFTS ---
  {
    id: "prod_keychains-acrylic-crafts_bjp_silicone",
    title: "3D Molded Soft PVC & Silicone Round Promotional Keychain",
    slug: "3d-molded-soft-pvc-silicone-round-promotional-keychain",
    category: "keychains-acrylic-crafts",
    categoryName: "Keychains & Acrylic Crafts",
    shortDescription: "Vibrant flexible rubberized silicone round keychain with raised 3D rim and heavy nickel-plated 4-link chain.",
    fullDescription: "Built for massive campaign distribution and rugged daily automotive keychain use. Injection molded from 100% non-toxic flexible PVC and silicone rubber with raised dimensional contours that resist tearing, water, and weather degradation, fitted with a 28mm flat split ring.",
    primaryFile: "WhatsApp Image 2026-11-14 at 7.16.18 PM (5).jpeg",
    primaryDest: "keychain-silicone-bjp-lotus.jpeg",
    secondaryFiles: [],
    materials: ["Eco-Friendly Soft PVC / Silicone", "Nickel-Plated Tempered Steel Chain & Ring"],
    specifications: {
      "Diameter": "48mm Round",
      "Thickness": "4.5mm Molded Depth",
      "Edge Profile": "Raised Saffron Rubber Bumper Ring",
      "Ring Hardware": "28mm Flat Tempered Split Ring + 4-Link Welded Chain",
      "Flexibility": "High Flexibility (Bends without cracking or permanent crease)"
    },
    featured: true,
    minQuantity: 250,
    tags: ["Silicone Keychain", "Rubber Keychain", "BJP Keychain", "Political Promotional Item", "3D PVC Keyring"],
    seoTitle: "3D Molded Soft PVC Silicone Round Keychains | RR Foundations",
    seoDescription: "Direct factory manufacturer of custom molded soft PVC and silicone promotional keychains in New Delhi with pan-India delivery."
  }
];

async function run() {
  console.log(`Starting image processing for ${PRODUCT_DEFINITIONS.length} products...`);
  
  const manifestAdditions = [];
  const processedProducts = [];

  for (const p of PRODUCT_DEFINITIONS) {
    // 1. Process primary image
    const primarySrcPath = path.join(SOURCE_DIR, p.primaryFile);
    const primaryDestPath = path.join(TARGET_DIR, p.primaryDest);

    if (fs.existsSync(primarySrcPath)) {
      await sharp(primarySrcPath)
        .rotate() // auto-orient by EXIF
        .jpeg({ quality: 90, mozjpeg: true })
        .toFile(primaryDestPath);
      console.log(`[OK] Processed Primary: ${p.primaryDest}`);
    } else {
      console.error(`[ERR] Source not found: ${primarySrcPath}`);
    }

    const publicThumb = `/assets/products/${p.primaryDest}`;
    const allImages = [publicThumb];

    manifestAdditions.push({
      originalName: p.primaryFile,
      cleanName: p.primaryDest,
      publicPath: publicThumb,
      catSlug: p.category,
      catName: p.categoryName,
      rawCategory: "Product Images New",
      size: fs.existsSync(primaryDestPath) ? fs.statSync(primaryDestPath).size : 0
    });

    // 2. Process secondary images if any
    for (const sec of p.secondaryFiles) {
      const secSrcPath = path.join(SOURCE_DIR, sec.src);
      const secDestPath = path.join(TARGET_DIR, sec.dest);

      if (fs.existsSync(secSrcPath)) {
        await sharp(secSrcPath)
          .rotate()
          .jpeg({ quality: 90, mozjpeg: true })
          .toFile(secDestPath);
        console.log(`[OK] Processed Secondary: ${sec.dest}`);
      } else {
        console.error(`[ERR] Secondary source not found: ${secSrcPath}`);
      }

      const secPublic = `/assets/products/${sec.dest}`;
      allImages.push(secPublic);

      manifestAdditions.push({
        originalName: sec.src,
        cleanName: sec.dest,
        publicPath: secPublic,
        catSlug: p.category,
        catName: p.categoryName,
        rawCategory: "Product Images New (Secondary)",
        size: fs.existsSync(secDestPath) ? fs.statSync(secDestPath).size : 0
      });
    }

    // Build finalized product object
    processedProducts.push({
      id: p.id,
      title: p.title,
      slug: p.slug,
      category: p.category,
      categoryName: p.categoryName,
      shortDescription: p.shortDescription,
      fullDescription: p.fullDescription,
      thumbnail: publicThumb,
      images: allImages,
      materials: p.materials,
      specifications: p.specifications,
      featured: p.featured,
      minQuantity: p.minQuantity,
      tags: p.tags,
      seoTitle: p.seoTitle,
      seoDescription: p.seoDescription
    });
  }

  // --- UPDATE LIB/DATA/PRODUCTS.TS ---
  const productsTsPath = path.join(__dirname, '..', 'lib', 'data', 'products.ts');
  const existingCode = fs.readFileSync(productsTsPath, 'utf8')
    .replace(/import\s+.*?;/g, '')
    .replace(/export\s+const\s+PRODUCTS:\s*Product\[\]\s*=\s*/, 'const PRODUCTS = ') + '; module.exports = PRODUCTS;';
  
  let existingProducts = eval(existingCode);
  
  // Filter out any older duplicate IDs if already present
  const newProductIds = new Set(processedProducts.map(x => x.id));
  existingProducts = existingProducts.filter(x => !newProductIds.has(x.id));
  
  // Prepend new products to the top so they appear front and center on the catalog
  const mergedProducts = [...processedProducts, ...existingProducts];
  
  const updatedTsContent = `import { Product } from "@/types";\n\nexport const PRODUCTS: Product[] = ${JSON.stringify(mergedProducts, null, 2)};\n`;
  fs.writeFileSync(productsTsPath, updatedTsContent, 'utf8');
  console.log(`Updated lib/data/products.ts with ${mergedProducts.length} total products.`);

  // --- UPDATE PUBLIC/DATA/CATALOG.JSON ---
  const catalogJsonPath = path.join(__dirname, '..', 'public', 'data', 'catalog.json');
  let existingCatalog = [];
  if (fs.existsSync(catalogJsonPath)) {
    try {
      existingCatalog = JSON.parse(fs.readFileSync(catalogJsonPath, 'utf8'));
    } catch(e) {}
  }
  existingCatalog = existingCatalog.filter(x => !newProductIds.has(x.id));
  const mergedCatalog = [...processedProducts, ...existingCatalog];
  fs.writeFileSync(catalogJsonPath, JSON.stringify(mergedCatalog, null, 2), 'utf8');
  console.log(`Updated public/data/catalog.json with ${mergedCatalog.length} products.`);

  // --- UPDATE PUBLIC/ASSETS/PRODUCTS_MANIFEST.JSON ---
  const manifestPath = path.join(__dirname, '..', 'public', 'assets', 'products_manifest.json');
  let existingManifest = [];
  if (fs.existsSync(manifestPath)) {
    try {
      existingManifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
    } catch(e) {}
  }
  const mergedManifest = [...manifestAdditions, ...existingManifest];
  fs.writeFileSync(manifestPath, JSON.stringify(mergedManifest, null, 2), 'utf8');
  console.log(`Updated products_manifest.json with ${manifestAdditions.length} new image records.`);

  // --- UPDATE CATEGORY PRODUCT COUNTS ---
  const catCountMap = {};
  for (const prod of mergedProducts) {
    catCountMap[prod.category] = (catCountMap[prod.category] || 0) + 1;
  }

  // Update categories.ts
  const catTsPath = path.join(__dirname, '..', 'lib', 'data', 'categories.ts');
  const catCode = fs.readFileSync(catTsPath, 'utf8')
    .replace(/import\s+.*?;/g, '')
    .replace(/export\s+const\s+CATEGORIES:\s*Category\[\]\s*=\s*/, 'const CATEGORIES = ') + '; module.exports = CATEGORIES;';
  const categories = eval(catCode);

  for (const cat of categories) {
    if (catCountMap[cat.id]) {
      cat.featuredProductCount = catCountMap[cat.id];
    }
  }
  const updatedCatContent = `import { Category } from "@/types";\n\nexport const CATEGORIES: Category[] = ${JSON.stringify(categories, null, 2)};\n`;
  fs.writeFileSync(catTsPath, updatedCatContent, 'utf8');
  console.log(`Updated lib/data/categories.ts counts.`);

  // Update categories.json
  const catJsonPath = path.join(__dirname, '..', 'public', 'data', 'categories.json');
  if (fs.existsSync(catJsonPath)) {
    fs.writeFileSync(catJsonPath, JSON.stringify(categories, null, 2), 'utf8');
    console.log(`Updated public/data/categories.json counts.`);
  }

  console.log('Finished all product additions successfully.');
}

run().catch(err => {
  console.error('Fatal error during execution:', err);
  process.exit(1);
});
