-- ==============================================================================
-- RR FOUNDATIONS — SEED DATA SCRIPT (001_initial_catalogue_seed.sql)
-- Populates 10 Categories, 278 Verified Products, Initial Leads, and Settings
-- ==============================================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Insert Categories
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `featured_product_count`, `highlights`, `display_order`, `status`)
VALUES ('badges-lapel-pins', 'Badges & Lapel Pins', 'badges-lapel-pins', 'In-house manufactured stainless steel name badges, magnetic fastener badges, die-struck brass lapel pins, acrylic badges, and political campaign insignias.', '/assets/products/category-badge-showcase.jpg', 45, '["Pure copper & steel cores","Magnetic & safety clasp backings","UV micro-print & fiber laser etching","Pan-India institutional supply"]', 0, 'published')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `description` = VALUES(`description`), `image` = VALUES(`image`);
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `featured_product_count`, `highlights`, `display_order`, `status`)
VALUES ('designer-wall-clocks', 'Designer Wall Clocks', 'designer-wall-clocks', 'Luxury mechanical moving gear clocks, precision laser-cut MDF acrylic timepieces, and customized corporate dial clocks for executive gifting.', '/assets/products/wall-clock-001.jpeg', 60, '["Real moving gear mechanisms","Silent sweep quartz movement","Precision engineered MDF & acrylic","Customized corporate dials"]', 1, 'published')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `description` = VALUES(`description`), `image` = VALUES(`image`);
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `featured_product_count`, `highlights`, `display_order`, `status`)
VALUES ('executive-pens', 'Executive Pens & Writing', 'executive-pens', 'Premium metallic ballpoint pens, rollerball pens, laser-engraved stylus pens, and corporate gift boxed writing instruments.', '/assets/products/pen-001.png', 50, '["Solid metallic brass & aluminum barrels","High-precision fiber laser etching","German ultra-smooth ink refills","Corporate velvet & hard box packing"]', 2, 'published')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `description` = VALUES(`description`), `image` = VALUES(`image`);
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `featured_product_count`, `highlights`, `display_order`, `status`)
VALUES ('magnets-souvenirs', 'Custom Fridge Magnets & Souvenirs', 'magnets-souvenirs', 'Vibrant custom-shaped acrylic fridge magnets, embossed rubberized magnets, and commemorative corporate & tourism souvenir plaques.', '/assets/products/category-magnet-showcase.jpg', 42, '["High-strength isotropic magnetic backing","Glossy scratch-proof acrylic & rubber","Full-bleed photographic UV printing","Custom contour die-cut shapes"]', 3, 'published')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `description` = VALUES(`description`), `image` = VALUES(`image`);
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `featured_product_count`, `highlights`, `display_order`, `status`)
VALUES ('photo-frames-awards', 'Photo Frames & Awards', 'photo-frames-awards', 'Intricately detailed Balaji gold foil divine frames, crystal clear acrylic desktop photo frames, and institutional recognition mementos.', '/assets/products/frame-001.jpeg', 17, '["Gold foil embossed religious & civic artwork","Durable engineered frame borders","Shatterproof acrylic glass fronts","Custom engraved dedication plaques"]', 4, 'published')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `description` = VALUES(`description`), `image` = VALUES(`image`);
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `featured_product_count`, `highlights`, `display_order`, `status`)
VALUES ('examboards-stationery', 'Exam Boards & Desk Stationery', 'examboards-stationery', 'Heavy-duty transparent acrylic examination pads, printed wooden MDF clipboards, and institutional office desk accessories.', '/assets/products/examboard-001.jpeg', 21, '["High-impact shatter-resistant acrylic","Heavy-gauge steel spring clips","UV flatbed scratch-resistant prints","Educational & institutional bulk dispatch"]', 5, 'published')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `description` = VALUES(`description`), `image` = VALUES(`image`);
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `featured_product_count`, `highlights`, `display_order`, `status`)
VALUES ('lanyards-credentials', 'Lanyards & Identification', 'lanyards-credentials', 'Custom multi-color heat transfer satin lanyards, woven neck cords, transparent acrylic ID card holders, and turnkey event credentials.', '/assets/products/category-lanyard-showcase.jpg', 12, '["High-density satin & polyester ribbon","Safety quick-release breakaway buckles","Rotatable metal lobster clasps","Rigid acrylic & waterproof PVC pouches"]', 6, 'published')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `description` = VALUES(`description`), `image` = VALUES(`image`);
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `featured_product_count`, `highlights`, `display_order`, `status`)
VALUES ('keychains-acrylic-crafts', 'Keychains & Acrylic Crafts', 'keychains-acrylic-crafts', 'Custom die-struck metal keychains, laser-cut acrylic key tags, molded silicone accessories, and desktop paperweights.', '/assets/products/category-keychain-showcase.jpg', 16, '["Heavyweight zinc alloy & brass stamping","Crystal clear edge-polished acrylic","Heavy nickel split ring & chain","Bespoke company shapes and 3D reliefs"]', 7, 'published')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `description` = VALUES(`description`), `image` = VALUES(`image`);
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `featured_product_count`, `highlights`, `display_order`, `status`)
VALUES ('writing-pads', 'Writing Pads', 'writing-pads', 'Customized corporate and industrial promotional writing pads, clipboards, and branded examination pads manufactured with high-durability acrylic, MDF, and heavy-duty wire clips.', '/assets/products/writing-pad-ortex-auto.jpg', 5, '["Direct UV flatbed high-definition print","Reinforced acrylic & moisture-proof board","Chrome plated rustproof heavy spring clip","Tailored institutional & corporate branding"]', 8, 'published')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `description` = VALUES(`description`), `image` = VALUES(`image`);
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `featured_product_count`, `highlights`, `display_order`, `status`)
VALUES ('crystal-keychain', 'Crystal Keychain', 'crystal-keychain', 'High-transparency acrylic crystal keychains, dual-side brand window keyrings, colored accent border tags, and custom geometric promotional shapes.', '/assets/products/category-crystal-keychain-showcase.jpg', 10, '["Ultra-clear optical grade crystal acrylic","Double-sided high-resolution insert branding","Sturdy nickel-plated keyrings & swivel connectors","Multiple geometric profiles: Oval, Rectangle, Round & Teardrop"]', 9, 'published')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `description` = VALUES(`description`), `image` = VALUES(`image`);

-- 2. Insert Products (278 verified products)
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_01',
  'Traditional Divine & Corporate Photo Frame — Model FR-01',
  'traditional-divine-corporate-photo-frame-model-fr-01',
  'RRF-PHOTO-FRAMES-AWARDS_01',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-001.jpeg',
  '["/assets/products/frame-001.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  1,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '["traditional-divine-corporate-photo-frame-model-fr-02","traditional-divine-corporate-photo-frame-model-fr-03"]',
  'published',
  0,
  'Traditional Divine & Corporate Photo Frame — Model FR-01 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_04',
  'Traditional Divine & Corporate Photo Frame — Model FR-04',
  'traditional-divine-corporate-photo-frame-model-fr-04',
  'RRF-PHOTO-FRAMES-AWARDS_04',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-004.png',
  '["/assets/products/frame-004.png"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  1,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  1,
  'Traditional Divine & Corporate Photo Frame — Model FR-04 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_05',
  'Traditional Divine & Corporate Photo Frame — Model FR-05',
  'traditional-divine-corporate-photo-frame-model-fr-05',
  'RRF-PHOTO-FRAMES-AWARDS_05',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-005.jpeg',
  '["/assets/products/frame-005.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  2,
  'Traditional Divine & Corporate Photo Frame — Model FR-05 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_06',
  'Traditional Divine & Corporate Photo Frame — Model FR-06',
  'traditional-divine-corporate-photo-frame-model-fr-06',
  'RRF-PHOTO-FRAMES-AWARDS_06',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-006.jpeg',
  '["/assets/products/frame-006.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  3,
  'Traditional Divine & Corporate Photo Frame — Model FR-06 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_07',
  'Traditional Divine & Corporate Photo Frame — Model FR-07',
  'traditional-divine-corporate-photo-frame-model-fr-07',
  'RRF-PHOTO-FRAMES-AWARDS_07',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-007.jpeg',
  '["/assets/products/frame-007.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  4,
  'Traditional Divine & Corporate Photo Frame — Model FR-07 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_08',
  'Traditional Divine & Corporate Photo Frame — Model FR-08',
  'traditional-divine-corporate-photo-frame-model-fr-08',
  'RRF-PHOTO-FRAMES-AWARDS_08',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-008.jpeg',
  '["/assets/products/frame-008.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '["traditional-divine-corporate-photo-frame-model-fr-09"]',
  'published',
  5,
  'Traditional Divine & Corporate Photo Frame — Model FR-08 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_10',
  'Traditional Divine & Corporate Photo Frame — Model FR-10',
  'traditional-divine-corporate-photo-frame-model-fr-10',
  'RRF-PHOTO-FRAMES-AWARDS_10',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-010.jpeg',
  '["/assets/products/frame-010.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  6,
  'Traditional Divine & Corporate Photo Frame — Model FR-10 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_11',
  'Traditional Divine & Corporate Photo Frame — Model FR-11',
  'traditional-divine-corporate-photo-frame-model-fr-11',
  'RRF-PHOTO-FRAMES-AWARDS_11',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-011.jpeg',
  '["/assets/products/frame-011.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  7,
  'Traditional Divine & Corporate Photo Frame — Model FR-11 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_12',
  'Traditional Divine & Corporate Photo Frame — Model FR-12',
  'traditional-divine-corporate-photo-frame-model-fr-12',
  'RRF-PHOTO-FRAMES-AWARDS_12',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-012.jpeg',
  '["/assets/products/frame-012.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  8,
  'Traditional Divine & Corporate Photo Frame — Model FR-12 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_13',
  'Traditional Divine & Corporate Photo Frame — Model FR-13',
  'traditional-divine-corporate-photo-frame-model-fr-13',
  'RRF-PHOTO-FRAMES-AWARDS_13',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-013.jpeg',
  '["/assets/products/frame-013.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  9,
  'Traditional Divine & Corporate Photo Frame — Model FR-13 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_14',
  'Traditional Divine & Corporate Photo Frame — Model FR-14',
  'traditional-divine-corporate-photo-frame-model-fr-14',
  'RRF-PHOTO-FRAMES-AWARDS_14',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-014.jpeg',
  '["/assets/products/frame-014.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  10,
  'Traditional Divine & Corporate Photo Frame — Model FR-14 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_15',
  'Traditional Divine & Corporate Photo Frame — Model FR-15',
  'traditional-divine-corporate-photo-frame-model-fr-15',
  'RRF-PHOTO-FRAMES-AWARDS_15',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-015.jpeg',
  '["/assets/products/frame-015.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  11,
  'Traditional Divine & Corporate Photo Frame — Model FR-15 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_16',
  'Traditional Divine & Corporate Photo Frame — Model FR-16',
  'traditional-divine-corporate-photo-frame-model-fr-16',
  'RRF-PHOTO-FRAMES-AWARDS_16',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-016.jpeg',
  '["/assets/products/frame-016.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  12,
  'Traditional Divine & Corporate Photo Frame — Model FR-16 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_17',
  'Traditional Divine & Corporate Photo Frame — Model FR-17',
  'traditional-divine-corporate-photo-frame-model-fr-17',
  'RRF-PHOTO-FRAMES-AWARDS_17',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-017.jpeg',
  '["/assets/products/frame-017.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  13,
  'Traditional Divine & Corporate Photo Frame — Model FR-17 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_18',
  'Traditional Divine & Corporate Photo Frame — Model FR-18',
  'traditional-divine-corporate-photo-frame-model-fr-18',
  'RRF-PHOTO-FRAMES-AWARDS_18',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-018.jpeg',
  '["/assets/products/frame-018.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  14,
  'Traditional Divine & Corporate Photo Frame — Model FR-18 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_19',
  'Traditional Divine & Corporate Photo Frame — Model FR-19',
  'traditional-divine-corporate-photo-frame-model-fr-19',
  'RRF-PHOTO-FRAMES-AWARDS_19',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-019.jpeg',
  '["/assets/products/frame-019.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  15,
  'Traditional Divine & Corporate Photo Frame — Model FR-19 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_photo-frames-awards_20',
  'Traditional Divine & Corporate Photo Frame — Model FR-20',
  'traditional-divine-corporate-photo-frame-model-fr-20',
  'RRF-PHOTO-FRAMES-AWARDS_20',
  'photo-frames-awards',
  'Photo Frames & Awards',
  'Intricately detailed gold foil embossed frame and commemorative award memento.',
  'Featuring genuine gold foil stamping and high-relief devotional or institutional artwork. Mounted in reinforced mold-pressed frames with crystal clear acrylic shields to protect against dust and atmospheric aging.',
  '/assets/products/frame-020.jpeg',
  '["/assets/products/frame-020.jpeg"]',
  '["Embossed Metallic Gold Foil","Engineered Polished Molding","Shatterproof Acrylic Shield"]',
  '{"Sizes":"6x8 Inch / 8x10 Inch / 10x12 Inch / Custom","Mounting":"Desktop Easel Stand + Dual Wall Hooks","Finish":"Antique Teak / Polished Gold / Deep Mahogany","Customization":"Laser Inscribed Brass Dedication Plaque"}',
  0,
  20,
  '["Photo Frame","Balaji Frame","Divine Art","Corporate Award","Memento"]',
  '[]',
  'published',
  16,
  'Traditional Divine & Corporate Photo Frame — Model FR-20 | Direct Manufacturer RR Foundations',
  'Intricately detailed gold foil embossed frame and commemorative award memento. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_01',
  'Custom Precision Badge Pin — Model BD-01',
  'custom-precision-badge-pin-model-bd-01',
  'RRF-BADGES-LAPEL-PINS_01',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/category-badge-showcase.jpg',
  '["/assets/products/category-badge-showcase.jpg","/assets/products/badge-001.png"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  1,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '["custom-precision-badge-pin-model-bd-02"]',
  'published',
  17,
  'Custom Precision Badge Pin — Model BD-01 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_03',
  'Custom Precision Badge Pin — Model BD-03',
  'custom-precision-badge-pin-model-bd-03',
  'RRF-BADGES-LAPEL-PINS_03',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-003.jpeg',
  '["/assets/products/badge-003.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  1,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  18,
  'Custom Precision Badge Pin — Model BD-03 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_04',
  'Custom Precision Badge Pin — Model BD-04',
  'custom-precision-badge-pin-model-bd-04',
  'RRF-BADGES-LAPEL-PINS_04',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-004.jpeg',
  '["/assets/products/badge-004.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  19,
  'Custom Precision Badge Pin — Model BD-04 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_05',
  'Custom Precision Badge Pin — Model BD-05',
  'custom-precision-badge-pin-model-bd-05',
  'RRF-BADGES-LAPEL-PINS_05',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-005.jpeg',
  '["/assets/products/badge-005.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  20,
  'Custom Precision Badge Pin — Model BD-05 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_06',
  'Custom Precision Badge Pin — Model BD-06',
  'custom-precision-badge-pin-model-bd-06',
  'RRF-BADGES-LAPEL-PINS_06',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-006.png',
  '["/assets/products/badge-006.png"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  21,
  'Custom Precision Badge Pin — Model BD-06 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_07',
  'Custom Precision Badge Pin — Model BD-07',
  'custom-precision-badge-pin-model-bd-07',
  'RRF-BADGES-LAPEL-PINS_07',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-007.png',
  '["/assets/products/badge-007.png"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  22,
  'Custom Precision Badge Pin — Model BD-07 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_08',
  'Custom Precision Badge Pin — Model BD-08',
  'custom-precision-badge-pin-model-bd-08',
  'RRF-BADGES-LAPEL-PINS_08',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-008.png',
  '["/assets/products/badge-008.png"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  23,
  'Custom Precision Badge Pin — Model BD-08 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_09',
  'Custom Precision Badge Pin — Model BD-09',
  'custom-precision-badge-pin-model-bd-09',
  'RRF-BADGES-LAPEL-PINS_09',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-009.png',
  '["/assets/products/badge-009.png"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  24,
  'Custom Precision Badge Pin — Model BD-09 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_10',
  'Custom Precision Badge Pin — Model BD-10',
  'custom-precision-badge-pin-model-bd-10',
  'RRF-BADGES-LAPEL-PINS_10',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-010.png',
  '["/assets/products/badge-010.png"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  25,
  'Custom Precision Badge Pin — Model BD-10 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_11',
  'Custom Precision Badge Pin — Model BD-11',
  'custom-precision-badge-pin-model-bd-11',
  'RRF-BADGES-LAPEL-PINS_11',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-011.jpeg',
  '["/assets/products/badge-011.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  26,
  'Custom Precision Badge Pin — Model BD-11 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_12',
  'Custom Precision Badge Pin — Model BD-12',
  'custom-precision-badge-pin-model-bd-12',
  'RRF-BADGES-LAPEL-PINS_12',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-012.jpg',
  '["/assets/products/badge-012.jpg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  27,
  'Custom Precision Badge Pin — Model BD-12 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_13',
  'Custom Precision Badge Pin — Model BD-13',
  'custom-precision-badge-pin-model-bd-13',
  'RRF-BADGES-LAPEL-PINS_13',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-013.jpg',
  '["/assets/products/badge-013.jpg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  28,
  'Custom Precision Badge Pin — Model BD-13 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_14',
  'Custom Precision Badge Pin — Model BD-14',
  'custom-precision-badge-pin-model-bd-14',
  'RRF-BADGES-LAPEL-PINS_14',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-014.jpg',
  '["/assets/products/badge-014.jpg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  29,
  'Custom Precision Badge Pin — Model BD-14 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_15',
  'Custom Precision Badge Pin — Model BD-15',
  'custom-precision-badge-pin-model-bd-15',
  'RRF-BADGES-LAPEL-PINS_15',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-015.jpg',
  '["/assets/products/badge-015.jpg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  30,
  'Custom Precision Badge Pin — Model BD-15 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_16',
  'Custom Precision Badge Pin — Model BD-16',
  'custom-precision-badge-pin-model-bd-16',
  'RRF-BADGES-LAPEL-PINS_16',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-016.jpg',
  '["/assets/products/badge-016.jpg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  31,
  'Custom Precision Badge Pin — Model BD-16 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_17',
  'Custom Precision Badge Pin — Model BD-17',
  'custom-precision-badge-pin-model-bd-17',
  'RRF-BADGES-LAPEL-PINS_17',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-017.jpg',
  '["/assets/products/badge-017.jpg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  32,
  'Custom Precision Badge Pin — Model BD-17 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_18',
  'Custom Precision Badge Pin — Model BD-18',
  'custom-precision-badge-pin-model-bd-18',
  'RRF-BADGES-LAPEL-PINS_18',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-018.jpg',
  '["/assets/products/badge-018.jpg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  33,
  'Custom Precision Badge Pin — Model BD-18 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_19',
  'Custom Precision Badge Pin — Model BD-19',
  'custom-precision-badge-pin-model-bd-19',
  'RRF-BADGES-LAPEL-PINS_19',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-019.jpeg',
  '["/assets/products/badge-019.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  34,
  'Custom Precision Badge Pin — Model BD-19 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_20',
  'Custom Precision Badge Pin — Model BD-20',
  'custom-precision-badge-pin-model-bd-20',
  'RRF-BADGES-LAPEL-PINS_20',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-020.jpeg',
  '["/assets/products/badge-020.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  35,
  'Custom Precision Badge Pin — Model BD-20 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_21',
  'Custom Precision Badge Pin — Model BD-21',
  'custom-precision-badge-pin-model-bd-21',
  'RRF-BADGES-LAPEL-PINS_21',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-021.jpeg',
  '["/assets/products/badge-021.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  36,
  'Custom Precision Badge Pin — Model BD-21 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_22',
  'Custom Precision Badge Pin — Model BD-22',
  'custom-precision-badge-pin-model-bd-22',
  'RRF-BADGES-LAPEL-PINS_22',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-022.jpeg',
  '["/assets/products/badge-022.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  37,
  'Custom Precision Badge Pin — Model BD-22 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_23',
  'Custom Precision Badge Pin — Model BD-23',
  'custom-precision-badge-pin-model-bd-23',
  'RRF-BADGES-LAPEL-PINS_23',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-023.jpeg',
  '["/assets/products/badge-023.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  38,
  'Custom Precision Badge Pin — Model BD-23 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_24',
  'Custom Precision Badge Pin — Model BD-24',
  'custom-precision-badge-pin-model-bd-24',
  'RRF-BADGES-LAPEL-PINS_24',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-024.jpeg',
  '["/assets/products/badge-024.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  39,
  'Custom Precision Badge Pin — Model BD-24 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_25',
  'Custom Precision Badge Pin — Model BD-25',
  'custom-precision-badge-pin-model-bd-25',
  'RRF-BADGES-LAPEL-PINS_25',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-025.jpeg',
  '["/assets/products/badge-025.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  40,
  'Custom Precision Badge Pin — Model BD-25 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_26',
  'Custom Precision Badge Pin — Model BD-26',
  'custom-precision-badge-pin-model-bd-26',
  'RRF-BADGES-LAPEL-PINS_26',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-026.jpeg',
  '["/assets/products/badge-026.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  41,
  'Custom Precision Badge Pin — Model BD-26 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_27',
  'Custom Precision Badge Pin — Model BD-27',
  'custom-precision-badge-pin-model-bd-27',
  'RRF-BADGES-LAPEL-PINS_27',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-027.jpeg',
  '["/assets/products/badge-027.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  42,
  'Custom Precision Badge Pin — Model BD-27 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_28',
  'Custom Precision Badge Pin — Model BD-28',
  'custom-precision-badge-pin-model-bd-28',
  'RRF-BADGES-LAPEL-PINS_28',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-028.jpeg',
  '["/assets/products/badge-028.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  43,
  'Custom Precision Badge Pin — Model BD-28 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_29',
  'Custom Precision Badge Pin — Model BD-29',
  'custom-precision-badge-pin-model-bd-29',
  'RRF-BADGES-LAPEL-PINS_29',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-029.jpeg',
  '["/assets/products/badge-029.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  44,
  'Custom Precision Badge Pin — Model BD-29 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_30',
  'Custom Precision Badge Pin — Model BD-30',
  'custom-precision-badge-pin-model-bd-30',
  'RRF-BADGES-LAPEL-PINS_30',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-030.jpeg',
  '["/assets/products/badge-030.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  45,
  'Custom Precision Badge Pin — Model BD-30 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_31',
  'Custom Precision Badge Pin — Model BD-31',
  'custom-precision-badge-pin-model-bd-31',
  'RRF-BADGES-LAPEL-PINS_31',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-031.jpeg',
  '["/assets/products/badge-031.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  46,
  'Custom Precision Badge Pin — Model BD-31 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_32',
  'Custom Precision Badge Pin — Model BD-32',
  'custom-precision-badge-pin-model-bd-32',
  'RRF-BADGES-LAPEL-PINS_32',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-032.jpeg',
  '["/assets/products/badge-032.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  47,
  'Custom Precision Badge Pin — Model BD-32 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_33',
  'Custom Precision Badge Pin — Model BD-33',
  'custom-precision-badge-pin-model-bd-33',
  'RRF-BADGES-LAPEL-PINS_33',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-033.jpeg',
  '["/assets/products/badge-033.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  48,
  'Custom Precision Badge Pin — Model BD-33 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_34',
  'Custom Precision Badge Pin — Model BD-34',
  'custom-precision-badge-pin-model-bd-34',
  'RRF-BADGES-LAPEL-PINS_34',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-034.jpeg',
  '["/assets/products/badge-034.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  49,
  'Custom Precision Badge Pin — Model BD-34 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_35',
  'Custom Precision Badge Pin — Model BD-35',
  'custom-precision-badge-pin-model-bd-35',
  'RRF-BADGES-LAPEL-PINS_35',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-035.jpeg',
  '["/assets/products/badge-035.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  50,
  'Custom Precision Badge Pin — Model BD-35 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_36',
  'Custom Precision Badge Pin — Model BD-36',
  'custom-precision-badge-pin-model-bd-36',
  'RRF-BADGES-LAPEL-PINS_36',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-036.jpeg',
  '["/assets/products/badge-036.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  51,
  'Custom Precision Badge Pin — Model BD-36 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_37',
  'Custom Precision Badge Pin — Model BD-37',
  'custom-precision-badge-pin-model-bd-37',
  'RRF-BADGES-LAPEL-PINS_37',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-037.jpeg',
  '["/assets/products/badge-037.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  52,
  'Custom Precision Badge Pin — Model BD-37 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_38',
  'Custom Precision Badge Pin — Model BD-38',
  'custom-precision-badge-pin-model-bd-38',
  'RRF-BADGES-LAPEL-PINS_38',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-038.jpeg',
  '["/assets/products/badge-038.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  53,
  'Custom Precision Badge Pin — Model BD-38 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_39',
  'Custom Precision Badge Pin — Model BD-39',
  'custom-precision-badge-pin-model-bd-39',
  'RRF-BADGES-LAPEL-PINS_39',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-039.jpeg',
  '["/assets/products/badge-039.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  54,
  'Custom Precision Badge Pin — Model BD-39 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_40',
  'Custom Precision Badge Pin — Model BD-40',
  'custom-precision-badge-pin-model-bd-40',
  'RRF-BADGES-LAPEL-PINS_40',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-040.jpeg',
  '["/assets/products/badge-040.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  55,
  'Custom Precision Badge Pin — Model BD-40 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_41',
  'Custom Precision Badge Pin — Model BD-41',
  'custom-precision-badge-pin-model-bd-41',
  'RRF-BADGES-LAPEL-PINS_41',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-041.jpeg',
  '["/assets/products/badge-041.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  56,
  'Custom Precision Badge Pin — Model BD-41 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_42',
  'Custom Precision Badge Pin — Model BD-42',
  'custom-precision-badge-pin-model-bd-42',
  'RRF-BADGES-LAPEL-PINS_42',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-042.jpeg',
  '["/assets/products/badge-042.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  57,
  'Custom Precision Badge Pin — Model BD-42 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_43',
  'Custom Precision Badge Pin — Model BD-43',
  'custom-precision-badge-pin-model-bd-43',
  'RRF-BADGES-LAPEL-PINS_43',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-043.jpeg',
  '["/assets/products/badge-043.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  58,
  'Custom Precision Badge Pin — Model BD-43 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_44',
  'Custom Precision Badge Pin — Model BD-44',
  'custom-precision-badge-pin-model-bd-44',
  'RRF-BADGES-LAPEL-PINS_44',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-044.jpeg',
  '["/assets/products/badge-044.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  59,
  'Custom Precision Badge Pin — Model BD-44 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_45',
  'Custom Precision Badge Pin — Model BD-45',
  'custom-precision-badge-pin-model-bd-45',
  'RRF-BADGES-LAPEL-PINS_45',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-045.jpeg',
  '["/assets/products/badge-045.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  60,
  'Custom Precision Badge Pin — Model BD-45 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_badges-lapel-pins_46',
  'Custom Precision Badge Pin — Model BD-46',
  'custom-precision-badge-pin-model-bd-46',
  'RRF-BADGES-LAPEL-PINS_46',
  'badges-lapel-pins',
  'Badges & Lapel Pins',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding.',
  'Engineered at our Om Vihar facility, this badge model delivers crisp visual reproduction via direct UV flatbed printing or fiber laser etching. Available with high-flux neodymium magnetic fasteners to preserve apparel or heavy-duty safety pin clasps.',
  '/assets/products/badge-046.jpeg',
  '["/assets/products/badge-046.jpeg"]',
  '["Stainless Steel 304 / Brass Core","Neodymium Magnetic Bar","Scratch-Resistant Topcoat"]',
  '{"Fastening":"Triple Magnet Bar / Safety Locking Pin","Branding":"UV Micro-Print / Precision Fiber Laser","Finish Options":"Mirror Gold / Brushed Steel / Matte Black","Lead Time":"3-7 Days for Production Batches"}',
  0,
  50,
  '["Badge","Lapel Pin","Corporate ID","Metal","Magnetic"]',
  '[]',
  'published',
  61,
  'Custom Precision Badge Pin — Model BD-46 | Direct Manufacturer RR Foundations',
  'Direct factory manufactured metal and acrylic lapel badge with secure backing options for corporate and institutional branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_01',
  'Heavy-Duty Examination Writing Pad — Model EB-01',
  'heavy-duty-examination-writing-pad-model-eb-01',
  'RRF-EXAMBOARDS-STATIONERY_01',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-001.jpeg',
  '["/assets/products/examboard-001.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  1,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  62,
  'Heavy-Duty Examination Writing Pad — Model EB-01 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_02',
  'Heavy-Duty Examination Writing Pad — Model EB-02',
  'heavy-duty-examination-writing-pad-model-eb-02',
  'RRF-EXAMBOARDS-STATIONERY_02',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-002.jpeg',
  '["/assets/products/examboard-002.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  1,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  63,
  'Heavy-Duty Examination Writing Pad — Model EB-02 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_03',
  'Heavy-Duty Examination Writing Pad — Model EB-03',
  'heavy-duty-examination-writing-pad-model-eb-03',
  'RRF-EXAMBOARDS-STATIONERY_03',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-003.png',
  '["/assets/products/examboard-003.png"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  64,
  'Heavy-Duty Examination Writing Pad — Model EB-03 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_04',
  'Heavy-Duty Examination Writing Pad — Model EB-04',
  'heavy-duty-examination-writing-pad-model-eb-04',
  'RRF-EXAMBOARDS-STATIONERY_04',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-004.png',
  '["/assets/products/examboard-004.png"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  65,
  'Heavy-Duty Examination Writing Pad — Model EB-04 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_05',
  'Heavy-Duty Examination Writing Pad — Model EB-05',
  'heavy-duty-examination-writing-pad-model-eb-05',
  'RRF-EXAMBOARDS-STATIONERY_05',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-005.png',
  '["/assets/products/examboard-005.png"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  66,
  'Heavy-Duty Examination Writing Pad — Model EB-05 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_06',
  'Heavy-Duty Examination Writing Pad — Model EB-06',
  'heavy-duty-examination-writing-pad-model-eb-06',
  'RRF-EXAMBOARDS-STATIONERY_06',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-006.png',
  '["/assets/products/examboard-006.png"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  67,
  'Heavy-Duty Examination Writing Pad — Model EB-06 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_07',
  'Heavy-Duty Examination Writing Pad — Model EB-07',
  'heavy-duty-examination-writing-pad-model-eb-07',
  'RRF-EXAMBOARDS-STATIONERY_07',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-007.png',
  '["/assets/products/examboard-007.png"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  68,
  'Heavy-Duty Examination Writing Pad — Model EB-07 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_08',
  'Heavy-Duty Examination Writing Pad — Model EB-08',
  'heavy-duty-examination-writing-pad-model-eb-08',
  'RRF-EXAMBOARDS-STATIONERY_08',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-008.jpeg',
  '["/assets/products/examboard-008.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  69,
  'Heavy-Duty Examination Writing Pad — Model EB-08 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_09',
  'Heavy-Duty Examination Writing Pad — Model EB-09',
  'heavy-duty-examination-writing-pad-model-eb-09',
  'RRF-EXAMBOARDS-STATIONERY_09',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-009.png',
  '["/assets/products/examboard-009.png"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  70,
  'Heavy-Duty Examination Writing Pad — Model EB-09 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_10',
  'Heavy-Duty Examination Writing Pad — Model EB-10',
  'heavy-duty-examination-writing-pad-model-eb-10',
  'RRF-EXAMBOARDS-STATIONERY_10',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-010.jpeg',
  '["/assets/products/examboard-010.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  71,
  'Heavy-Duty Examination Writing Pad — Model EB-10 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_11',
  'Heavy-Duty Examination Writing Pad — Model EB-11',
  'heavy-duty-examination-writing-pad-model-eb-11',
  'RRF-EXAMBOARDS-STATIONERY_11',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-011.jpeg',
  '["/assets/products/examboard-011.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  72,
  'Heavy-Duty Examination Writing Pad — Model EB-11 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_12',
  'Heavy-Duty Examination Writing Pad — Model EB-12',
  'heavy-duty-examination-writing-pad-model-eb-12',
  'RRF-EXAMBOARDS-STATIONERY_12',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-012.jpeg',
  '["/assets/products/examboard-012.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  73,
  'Heavy-Duty Examination Writing Pad — Model EB-12 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_13',
  'Heavy-Duty Examination Writing Pad — Model EB-13',
  'heavy-duty-examination-writing-pad-model-eb-13',
  'RRF-EXAMBOARDS-STATIONERY_13',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-013.jpeg',
  '["/assets/products/examboard-013.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  74,
  'Heavy-Duty Examination Writing Pad — Model EB-13 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_14',
  'Heavy-Duty Examination Writing Pad — Model EB-14',
  'heavy-duty-examination-writing-pad-model-eb-14',
  'RRF-EXAMBOARDS-STATIONERY_14',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-014.jpeg',
  '["/assets/products/examboard-014.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  75,
  'Heavy-Duty Examination Writing Pad — Model EB-14 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_15',
  'Heavy-Duty Examination Writing Pad — Model EB-15',
  'heavy-duty-examination-writing-pad-model-eb-15',
  'RRF-EXAMBOARDS-STATIONERY_15',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-015.jpeg',
  '["/assets/products/examboard-015.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  76,
  'Heavy-Duty Examination Writing Pad — Model EB-15 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_16',
  'Heavy-Duty Examination Writing Pad — Model EB-16',
  'heavy-duty-examination-writing-pad-model-eb-16',
  'RRF-EXAMBOARDS-STATIONERY_16',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-016.jpeg',
  '["/assets/products/examboard-016.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  77,
  'Heavy-Duty Examination Writing Pad — Model EB-16 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_17',
  'Heavy-Duty Examination Writing Pad — Model EB-17',
  'heavy-duty-examination-writing-pad-model-eb-17',
  'RRF-EXAMBOARDS-STATIONERY_17',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-017.jpeg',
  '["/assets/products/examboard-017.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  78,
  'Heavy-Duty Examination Writing Pad — Model EB-17 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_18',
  'Heavy-Duty Examination Writing Pad — Model EB-18',
  'heavy-duty-examination-writing-pad-model-eb-18',
  'RRF-EXAMBOARDS-STATIONERY_18',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-018.jpeg',
  '["/assets/products/examboard-018.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  79,
  'Heavy-Duty Examination Writing Pad — Model EB-18 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_19',
  'Heavy-Duty Examination Writing Pad — Model EB-19',
  'heavy-duty-examination-writing-pad-model-eb-19',
  'RRF-EXAMBOARDS-STATIONERY_19',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-019.jpeg',
  '["/assets/products/examboard-019.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  80,
  'Heavy-Duty Examination Writing Pad — Model EB-19 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_20',
  'Heavy-Duty Examination Writing Pad — Model EB-20',
  'heavy-duty-examination-writing-pad-model-eb-20',
  'RRF-EXAMBOARDS-STATIONERY_20',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-020.jpeg',
  '["/assets/products/examboard-020.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  81,
  'Heavy-Duty Examination Writing Pad — Model EB-20 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_examboards-stationery_21',
  'Heavy-Duty Examination Writing Pad — Model EB-21',
  'heavy-duty-examination-writing-pad-model-eb-21',
  'RRF-EXAMBOARDS-STATIONERY_21',
  'examboards-stationery',
  'Exam Boards & Desk Stationery',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp.',
  'Manufactured for schools, universities, and competitive testing centers. Engineered from virgin acrylic or moisture-resistant MDF with bevelled rounded safety corners and high-tension rust-proof chrome wire clips.',
  '/assets/products/examboard-021.jpeg',
  '["/assets/products/examboard-021.jpeg"]',
  '["High-Impact Virgin Acrylic / Waterproof MDF","Chrome Plated Spring Clip","Corner Rubber Grips"]',
  '{"Thickness":"3.0mm - 4.5mm Rigid Substrate","Safety":"Smooth Radius Chamfered Corners","Print":"Back-Surface Scratchproof Printing"}',
  0,
  50,
  '["Exam Board","Clipboard","School Stationery","Acrylic Pad","MDF Board"]',
  '[]',
  'published',
  82,
  'Heavy-Duty Examination Writing Pad — Model EB-21 | Direct Manufacturer RR Foundations',
  'Shatter-resistant transparent acrylic or printed wooden MDF exam clipboard with heavy steel clamp. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_01',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-01',
  'custom-die-struck-metal-acrylic-keychain-model-kc-01',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_01',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/category-keychain-showcase.jpg',
  '["/assets/products/category-keychain-showcase.jpg","/assets/products/craft-001.png"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  1,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  83,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-01 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_02',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-02',
  'custom-die-struck-metal-acrylic-keychain-model-kc-02',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_02',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-002.png',
  '["/assets/products/craft-002.png"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  1,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  84,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-02 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_03',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-03',
  'custom-die-struck-metal-acrylic-keychain-model-kc-03',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_03',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-003.jpeg',
  '["/assets/products/craft-003.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  85,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-03 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_04',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-04',
  'custom-die-struck-metal-acrylic-keychain-model-kc-04',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_04',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-004.jpeg',
  '["/assets/products/craft-004.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  86,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-04 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_05',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-05',
  'custom-die-struck-metal-acrylic-keychain-model-kc-05',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_05',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-005.jpeg',
  '["/assets/products/craft-005.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  87,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-05 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_06',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-06',
  'custom-die-struck-metal-acrylic-keychain-model-kc-06',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_06',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-006.jpeg',
  '["/assets/products/craft-006.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  88,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-06 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_07',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-07',
  'custom-die-struck-metal-acrylic-keychain-model-kc-07',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_07',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-007.jpeg',
  '["/assets/products/craft-007.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  89,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-07 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_08',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-08',
  'custom-die-struck-metal-acrylic-keychain-model-kc-08',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_08',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-008.jpeg',
  '["/assets/products/craft-008.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  90,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-08 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_09',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-09',
  'custom-die-struck-metal-acrylic-keychain-model-kc-09',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_09',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-009.jpeg',
  '["/assets/products/craft-009.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  91,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-09 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_10',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-10',
  'custom-die-struck-metal-acrylic-keychain-model-kc-10',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_10',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-010.jpeg',
  '["/assets/products/craft-010.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  92,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-10 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_11',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-11',
  'custom-die-struck-metal-acrylic-keychain-model-kc-11',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_11',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-011.jpeg',
  '["/assets/products/craft-011.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  93,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-11 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_12',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-12',
  'custom-die-struck-metal-acrylic-keychain-model-kc-12',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_12',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-012.jpeg',
  '["/assets/products/craft-012.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  94,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-12 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_13',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-13',
  'custom-die-struck-metal-acrylic-keychain-model-kc-13',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_13',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-013.jpeg',
  '["/assets/products/craft-013.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  95,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-13 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_14',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-14',
  'custom-die-struck-metal-acrylic-keychain-model-kc-14',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_14',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-014.jpeg',
  '["/assets/products/craft-014.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  96,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-14 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_15',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-15',
  'custom-die-struck-metal-acrylic-keychain-model-kc-15',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_15',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-015.jpeg',
  '["/assets/products/craft-015.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '["custom-die-struck-metal-acrylic-keychain-model-kc-17"]',
  'published',
  97,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-15 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_keychains-acrylic-crafts_16',
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-16',
  'custom-die-struck-metal-acrylic-keychain-model-kc-16',
  'RRF-KEYCHAINS-ACRYLIC-CRAFTS_16',
  'keychains-acrylic-crafts',
  'Keychains & Acrylic Crafts',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring.',
  'Designed for automotive dealerships, real estate brands, and corporate launches. Stamped in heavyweight zinc alloy or laser-cut from high-impact tinted acrylic with double-sided branding.',
  '/assets/products/craft-016.jpeg',
  '["/assets/products/craft-016.jpeg"]',
  '["Zinc Alloy / Cast Acrylic / Silicone","Tempered Nickel Split Ring","Color Enamel Fill"]',
  '{"Thickness":"3mm - 4mm Heavy Solid Feel","Hardware":"Flat Ring + 4-Link Heavy Gauge Chain","Plating":"Polished Nickel / Antique Brass / Black Nickel","Packaging":"Individual Clear Blister or Presentation Box"}',
  0,
  100,
  '["Keychain","Metal Keychain","Acrylic Key Tag","Automotive","Promotional"]',
  '[]',
  'published',
  98,
  'Custom Die-Struck Metal & Acrylic Keychain — Model KC-16 | Direct Manufacturer RR Foundations',
  'Solid metal or laser-cut acrylic promotional keychain with reinforced split ring. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_01',
  'Executive Metallic Ballpoint Pen — Model PN-01',
  'executive-metallic-ballpoint-pen-model-pn-01',
  'RRF-EXECUTIVE-PENS_01',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-001.png',
  '["/assets/products/pen-001.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  1,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  99,
  'Executive Metallic Ballpoint Pen — Model PN-01 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_02',
  'Executive Metallic Ballpoint Pen — Model PN-02',
  'executive-metallic-ballpoint-pen-model-pn-02',
  'RRF-EXECUTIVE-PENS_02',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-002.png',
  '["/assets/products/pen-002.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  1,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  100,
  'Executive Metallic Ballpoint Pen — Model PN-02 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_03',
  'Executive Metallic Ballpoint Pen — Model PN-03',
  'executive-metallic-ballpoint-pen-model-pn-03',
  'RRF-EXECUTIVE-PENS_03',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-003.png',
  '["/assets/products/pen-003.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  101,
  'Executive Metallic Ballpoint Pen — Model PN-03 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_04',
  'Executive Metallic Ballpoint Pen — Model PN-04',
  'executive-metallic-ballpoint-pen-model-pn-04',
  'RRF-EXECUTIVE-PENS_04',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-004.png',
  '["/assets/products/pen-004.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  102,
  'Executive Metallic Ballpoint Pen — Model PN-04 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_05',
  'Executive Metallic Ballpoint Pen — Model PN-05',
  'executive-metallic-ballpoint-pen-model-pn-05',
  'RRF-EXECUTIVE-PENS_05',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-005.png',
  '["/assets/products/pen-005.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  103,
  'Executive Metallic Ballpoint Pen — Model PN-05 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_06',
  'Executive Metallic Ballpoint Pen — Model PN-06',
  'executive-metallic-ballpoint-pen-model-pn-06',
  'RRF-EXECUTIVE-PENS_06',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-006.png',
  '["/assets/products/pen-006.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  104,
  'Executive Metallic Ballpoint Pen — Model PN-06 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_07',
  'Executive Metallic Ballpoint Pen — Model PN-07',
  'executive-metallic-ballpoint-pen-model-pn-07',
  'RRF-EXECUTIVE-PENS_07',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-007.png',
  '["/assets/products/pen-007.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  105,
  'Executive Metallic Ballpoint Pen — Model PN-07 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_08',
  'Executive Metallic Ballpoint Pen — Model PN-08',
  'executive-metallic-ballpoint-pen-model-pn-08',
  'RRF-EXECUTIVE-PENS_08',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-008.png',
  '["/assets/products/pen-008.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  106,
  'Executive Metallic Ballpoint Pen — Model PN-08 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_09',
  'Executive Metallic Ballpoint Pen — Model PN-09',
  'executive-metallic-ballpoint-pen-model-pn-09',
  'RRF-EXECUTIVE-PENS_09',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-009.png',
  '["/assets/products/pen-009.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  107,
  'Executive Metallic Ballpoint Pen — Model PN-09 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_10',
  'Executive Metallic Ballpoint Pen — Model PN-10',
  'executive-metallic-ballpoint-pen-model-pn-10',
  'RRF-EXECUTIVE-PENS_10',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-010.png',
  '["/assets/products/pen-010.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  108,
  'Executive Metallic Ballpoint Pen — Model PN-10 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_11',
  'Executive Metallic Ballpoint Pen — Model PN-11',
  'executive-metallic-ballpoint-pen-model-pn-11',
  'RRF-EXECUTIVE-PENS_11',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-011.png',
  '["/assets/products/pen-011.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  109,
  'Executive Metallic Ballpoint Pen — Model PN-11 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_12',
  'Executive Metallic Ballpoint Pen — Model PN-12',
  'executive-metallic-ballpoint-pen-model-pn-12',
  'RRF-EXECUTIVE-PENS_12',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-012.png',
  '["/assets/products/pen-012.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  110,
  'Executive Metallic Ballpoint Pen — Model PN-12 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_13',
  'Executive Metallic Ballpoint Pen — Model PN-13',
  'executive-metallic-ballpoint-pen-model-pn-13',
  'RRF-EXECUTIVE-PENS_13',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-013.png',
  '["/assets/products/pen-013.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  111,
  'Executive Metallic Ballpoint Pen — Model PN-13 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_14',
  'Executive Metallic Ballpoint Pen — Model PN-14',
  'executive-metallic-ballpoint-pen-model-pn-14',
  'RRF-EXECUTIVE-PENS_14',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-014.png',
  '["/assets/products/pen-014.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  112,
  'Executive Metallic Ballpoint Pen — Model PN-14 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_15',
  'Executive Metallic Ballpoint Pen — Model PN-15',
  'executive-metallic-ballpoint-pen-model-pn-15',
  'RRF-EXECUTIVE-PENS_15',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-015.png',
  '["/assets/products/pen-015.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  113,
  'Executive Metallic Ballpoint Pen — Model PN-15 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_16',
  'Executive Metallic Ballpoint Pen — Model PN-16',
  'executive-metallic-ballpoint-pen-model-pn-16',
  'RRF-EXECUTIVE-PENS_16',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-016.png',
  '["/assets/products/pen-016.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  114,
  'Executive Metallic Ballpoint Pen — Model PN-16 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_17',
  'Executive Metallic Ballpoint Pen — Model PN-17',
  'executive-metallic-ballpoint-pen-model-pn-17',
  'RRF-EXECUTIVE-PENS_17',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-017.png',
  '["/assets/products/pen-017.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  115,
  'Executive Metallic Ballpoint Pen — Model PN-17 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_18',
  'Executive Metallic Ballpoint Pen — Model PN-18',
  'executive-metallic-ballpoint-pen-model-pn-18',
  'RRF-EXECUTIVE-PENS_18',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-018.png',
  '["/assets/products/pen-018.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  116,
  'Executive Metallic Ballpoint Pen — Model PN-18 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_19',
  'Executive Metallic Ballpoint Pen — Model PN-19',
  'executive-metallic-ballpoint-pen-model-pn-19',
  'RRF-EXECUTIVE-PENS_19',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-019.png',
  '["/assets/products/pen-019.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  117,
  'Executive Metallic Ballpoint Pen — Model PN-19 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_20',
  'Executive Metallic Ballpoint Pen — Model PN-20',
  'executive-metallic-ballpoint-pen-model-pn-20',
  'RRF-EXECUTIVE-PENS_20',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-020.png',
  '["/assets/products/pen-020.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  118,
  'Executive Metallic Ballpoint Pen — Model PN-20 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_21',
  'Executive Metallic Ballpoint Pen — Model PN-21',
  'executive-metallic-ballpoint-pen-model-pn-21',
  'RRF-EXECUTIVE-PENS_21',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-021.png',
  '["/assets/products/pen-021.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  119,
  'Executive Metallic Ballpoint Pen — Model PN-21 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_22',
  'Executive Metallic Ballpoint Pen — Model PN-22',
  'executive-metallic-ballpoint-pen-model-pn-22',
  'RRF-EXECUTIVE-PENS_22',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-022.png',
  '["/assets/products/pen-022.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  120,
  'Executive Metallic Ballpoint Pen — Model PN-22 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_23',
  'Executive Metallic Ballpoint Pen — Model PN-23',
  'executive-metallic-ballpoint-pen-model-pn-23',
  'RRF-EXECUTIVE-PENS_23',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-023.png',
  '["/assets/products/pen-023.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  121,
  'Executive Metallic Ballpoint Pen — Model PN-23 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_24',
  'Executive Metallic Ballpoint Pen — Model PN-24',
  'executive-metallic-ballpoint-pen-model-pn-24',
  'RRF-EXECUTIVE-PENS_24',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-024.png',
  '["/assets/products/pen-024.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  122,
  'Executive Metallic Ballpoint Pen — Model PN-24 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_25',
  'Executive Metallic Ballpoint Pen — Model PN-25',
  'executive-metallic-ballpoint-pen-model-pn-25',
  'RRF-EXECUTIVE-PENS_25',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-025.png',
  '["/assets/products/pen-025.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  123,
  'Executive Metallic Ballpoint Pen — Model PN-25 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_26',
  'Executive Metallic Ballpoint Pen — Model PN-26',
  'executive-metallic-ballpoint-pen-model-pn-26',
  'RRF-EXECUTIVE-PENS_26',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-026.png',
  '["/assets/products/pen-026.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  124,
  'Executive Metallic Ballpoint Pen — Model PN-26 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_27',
  'Executive Metallic Ballpoint Pen — Model PN-27',
  'executive-metallic-ballpoint-pen-model-pn-27',
  'RRF-EXECUTIVE-PENS_27',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-027.png',
  '["/assets/products/pen-027.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  125,
  'Executive Metallic Ballpoint Pen — Model PN-27 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_28',
  'Executive Metallic Ballpoint Pen — Model PN-28',
  'executive-metallic-ballpoint-pen-model-pn-28',
  'RRF-EXECUTIVE-PENS_28',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-028.png',
  '["/assets/products/pen-028.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  126,
  'Executive Metallic Ballpoint Pen — Model PN-28 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_29',
  'Executive Metallic Ballpoint Pen — Model PN-29',
  'executive-metallic-ballpoint-pen-model-pn-29',
  'RRF-EXECUTIVE-PENS_29',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-029.png',
  '["/assets/products/pen-029.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  127,
  'Executive Metallic Ballpoint Pen — Model PN-29 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_30',
  'Executive Metallic Ballpoint Pen — Model PN-30',
  'executive-metallic-ballpoint-pen-model-pn-30',
  'RRF-EXECUTIVE-PENS_30',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-030.png',
  '["/assets/products/pen-030.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  128,
  'Executive Metallic Ballpoint Pen — Model PN-30 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_31',
  'Executive Metallic Ballpoint Pen — Model PN-31',
  'executive-metallic-ballpoint-pen-model-pn-31',
  'RRF-EXECUTIVE-PENS_31',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-031.png',
  '["/assets/products/pen-031.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  129,
  'Executive Metallic Ballpoint Pen — Model PN-31 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_32',
  'Executive Metallic Ballpoint Pen — Model PN-32',
  'executive-metallic-ballpoint-pen-model-pn-32',
  'RRF-EXECUTIVE-PENS_32',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-032.png',
  '["/assets/products/pen-032.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  130,
  'Executive Metallic Ballpoint Pen — Model PN-32 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_33',
  'Executive Metallic Ballpoint Pen — Model PN-33',
  'executive-metallic-ballpoint-pen-model-pn-33',
  'RRF-EXECUTIVE-PENS_33',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-033.png',
  '["/assets/products/pen-033.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  131,
  'Executive Metallic Ballpoint Pen — Model PN-33 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_34',
  'Executive Metallic Ballpoint Pen — Model PN-34',
  'executive-metallic-ballpoint-pen-model-pn-34',
  'RRF-EXECUTIVE-PENS_34',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-034.png',
  '["/assets/products/pen-034.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  132,
  'Executive Metallic Ballpoint Pen — Model PN-34 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_35',
  'Executive Metallic Ballpoint Pen — Model PN-35',
  'executive-metallic-ballpoint-pen-model-pn-35',
  'RRF-EXECUTIVE-PENS_35',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-035.png',
  '["/assets/products/pen-035.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  133,
  'Executive Metallic Ballpoint Pen — Model PN-35 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_36',
  'Executive Metallic Ballpoint Pen — Model PN-36',
  'executive-metallic-ballpoint-pen-model-pn-36',
  'RRF-EXECUTIVE-PENS_36',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-036.png',
  '["/assets/products/pen-036.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  134,
  'Executive Metallic Ballpoint Pen — Model PN-36 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_37',
  'Executive Metallic Ballpoint Pen — Model PN-37',
  'executive-metallic-ballpoint-pen-model-pn-37',
  'RRF-EXECUTIVE-PENS_37',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-037.png',
  '["/assets/products/pen-037.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  135,
  'Executive Metallic Ballpoint Pen — Model PN-37 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_38',
  'Executive Metallic Ballpoint Pen — Model PN-38',
  'executive-metallic-ballpoint-pen-model-pn-38',
  'RRF-EXECUTIVE-PENS_38',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-038.png',
  '["/assets/products/pen-038.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  136,
  'Executive Metallic Ballpoint Pen — Model PN-38 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_39',
  'Executive Metallic Ballpoint Pen — Model PN-39',
  'executive-metallic-ballpoint-pen-model-pn-39',
  'RRF-EXECUTIVE-PENS_39',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-039.png',
  '["/assets/products/pen-039.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  137,
  'Executive Metallic Ballpoint Pen — Model PN-39 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_40',
  'Executive Metallic Ballpoint Pen — Model PN-40',
  'executive-metallic-ballpoint-pen-model-pn-40',
  'RRF-EXECUTIVE-PENS_40',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-040.png',
  '["/assets/products/pen-040.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  138,
  'Executive Metallic Ballpoint Pen — Model PN-40 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_41',
  'Executive Metallic Ballpoint Pen — Model PN-41',
  'executive-metallic-ballpoint-pen-model-pn-41',
  'RRF-EXECUTIVE-PENS_41',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-041.png',
  '["/assets/products/pen-041.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  139,
  'Executive Metallic Ballpoint Pen — Model PN-41 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_42',
  'Executive Metallic Ballpoint Pen — Model PN-42',
  'executive-metallic-ballpoint-pen-model-pn-42',
  'RRF-EXECUTIVE-PENS_42',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-042.png',
  '["/assets/products/pen-042.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  140,
  'Executive Metallic Ballpoint Pen — Model PN-42 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_43',
  'Executive Metallic Ballpoint Pen — Model PN-43',
  'executive-metallic-ballpoint-pen-model-pn-43',
  'RRF-EXECUTIVE-PENS_43',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-043.png',
  '["/assets/products/pen-043.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  141,
  'Executive Metallic Ballpoint Pen — Model PN-43 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_44',
  'Executive Metallic Ballpoint Pen — Model PN-44',
  'executive-metallic-ballpoint-pen-model-pn-44',
  'RRF-EXECUTIVE-PENS_44',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-044.png',
  '["/assets/products/pen-044.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  142,
  'Executive Metallic Ballpoint Pen — Model PN-44 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_45',
  'Executive Metallic Ballpoint Pen — Model PN-45',
  'executive-metallic-ballpoint-pen-model-pn-45',
  'RRF-EXECUTIVE-PENS_45',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-045.png',
  '["/assets/products/pen-045.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  143,
  'Executive Metallic Ballpoint Pen — Model PN-45 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_46',
  'Executive Metallic Ballpoint Pen — Model PN-46',
  'executive-metallic-ballpoint-pen-model-pn-46',
  'RRF-EXECUTIVE-PENS_46',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-046.png',
  '["/assets/products/pen-046.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  144,
  'Executive Metallic Ballpoint Pen — Model PN-46 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_47',
  'Executive Metallic Ballpoint Pen — Model PN-47',
  'executive-metallic-ballpoint-pen-model-pn-47',
  'RRF-EXECUTIVE-PENS_47',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-047.png',
  '["/assets/products/pen-047.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  145,
  'Executive Metallic Ballpoint Pen — Model PN-47 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_48',
  'Executive Metallic Ballpoint Pen — Model PN-48',
  'executive-metallic-ballpoint-pen-model-pn-48',
  'RRF-EXECUTIVE-PENS_48',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-048.png',
  '["/assets/products/pen-048.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  146,
  'Executive Metallic Ballpoint Pen — Model PN-48 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_49',
  'Executive Metallic Ballpoint Pen — Model PN-49',
  'executive-metallic-ballpoint-pen-model-pn-49',
  'RRF-EXECUTIVE-PENS_49',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-049.png',
  '["/assets/products/pen-049.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  147,
  'Executive Metallic Ballpoint Pen — Model PN-49 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_executive-pens_50',
  'Executive Metallic Ballpoint Pen — Model PN-50',
  'executive-metallic-ballpoint-pen-model-pn-50',
  'RRF-EXECUTIVE-PENS_50',
  'executive-pens',
  'Executive Pens & Writing',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding.',
  'Balanced metallic construction featuring a twist or click deployment mechanism and durable pocket clip. Specifically coated to accept high-contrast laser etching for client logos and individual recipient names.',
  '/assets/products/pen-050.png',
  '["/assets/products/pen-050.png"]',
  '["Brass / Aluminum Barrel","German Tungsten Carbide Ball Refill","Chrome / Rose Gold Trims"]',
  '{"Refill":"0.7mm / 1.0mm Blue / Black German Ink","Finish":"Matte Lacquer / Brushed Gunmetal / Chrome","Branding":"360-Degree Rotary Fiber Laser Etch","Packaging":"Velvet Pouch / Premium Hard Gift Box"}',
  0,
  100,
  '["Pen","Executive Pen","Corporate Stationery","Laser Engraved","Metal Pen"]',
  '[]',
  'published',
  148,
  'Executive Metallic Ballpoint Pen — Model PN-50 | Direct Manufacturer RR Foundations',
  'Solid metal weighted corporate pen with smooth ink flow and precision laser-etched branding. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_01',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-01',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-01',
  'RRF-LANYARDS-CREDENTIALS_01',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-001.jpeg',
  '["/assets/products/lanyard-id-001.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  1,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  149,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-01 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_02',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-02',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-02',
  'RRF-LANYARDS-CREDENTIALS_02',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-002.jpeg',
  '["/assets/products/lanyard-id-002.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  1,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  150,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-02 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_03',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-03',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-03',
  'RRF-LANYARDS-CREDENTIALS_03',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-003.jpeg',
  '["/assets/products/lanyard-id-003.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  0,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  151,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-03 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_04',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-04',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-04',
  'RRF-LANYARDS-CREDENTIALS_04',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-004.jpeg',
  '["/assets/products/lanyard-id-004.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  0,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  152,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-04 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_05',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-05',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-05',
  'RRF-LANYARDS-CREDENTIALS_05',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-005.jpeg',
  '["/assets/products/lanyard-id-005.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  0,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  153,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-05 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_06',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-06',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-06',
  'RRF-LANYARDS-CREDENTIALS_06',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-006.jpeg',
  '["/assets/products/lanyard-id-006.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  0,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  154,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-06 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_07',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-07',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-07',
  'RRF-LANYARDS-CREDENTIALS_07',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-007.jpeg',
  '["/assets/products/lanyard-id-007.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  0,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  155,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-07 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_08',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-08',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-08',
  'RRF-LANYARDS-CREDENTIALS_08',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-008.jpeg',
  '["/assets/products/lanyard-id-008.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  0,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  156,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-08 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_09',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-09',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-09',
  'RRF-LANYARDS-CREDENTIALS_09',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-009.jpeg',
  '["/assets/products/lanyard-id-009.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  0,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  157,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-09 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_10',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-10',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-10',
  'RRF-LANYARDS-CREDENTIALS_10',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-010.jpeg',
  '["/assets/products/lanyard-id-010.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  0,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  158,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-10 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_11',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-11',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-11',
  'RRF-LANYARDS-CREDENTIALS_11',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-011.jpeg',
  '["/assets/products/lanyard-id-011.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  0,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  159,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-11 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_lanyards-credentials_12',
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-12',
  'custom-sublimation-satin-lanyard-id-kit-model-ln-12',
  'RRF-LANYARDS-CREDENTIALS_12',
  'lanyards-credentials',
  'Lanyards & Identification',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge.',
  'Soft-touch high-tensile polyester ribbon with vibrant double-sided dye-sublimation printing. Equipped with a heavy-duty 360-degree rotating metal lobster clasp and optional safety breakaway buckle.',
  '/assets/products/lanyard-id-012.jpeg',
  '["/assets/products/lanyard-id-012.jpeg"]',
  '["Woven Polyester / Satin Ribbon","Zinc Alloy Swivel Clasp","Rigid Acrylic ID Case"]',
  '{"Width":"16mm / 20mm / 25mm Width Options","Print":"Full-Bleed Heat Transfer Sublimation","Safety":"Quick-Release Breakaway Nape Clasp","Badge Holder":"Top-Loading Clear Acrylic Case"}',
  0,
  100,
  '["Lanyard","ID Card","Conference Kit","Event Credential","Neck Cord"]',
  '[]',
  'published',
  160,
  'Custom Sublimation Satin Lanyard & ID Kit — Model LN-12 | Direct Manufacturer RR Foundations',
  'Continuous multi-color sublimation neck lanyard with rigid acrylic credential badge. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_01',
  'Custom Die-Cut Refrigerator Magnet — Model MG-01',
  'custom-die-cut-refrigerator-magnet-model-mg-01',
  'RRF-MAGNETS-SOUVENIRS_01',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/category-magnet-showcase.jpg',
  '["/assets/products/category-magnet-showcase.jpg","/assets/products/magnet-001.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  1,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  161,
  'Custom Die-Cut Refrigerator Magnet — Model MG-01 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_02',
  'Custom Die-Cut Refrigerator Magnet — Model MG-02',
  'custom-die-cut-refrigerator-magnet-model-mg-02',
  'RRF-MAGNETS-SOUVENIRS_02',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-002.jpeg',
  '["/assets/products/magnet-002.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  1,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  162,
  'Custom Die-Cut Refrigerator Magnet — Model MG-02 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_03',
  'Custom Die-Cut Refrigerator Magnet — Model MG-03',
  'custom-die-cut-refrigerator-magnet-model-mg-03',
  'RRF-MAGNETS-SOUVENIRS_03',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-003.jpeg',
  '["/assets/products/magnet-003.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  163,
  'Custom Die-Cut Refrigerator Magnet — Model MG-03 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_04',
  'Custom Die-Cut Refrigerator Magnet — Model MG-04',
  'custom-die-cut-refrigerator-magnet-model-mg-04',
  'RRF-MAGNETS-SOUVENIRS_04',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-004.jpeg',
  '["/assets/products/magnet-004.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  164,
  'Custom Die-Cut Refrigerator Magnet — Model MG-04 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_05',
  'Custom Die-Cut Refrigerator Magnet — Model MG-05',
  'custom-die-cut-refrigerator-magnet-model-mg-05',
  'RRF-MAGNETS-SOUVENIRS_05',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-005.jpeg',
  '["/assets/products/magnet-005.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  165,
  'Custom Die-Cut Refrigerator Magnet — Model MG-05 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_06',
  'Custom Die-Cut Refrigerator Magnet — Model MG-06',
  'custom-die-cut-refrigerator-magnet-model-mg-06',
  'RRF-MAGNETS-SOUVENIRS_06',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-006.jpeg',
  '["/assets/products/magnet-006.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  166,
  'Custom Die-Cut Refrigerator Magnet — Model MG-06 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_07',
  'Custom Die-Cut Refrigerator Magnet — Model MG-07',
  'custom-die-cut-refrigerator-magnet-model-mg-07',
  'RRF-MAGNETS-SOUVENIRS_07',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-007.jpeg',
  '["/assets/products/magnet-007.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  167,
  'Custom Die-Cut Refrigerator Magnet — Model MG-07 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_08',
  'Custom Die-Cut Refrigerator Magnet — Model MG-08',
  'custom-die-cut-refrigerator-magnet-model-mg-08',
  'RRF-MAGNETS-SOUVENIRS_08',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-008.jpeg',
  '["/assets/products/magnet-008.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  168,
  'Custom Die-Cut Refrigerator Magnet — Model MG-08 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_09',
  'Custom Die-Cut Refrigerator Magnet — Model MG-09',
  'custom-die-cut-refrigerator-magnet-model-mg-09',
  'RRF-MAGNETS-SOUVENIRS_09',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-009.jpeg',
  '["/assets/products/magnet-009.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  169,
  'Custom Die-Cut Refrigerator Magnet — Model MG-09 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_10',
  'Custom Die-Cut Refrigerator Magnet — Model MG-10',
  'custom-die-cut-refrigerator-magnet-model-mg-10',
  'RRF-MAGNETS-SOUVENIRS_10',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-010.jpeg',
  '["/assets/products/magnet-010.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  170,
  'Custom Die-Cut Refrigerator Magnet — Model MG-10 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_11',
  'Custom Die-Cut Refrigerator Magnet — Model MG-11',
  'custom-die-cut-refrigerator-magnet-model-mg-11',
  'RRF-MAGNETS-SOUVENIRS_11',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-011.jpeg',
  '["/assets/products/magnet-011.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  171,
  'Custom Die-Cut Refrigerator Magnet — Model MG-11 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_12',
  'Custom Die-Cut Refrigerator Magnet — Model MG-12',
  'custom-die-cut-refrigerator-magnet-model-mg-12',
  'RRF-MAGNETS-SOUVENIRS_12',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-012.jpeg',
  '["/assets/products/magnet-012.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  172,
  'Custom Die-Cut Refrigerator Magnet — Model MG-12 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_13',
  'Custom Die-Cut Refrigerator Magnet — Model MG-13',
  'custom-die-cut-refrigerator-magnet-model-mg-13',
  'RRF-MAGNETS-SOUVENIRS_13',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-013.jpeg',
  '["/assets/products/magnet-013.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  173,
  'Custom Die-Cut Refrigerator Magnet — Model MG-13 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_14',
  'Custom Die-Cut Refrigerator Magnet — Model MG-14',
  'custom-die-cut-refrigerator-magnet-model-mg-14',
  'RRF-MAGNETS-SOUVENIRS_14',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-014.jpeg',
  '["/assets/products/magnet-014.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  174,
  'Custom Die-Cut Refrigerator Magnet — Model MG-14 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_15',
  'Custom Die-Cut Refrigerator Magnet — Model MG-15',
  'custom-die-cut-refrigerator-magnet-model-mg-15',
  'RRF-MAGNETS-SOUVENIRS_15',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-015.jpeg',
  '["/assets/products/magnet-015.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  175,
  'Custom Die-Cut Refrigerator Magnet — Model MG-15 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_16',
  'Custom Die-Cut Refrigerator Magnet — Model MG-16',
  'custom-die-cut-refrigerator-magnet-model-mg-16',
  'RRF-MAGNETS-SOUVENIRS_16',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-016.jpeg',
  '["/assets/products/magnet-016.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  176,
  'Custom Die-Cut Refrigerator Magnet — Model MG-16 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_17',
  'Custom Die-Cut Refrigerator Magnet — Model MG-17',
  'custom-die-cut-refrigerator-magnet-model-mg-17',
  'RRF-MAGNETS-SOUVENIRS_17',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-017.jpeg',
  '["/assets/products/magnet-017.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  177,
  'Custom Die-Cut Refrigerator Magnet — Model MG-17 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_18',
  'Custom Die-Cut Refrigerator Magnet — Model MG-18',
  'custom-die-cut-refrigerator-magnet-model-mg-18',
  'RRF-MAGNETS-SOUVENIRS_18',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-018.jpeg',
  '["/assets/products/magnet-018.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  178,
  'Custom Die-Cut Refrigerator Magnet — Model MG-18 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_19',
  'Custom Die-Cut Refrigerator Magnet — Model MG-19',
  'custom-die-cut-refrigerator-magnet-model-mg-19',
  'RRF-MAGNETS-SOUVENIRS_19',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-019.jpeg',
  '["/assets/products/magnet-019.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  179,
  'Custom Die-Cut Refrigerator Magnet — Model MG-19 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_20',
  'Custom Die-Cut Refrigerator Magnet — Model MG-20',
  'custom-die-cut-refrigerator-magnet-model-mg-20',
  'RRF-MAGNETS-SOUVENIRS_20',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-020.jpeg',
  '["/assets/products/magnet-020.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  180,
  'Custom Die-Cut Refrigerator Magnet — Model MG-20 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_21',
  'Custom Die-Cut Refrigerator Magnet — Model MG-21',
  'custom-die-cut-refrigerator-magnet-model-mg-21',
  'RRF-MAGNETS-SOUVENIRS_21',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-021.jpeg',
  '["/assets/products/magnet-021.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  181,
  'Custom Die-Cut Refrigerator Magnet — Model MG-21 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_22',
  'Custom Die-Cut Refrigerator Magnet — Model MG-22',
  'custom-die-cut-refrigerator-magnet-model-mg-22',
  'RRF-MAGNETS-SOUVENIRS_22',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-022.jpeg',
  '["/assets/products/magnet-022.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  182,
  'Custom Die-Cut Refrigerator Magnet — Model MG-22 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_23',
  'Custom Die-Cut Refrigerator Magnet — Model MG-23',
  'custom-die-cut-refrigerator-magnet-model-mg-23',
  'RRF-MAGNETS-SOUVENIRS_23',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-023.jpeg',
  '["/assets/products/magnet-023.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  183,
  'Custom Die-Cut Refrigerator Magnet — Model MG-23 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_24',
  'Custom Die-Cut Refrigerator Magnet — Model MG-24',
  'custom-die-cut-refrigerator-magnet-model-mg-24',
  'RRF-MAGNETS-SOUVENIRS_24',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-024.jpeg',
  '["/assets/products/magnet-024.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  184,
  'Custom Die-Cut Refrigerator Magnet — Model MG-24 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_25',
  'Custom Die-Cut Refrigerator Magnet — Model MG-25',
  'custom-die-cut-refrigerator-magnet-model-mg-25',
  'RRF-MAGNETS-SOUVENIRS_25',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-025.jpeg',
  '["/assets/products/magnet-025.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  185,
  'Custom Die-Cut Refrigerator Magnet — Model MG-25 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_26',
  'Custom Die-Cut Refrigerator Magnet — Model MG-26',
  'custom-die-cut-refrigerator-magnet-model-mg-26',
  'RRF-MAGNETS-SOUVENIRS_26',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-026.jpeg',
  '["/assets/products/magnet-026.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  186,
  'Custom Die-Cut Refrigerator Magnet — Model MG-26 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_27',
  'Custom Die-Cut Refrigerator Magnet — Model MG-27',
  'custom-die-cut-refrigerator-magnet-model-mg-27',
  'RRF-MAGNETS-SOUVENIRS_27',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-027.jpeg',
  '["/assets/products/magnet-027.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  187,
  'Custom Die-Cut Refrigerator Magnet — Model MG-27 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_28',
  'Custom Die-Cut Refrigerator Magnet — Model MG-28',
  'custom-die-cut-refrigerator-magnet-model-mg-28',
  'RRF-MAGNETS-SOUVENIRS_28',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-028.jpeg',
  '["/assets/products/magnet-028.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  188,
  'Custom Die-Cut Refrigerator Magnet — Model MG-28 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_29',
  'Custom Die-Cut Refrigerator Magnet — Model MG-29',
  'custom-die-cut-refrigerator-magnet-model-mg-29',
  'RRF-MAGNETS-SOUVENIRS_29',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-029.jpeg',
  '["/assets/products/magnet-029.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  189,
  'Custom Die-Cut Refrigerator Magnet — Model MG-29 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_30',
  'Custom Die-Cut Refrigerator Magnet — Model MG-30',
  'custom-die-cut-refrigerator-magnet-model-mg-30',
  'RRF-MAGNETS-SOUVENIRS_30',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-030.jpeg',
  '["/assets/products/magnet-030.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  190,
  'Custom Die-Cut Refrigerator Magnet — Model MG-30 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_31',
  'Custom Die-Cut Refrigerator Magnet — Model MG-31',
  'custom-die-cut-refrigerator-magnet-model-mg-31',
  'RRF-MAGNETS-SOUVENIRS_31',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-031.jpeg',
  '["/assets/products/magnet-031.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  191,
  'Custom Die-Cut Refrigerator Magnet — Model MG-31 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_32',
  'Custom Die-Cut Refrigerator Magnet — Model MG-32',
  'custom-die-cut-refrigerator-magnet-model-mg-32',
  'RRF-MAGNETS-SOUVENIRS_32',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-032.jpeg',
  '["/assets/products/magnet-032.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  192,
  'Custom Die-Cut Refrigerator Magnet — Model MG-32 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_33',
  'Custom Die-Cut Refrigerator Magnet — Model MG-33',
  'custom-die-cut-refrigerator-magnet-model-mg-33',
  'RRF-MAGNETS-SOUVENIRS_33',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-033.jpeg',
  '["/assets/products/magnet-033.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  193,
  'Custom Die-Cut Refrigerator Magnet — Model MG-33 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_34',
  'Custom Die-Cut Refrigerator Magnet — Model MG-34',
  'custom-die-cut-refrigerator-magnet-model-mg-34',
  'RRF-MAGNETS-SOUVENIRS_34',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-034.jpeg',
  '["/assets/products/magnet-034.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  194,
  'Custom Die-Cut Refrigerator Magnet — Model MG-34 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_35',
  'Custom Die-Cut Refrigerator Magnet — Model MG-35',
  'custom-die-cut-refrigerator-magnet-model-mg-35',
  'RRF-MAGNETS-SOUVENIRS_35',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-035.jpeg',
  '["/assets/products/magnet-035.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  195,
  'Custom Die-Cut Refrigerator Magnet — Model MG-35 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_36',
  'Custom Die-Cut Refrigerator Magnet — Model MG-36',
  'custom-die-cut-refrigerator-magnet-model-mg-36',
  'RRF-MAGNETS-SOUVENIRS_36',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-036.jpeg',
  '["/assets/products/magnet-036.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  196,
  'Custom Die-Cut Refrigerator Magnet — Model MG-36 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_37',
  'Custom Die-Cut Refrigerator Magnet — Model MG-37',
  'custom-die-cut-refrigerator-magnet-model-mg-37',
  'RRF-MAGNETS-SOUVENIRS_37',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-037.jpeg',
  '["/assets/products/magnet-037.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  197,
  'Custom Die-Cut Refrigerator Magnet — Model MG-37 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_38',
  'Custom Die-Cut Refrigerator Magnet — Model MG-38',
  'custom-die-cut-refrigerator-magnet-model-mg-38',
  'RRF-MAGNETS-SOUVENIRS_38',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-038.jpeg',
  '["/assets/products/magnet-038.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  198,
  'Custom Die-Cut Refrigerator Magnet — Model MG-38 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_39',
  'Custom Die-Cut Refrigerator Magnet — Model MG-39',
  'custom-die-cut-refrigerator-magnet-model-mg-39',
  'RRF-MAGNETS-SOUVENIRS_39',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-039.jpeg',
  '["/assets/products/magnet-039.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  199,
  'Custom Die-Cut Refrigerator Magnet — Model MG-39 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_40',
  'Custom Die-Cut Refrigerator Magnet — Model MG-40',
  'custom-die-cut-refrigerator-magnet-model-mg-40',
  'RRF-MAGNETS-SOUVENIRS_40',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-040.jpeg',
  '["/assets/products/magnet-040.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  200,
  'Custom Die-Cut Refrigerator Magnet — Model MG-40 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_41',
  'Custom Die-Cut Refrigerator Magnet — Model MG-41',
  'custom-die-cut-refrigerator-magnet-model-mg-41',
  'RRF-MAGNETS-SOUVENIRS_41',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-041.jpeg',
  '["/assets/products/magnet-041.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  201,
  'Custom Die-Cut Refrigerator Magnet — Model MG-41 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_magnets-souvenirs_42',
  'Custom Die-Cut Refrigerator Magnet — Model MG-42',
  'custom-die-cut-refrigerator-magnet-model-mg-42',
  'RRF-MAGNETS-SOUVENIRS_42',
  'magnets-souvenirs',
  'Custom Fridge Magnets & Souvenirs',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing.',
  'Produced using high-clarity cast acrylic or high-density flexible rubberized magnets. Provides maximum brand exposure on metal surfaces with photographic image fidelity that resists yellowing and fading.',
  '/assets/products/magnet-042.jpeg',
  '["/assets/products/magnet-042.jpeg"]',
  '["Isotropic High-Tack Flexible Magnet","Cast Acrylic / Molded PVC","UV Lamination"]',
  '{"Thickness":"2mm - 4mm Solid Construction","Printing":"CMYK Digital Direct Flatbed Printing","Shape":"Custom Die-Cut to Client Silhouette","Durability":"Moisture and Fade Resistant"}',
  0,
  100,
  '["Fridge Magnet","Souvenir","Promotional Merchandise","Acrylic Magnet","PVC"]',
  '[]',
  'published',
  202,
  'Custom Die-Cut Refrigerator Magnet — Model MG-42 | Direct Manufacturer RR Foundations',
  'Vibrant full-color promotional fridge magnet with heavy-duty flexible magnetic backing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_01',
  'Mechanical Gear & Designer Wall Clock — Model WC-01',
  'mechanical-gear-designer-wall-clock-model-wc-01',
  'RRF-DESIGNER-WALL-CLOCKS_01',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-001.jpeg',
  '["/assets/products/wall-clock-001.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  1,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  203,
  'Mechanical Gear & Designer Wall Clock — Model WC-01 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_02',
  'Mechanical Gear & Designer Wall Clock — Model WC-02',
  'mechanical-gear-designer-wall-clock-model-wc-02',
  'RRF-DESIGNER-WALL-CLOCKS_02',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-002.jpeg',
  '["/assets/products/wall-clock-002.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  1,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  204,
  'Mechanical Gear & Designer Wall Clock — Model WC-02 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_03',
  'Mechanical Gear & Designer Wall Clock — Model WC-03',
  'mechanical-gear-designer-wall-clock-model-wc-03',
  'RRF-DESIGNER-WALL-CLOCKS_03',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-003.jpeg',
  '["/assets/products/wall-clock-003.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  205,
  'Mechanical Gear & Designer Wall Clock — Model WC-03 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_04',
  'Mechanical Gear & Designer Wall Clock — Model WC-04',
  'mechanical-gear-designer-wall-clock-model-wc-04',
  'RRF-DESIGNER-WALL-CLOCKS_04',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-004.jpeg',
  '["/assets/products/wall-clock-004.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  206,
  'Mechanical Gear & Designer Wall Clock — Model WC-04 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_05',
  'Mechanical Gear & Designer Wall Clock — Model WC-05',
  'mechanical-gear-designer-wall-clock-model-wc-05',
  'RRF-DESIGNER-WALL-CLOCKS_05',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-005.jpeg',
  '["/assets/products/wall-clock-005.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  207,
  'Mechanical Gear & Designer Wall Clock — Model WC-05 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_06',
  'Mechanical Gear & Designer Wall Clock — Model WC-06',
  'mechanical-gear-designer-wall-clock-model-wc-06',
  'RRF-DESIGNER-WALL-CLOCKS_06',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-006.jpeg',
  '["/assets/products/wall-clock-006.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  208,
  'Mechanical Gear & Designer Wall Clock — Model WC-06 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_07',
  'Mechanical Gear & Designer Wall Clock — Model WC-07',
  'mechanical-gear-designer-wall-clock-model-wc-07',
  'RRF-DESIGNER-WALL-CLOCKS_07',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-007.jpeg',
  '["/assets/products/wall-clock-007.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  209,
  'Mechanical Gear & Designer Wall Clock — Model WC-07 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_08',
  'Mechanical Gear & Designer Wall Clock — Model WC-08',
  'mechanical-gear-designer-wall-clock-model-wc-08',
  'RRF-DESIGNER-WALL-CLOCKS_08',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-008.jpeg',
  '["/assets/products/wall-clock-008.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  210,
  'Mechanical Gear & Designer Wall Clock — Model WC-08 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_09',
  'Mechanical Gear & Designer Wall Clock — Model WC-09',
  'mechanical-gear-designer-wall-clock-model-wc-09',
  'RRF-DESIGNER-WALL-CLOCKS_09',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-009.jpeg',
  '["/assets/products/wall-clock-009.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  211,
  'Mechanical Gear & Designer Wall Clock — Model WC-09 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_10',
  'Mechanical Gear & Designer Wall Clock — Model WC-10',
  'mechanical-gear-designer-wall-clock-model-wc-10',
  'RRF-DESIGNER-WALL-CLOCKS_10',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-010.jpeg',
  '["/assets/products/wall-clock-010.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  212,
  'Mechanical Gear & Designer Wall Clock — Model WC-10 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_11',
  'Mechanical Gear & Designer Wall Clock — Model WC-11',
  'mechanical-gear-designer-wall-clock-model-wc-11',
  'RRF-DESIGNER-WALL-CLOCKS_11',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-011.jpeg',
  '["/assets/products/wall-clock-011.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  213,
  'Mechanical Gear & Designer Wall Clock — Model WC-11 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_12',
  'Mechanical Gear & Designer Wall Clock — Model WC-12',
  'mechanical-gear-designer-wall-clock-model-wc-12',
  'RRF-DESIGNER-WALL-CLOCKS_12',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-012.jpeg',
  '["/assets/products/wall-clock-012.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  214,
  'Mechanical Gear & Designer Wall Clock — Model WC-12 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_13',
  'Mechanical Gear & Designer Wall Clock — Model WC-13',
  'mechanical-gear-designer-wall-clock-model-wc-13',
  'RRF-DESIGNER-WALL-CLOCKS_13',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-013.jpeg',
  '["/assets/products/wall-clock-013.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  215,
  'Mechanical Gear & Designer Wall Clock — Model WC-13 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_14',
  'Mechanical Gear & Designer Wall Clock — Model WC-14',
  'mechanical-gear-designer-wall-clock-model-wc-14',
  'RRF-DESIGNER-WALL-CLOCKS_14',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-014.jpeg',
  '["/assets/products/wall-clock-014.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  216,
  'Mechanical Gear & Designer Wall Clock — Model WC-14 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_15',
  'Mechanical Gear & Designer Wall Clock — Model WC-15',
  'mechanical-gear-designer-wall-clock-model-wc-15',
  'RRF-DESIGNER-WALL-CLOCKS_15',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-015.jpeg',
  '["/assets/products/wall-clock-015.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  217,
  'Mechanical Gear & Designer Wall Clock — Model WC-15 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_16',
  'Mechanical Gear & Designer Wall Clock — Model WC-16',
  'mechanical-gear-designer-wall-clock-model-wc-16',
  'RRF-DESIGNER-WALL-CLOCKS_16',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-016.jpeg',
  '["/assets/products/wall-clock-016.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  218,
  'Mechanical Gear & Designer Wall Clock — Model WC-16 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_17',
  'Mechanical Gear & Designer Wall Clock — Model WC-17',
  'mechanical-gear-designer-wall-clock-model-wc-17',
  'RRF-DESIGNER-WALL-CLOCKS_17',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-017.jpeg',
  '["/assets/products/wall-clock-017.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  219,
  'Mechanical Gear & Designer Wall Clock — Model WC-17 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_18',
  'Mechanical Gear & Designer Wall Clock — Model WC-18',
  'mechanical-gear-designer-wall-clock-model-wc-18',
  'RRF-DESIGNER-WALL-CLOCKS_18',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-018.jpeg',
  '["/assets/products/wall-clock-018.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  220,
  'Mechanical Gear & Designer Wall Clock — Model WC-18 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_19',
  'Mechanical Gear & Designer Wall Clock — Model WC-19',
  'mechanical-gear-designer-wall-clock-model-wc-19',
  'RRF-DESIGNER-WALL-CLOCKS_19',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-019.jpeg',
  '["/assets/products/wall-clock-019.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  221,
  'Mechanical Gear & Designer Wall Clock — Model WC-19 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_20',
  'Mechanical Gear & Designer Wall Clock — Model WC-20',
  'mechanical-gear-designer-wall-clock-model-wc-20',
  'RRF-DESIGNER-WALL-CLOCKS_20',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-020.jpeg',
  '["/assets/products/wall-clock-020.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  222,
  'Mechanical Gear & Designer Wall Clock — Model WC-20 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_21',
  'Mechanical Gear & Designer Wall Clock — Model WC-21',
  'mechanical-gear-designer-wall-clock-model-wc-21',
  'RRF-DESIGNER-WALL-CLOCKS_21',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-021.jpeg',
  '["/assets/products/wall-clock-021.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  223,
  'Mechanical Gear & Designer Wall Clock — Model WC-21 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_22',
  'Mechanical Gear & Designer Wall Clock — Model WC-22',
  'mechanical-gear-designer-wall-clock-model-wc-22',
  'RRF-DESIGNER-WALL-CLOCKS_22',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-022.jpeg',
  '["/assets/products/wall-clock-022.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  224,
  'Mechanical Gear & Designer Wall Clock — Model WC-22 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_23',
  'Mechanical Gear & Designer Wall Clock — Model WC-23',
  'mechanical-gear-designer-wall-clock-model-wc-23',
  'RRF-DESIGNER-WALL-CLOCKS_23',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-023.jpeg',
  '["/assets/products/wall-clock-023.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  225,
  'Mechanical Gear & Designer Wall Clock — Model WC-23 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_24',
  'Mechanical Gear & Designer Wall Clock — Model WC-24',
  'mechanical-gear-designer-wall-clock-model-wc-24',
  'RRF-DESIGNER-WALL-CLOCKS_24',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-024.jpeg',
  '["/assets/products/wall-clock-024.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  226,
  'Mechanical Gear & Designer Wall Clock — Model WC-24 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_25',
  'Mechanical Gear & Designer Wall Clock — Model WC-25',
  'mechanical-gear-designer-wall-clock-model-wc-25',
  'RRF-DESIGNER-WALL-CLOCKS_25',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-025.jpeg',
  '["/assets/products/wall-clock-025.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  227,
  'Mechanical Gear & Designer Wall Clock — Model WC-25 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_26',
  'Mechanical Gear & Designer Wall Clock — Model WC-26',
  'mechanical-gear-designer-wall-clock-model-wc-26',
  'RRF-DESIGNER-WALL-CLOCKS_26',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-026.jpeg',
  '["/assets/products/wall-clock-026.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  228,
  'Mechanical Gear & Designer Wall Clock — Model WC-26 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_27',
  'Mechanical Gear & Designer Wall Clock — Model WC-27',
  'mechanical-gear-designer-wall-clock-model-wc-27',
  'RRF-DESIGNER-WALL-CLOCKS_27',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-027.jpeg',
  '["/assets/products/wall-clock-027.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  229,
  'Mechanical Gear & Designer Wall Clock — Model WC-27 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_28',
  'Mechanical Gear & Designer Wall Clock — Model WC-28',
  'mechanical-gear-designer-wall-clock-model-wc-28',
  'RRF-DESIGNER-WALL-CLOCKS_28',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-028.jpeg',
  '["/assets/products/wall-clock-028.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  230,
  'Mechanical Gear & Designer Wall Clock — Model WC-28 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_29',
  'Mechanical Gear & Designer Wall Clock — Model WC-29',
  'mechanical-gear-designer-wall-clock-model-wc-29',
  'RRF-DESIGNER-WALL-CLOCKS_29',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-029.jpeg',
  '["/assets/products/wall-clock-029.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  231,
  'Mechanical Gear & Designer Wall Clock — Model WC-29 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_30',
  'Mechanical Gear & Designer Wall Clock — Model WC-30',
  'mechanical-gear-designer-wall-clock-model-wc-30',
  'RRF-DESIGNER-WALL-CLOCKS_30',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-030.jpeg',
  '["/assets/products/wall-clock-030.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  232,
  'Mechanical Gear & Designer Wall Clock — Model WC-30 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_31',
  'Mechanical Gear & Designer Wall Clock — Model WC-31',
  'mechanical-gear-designer-wall-clock-model-wc-31',
  'RRF-DESIGNER-WALL-CLOCKS_31',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-031.jpeg',
  '["/assets/products/wall-clock-031.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  233,
  'Mechanical Gear & Designer Wall Clock — Model WC-31 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_32',
  'Mechanical Gear & Designer Wall Clock — Model WC-32',
  'mechanical-gear-designer-wall-clock-model-wc-32',
  'RRF-DESIGNER-WALL-CLOCKS_32',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-032.jpeg',
  '["/assets/products/wall-clock-032.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  234,
  'Mechanical Gear & Designer Wall Clock — Model WC-32 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_33',
  'Mechanical Gear & Designer Wall Clock — Model WC-33',
  'mechanical-gear-designer-wall-clock-model-wc-33',
  'RRF-DESIGNER-WALL-CLOCKS_33',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-033.jpeg',
  '["/assets/products/wall-clock-033.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  235,
  'Mechanical Gear & Designer Wall Clock — Model WC-33 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_34',
  'Mechanical Gear & Designer Wall Clock — Model WC-34',
  'mechanical-gear-designer-wall-clock-model-wc-34',
  'RRF-DESIGNER-WALL-CLOCKS_34',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-034.jpeg',
  '["/assets/products/wall-clock-034.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  236,
  'Mechanical Gear & Designer Wall Clock — Model WC-34 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_35',
  'Mechanical Gear & Designer Wall Clock — Model WC-35',
  'mechanical-gear-designer-wall-clock-model-wc-35',
  'RRF-DESIGNER-WALL-CLOCKS_35',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-035.jpeg',
  '["/assets/products/wall-clock-035.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  237,
  'Mechanical Gear & Designer Wall Clock — Model WC-35 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_36',
  'Mechanical Gear & Designer Wall Clock — Model WC-36',
  'mechanical-gear-designer-wall-clock-model-wc-36',
  'RRF-DESIGNER-WALL-CLOCKS_36',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-036.jpeg',
  '["/assets/products/wall-clock-036.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  238,
  'Mechanical Gear & Designer Wall Clock — Model WC-36 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_37',
  'Mechanical Gear & Designer Wall Clock — Model WC-37',
  'mechanical-gear-designer-wall-clock-model-wc-37',
  'RRF-DESIGNER-WALL-CLOCKS_37',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-037.jpeg',
  '["/assets/products/wall-clock-037.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  239,
  'Mechanical Gear & Designer Wall Clock — Model WC-37 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_38',
  'Mechanical Gear & Designer Wall Clock — Model WC-38',
  'mechanical-gear-designer-wall-clock-model-wc-38',
  'RRF-DESIGNER-WALL-CLOCKS_38',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-038.jpeg',
  '["/assets/products/wall-clock-038.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  240,
  'Mechanical Gear & Designer Wall Clock — Model WC-38 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_39',
  'Mechanical Gear & Designer Wall Clock — Model WC-39',
  'mechanical-gear-designer-wall-clock-model-wc-39',
  'RRF-DESIGNER-WALL-CLOCKS_39',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-039.jpeg',
  '["/assets/products/wall-clock-039.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  241,
  'Mechanical Gear & Designer Wall Clock — Model WC-39 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_40',
  'Mechanical Gear & Designer Wall Clock — Model WC-40',
  'mechanical-gear-designer-wall-clock-model-wc-40',
  'RRF-DESIGNER-WALL-CLOCKS_40',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-040.jpeg',
  '["/assets/products/wall-clock-040.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  242,
  'Mechanical Gear & Designer Wall Clock — Model WC-40 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_41',
  'Mechanical Gear & Designer Wall Clock — Model WC-41',
  'mechanical-gear-designer-wall-clock-model-wc-41',
  'RRF-DESIGNER-WALL-CLOCKS_41',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-041.jpeg',
  '["/assets/products/wall-clock-041.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  243,
  'Mechanical Gear & Designer Wall Clock — Model WC-41 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_42',
  'Mechanical Gear & Designer Wall Clock — Model WC-42',
  'mechanical-gear-designer-wall-clock-model-wc-42',
  'RRF-DESIGNER-WALL-CLOCKS_42',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-042.jpeg',
  '["/assets/products/wall-clock-042.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  244,
  'Mechanical Gear & Designer Wall Clock — Model WC-42 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_43',
  'Mechanical Gear & Designer Wall Clock — Model WC-43',
  'mechanical-gear-designer-wall-clock-model-wc-43',
  'RRF-DESIGNER-WALL-CLOCKS_43',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-043.jpeg',
  '["/assets/products/wall-clock-043.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  245,
  'Mechanical Gear & Designer Wall Clock — Model WC-43 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_44',
  'Mechanical Gear & Designer Wall Clock — Model WC-44',
  'mechanical-gear-designer-wall-clock-model-wc-44',
  'RRF-DESIGNER-WALL-CLOCKS_44',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-044.jpeg',
  '["/assets/products/wall-clock-044.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  246,
  'Mechanical Gear & Designer Wall Clock — Model WC-44 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_45',
  'Mechanical Gear & Designer Wall Clock — Model WC-45',
  'mechanical-gear-designer-wall-clock-model-wc-45',
  'RRF-DESIGNER-WALL-CLOCKS_45',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-045.jpeg',
  '["/assets/products/wall-clock-045.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  247,
  'Mechanical Gear & Designer Wall Clock — Model WC-45 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_46',
  'Mechanical Gear & Designer Wall Clock — Model WC-46',
  'mechanical-gear-designer-wall-clock-model-wc-46',
  'RRF-DESIGNER-WALL-CLOCKS_46',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-046.jpeg',
  '["/assets/products/wall-clock-046.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  248,
  'Mechanical Gear & Designer Wall Clock — Model WC-46 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_47',
  'Mechanical Gear & Designer Wall Clock — Model WC-47',
  'mechanical-gear-designer-wall-clock-model-wc-47',
  'RRF-DESIGNER-WALL-CLOCKS_47',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-047.jpeg',
  '["/assets/products/wall-clock-047.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  249,
  'Mechanical Gear & Designer Wall Clock — Model WC-47 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_48',
  'Mechanical Gear & Designer Wall Clock — Model WC-48',
  'mechanical-gear-designer-wall-clock-model-wc-48',
  'RRF-DESIGNER-WALL-CLOCKS_48',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-048.jpeg',
  '["/assets/products/wall-clock-048.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  250,
  'Mechanical Gear & Designer Wall Clock — Model WC-48 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_49',
  'Mechanical Gear & Designer Wall Clock — Model WC-49',
  'mechanical-gear-designer-wall-clock-model-wc-49',
  'RRF-DESIGNER-WALL-CLOCKS_49',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-049.jpeg',
  '["/assets/products/wall-clock-049.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  251,
  'Mechanical Gear & Designer Wall Clock — Model WC-49 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_50',
  'Mechanical Gear & Designer Wall Clock — Model WC-50',
  'mechanical-gear-designer-wall-clock-model-wc-50',
  'RRF-DESIGNER-WALL-CLOCKS_50',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-050.jpeg',
  '["/assets/products/wall-clock-050.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  252,
  'Mechanical Gear & Designer Wall Clock — Model WC-50 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_51',
  'Mechanical Gear & Designer Wall Clock — Model WC-51',
  'mechanical-gear-designer-wall-clock-model-wc-51',
  'RRF-DESIGNER-WALL-CLOCKS_51',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-051.jpeg',
  '["/assets/products/wall-clock-051.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  253,
  'Mechanical Gear & Designer Wall Clock — Model WC-51 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_52',
  'Mechanical Gear & Designer Wall Clock — Model WC-52',
  'mechanical-gear-designer-wall-clock-model-wc-52',
  'RRF-DESIGNER-WALL-CLOCKS_52',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-052.jpeg',
  '["/assets/products/wall-clock-052.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  254,
  'Mechanical Gear & Designer Wall Clock — Model WC-52 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_53',
  'Mechanical Gear & Designer Wall Clock — Model WC-53',
  'mechanical-gear-designer-wall-clock-model-wc-53',
  'RRF-DESIGNER-WALL-CLOCKS_53',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-053.jpeg',
  '["/assets/products/wall-clock-053.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  255,
  'Mechanical Gear & Designer Wall Clock — Model WC-53 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_54',
  'Mechanical Gear & Designer Wall Clock — Model WC-54',
  'mechanical-gear-designer-wall-clock-model-wc-54',
  'RRF-DESIGNER-WALL-CLOCKS_54',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-054.jpeg',
  '["/assets/products/wall-clock-054.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  256,
  'Mechanical Gear & Designer Wall Clock — Model WC-54 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_55',
  'Mechanical Gear & Designer Wall Clock — Model WC-55',
  'mechanical-gear-designer-wall-clock-model-wc-55',
  'RRF-DESIGNER-WALL-CLOCKS_55',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-055.jpeg',
  '["/assets/products/wall-clock-055.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  257,
  'Mechanical Gear & Designer Wall Clock — Model WC-55 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_56',
  'Mechanical Gear & Designer Wall Clock — Model WC-56',
  'mechanical-gear-designer-wall-clock-model-wc-56',
  'RRF-DESIGNER-WALL-CLOCKS_56',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-056.jpeg',
  '["/assets/products/wall-clock-056.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  258,
  'Mechanical Gear & Designer Wall Clock — Model WC-56 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_57',
  'Mechanical Gear & Designer Wall Clock — Model WC-57',
  'mechanical-gear-designer-wall-clock-model-wc-57',
  'RRF-DESIGNER-WALL-CLOCKS_57',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-057.jpeg',
  '["/assets/products/wall-clock-057.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  259,
  'Mechanical Gear & Designer Wall Clock — Model WC-57 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_58',
  'Mechanical Gear & Designer Wall Clock — Model WC-58',
  'mechanical-gear-designer-wall-clock-model-wc-58',
  'RRF-DESIGNER-WALL-CLOCKS_58',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-058.jpeg',
  '["/assets/products/wall-clock-058.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  260,
  'Mechanical Gear & Designer Wall Clock — Model WC-58 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_59',
  'Mechanical Gear & Designer Wall Clock — Model WC-59',
  'mechanical-gear-designer-wall-clock-model-wc-59',
  'RRF-DESIGNER-WALL-CLOCKS_59',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-059.jpeg',
  '["/assets/products/wall-clock-059.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  261,
  'Mechanical Gear & Designer Wall Clock — Model WC-59 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_designer-wall-clocks_60',
  'Mechanical Gear & Designer Wall Clock — Model WC-60',
  'mechanical-gear-designer-wall-clock-model-wc-60',
  'RRF-DESIGNER-WALL-CLOCKS_60',
  'designer-wall-clocks',
  'Designer Wall Clocks',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing.',
  'A centerpiece for executive offices, boardrooms, and luxury residences. Combines exposed gear dynamics with an ultra-quiet precision quartz movement. Available with custom branded inner dials and metallic hour markers.',
  '/assets/products/wall-clock-060.jpeg',
  '["/assets/products/wall-clock-060.jpeg"]',
  '["Engineered MDF / High-Gloss Acrylic","Moving Brass & Steel Gears","Silent Quartz Movement"]',
  '{"Diameter":"12 Inch / 16 Inch / 20 Inch Custom","Movement":"Silent Sweep Non-Ticking Quartz","Power":"Standard AA Battery Operated","Customization":"Logo Dial Foil Stamping & Dial Print"}',
  0,
  25,
  '["Wall Clock","Gear Clock","Corporate Gift","Interior Decor","MDF"]',
  '[]',
  'published',
  262,
  'Mechanical Gear & Designer Wall Clock — Model WC-60 | Direct Manufacturer RR Foundations',
  'Architectural wall timepiece with intricate moving gear mechanisms or precision laser-cut MDF acrylic casing. Manufactured in Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_writing-pads_01',
  'Ortex Industries Automotive Parts Custom Writing Pad',
  'ortex-industries-automotive-parts-custom-writing-pad',
  'RRF-WRITING-PADS_01',
  'writing-pads',
  'Writing Pads',
  'Heavy-duty branded promotional writing pad manufactured for Ortex Industries featuring high-definition automotive component showcase.',
  'Engineered at RR Foundations New Delhi facility for Ortex Industries, this premium writing pad showcases genuine factory branding and automotive parts graphics. Built on a rigid shatter-resistant composite board with a heavy-duty chrome spring clip, chamfered safety edges, and back-surface scratchproof UV printing.',
  '/assets/products/writing-pad-ortex-auto.jpg',
  '["/assets/products/writing-pad-ortex-auto.jpg"]',
  '["High-Impact Acrylic / Rigid Board","Chrome Plated Spring Clip","Scratch-Resistant UV Print"]',
  '{"Company":"Ortex Industries","Product Type":"Promotional Writing Pad / Clipboard","Thickness":"3.5mm Rigid Substrate","Clip Mechanism":"Heavy-Duty Chrome Wire Spring Clamp","Print Quality":"1440 DPI Full-Bleed UV Digital Print"}',
  1,
  50,
  '["Writing Pad","Clipboard","Ortex Industries","Automotive","Corporate Stationery","Custom Print"]',
  '[]',
  'published',
  263,
  'Ortex Industries Automotive Parts Custom Writing Pad | RR Foundations',
  'Custom manufactured Ortex Industries promotional writing pad with durable clamp and full-color direct UV print by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_writing-pads_02',
  'Ortex Industries Modular Switches Promotional Writing Pad',
  'ortex-industries-modular-switches-promotional-writing-pad',
  'RRF-WRITING-PADS_02',
  'writing-pads',
  'Writing Pads',
  'Sleek corporate promotional writing pad for Ortex Industries featuring modular switches and electrical accessories showcase.',
  'Precision-manufactured promotional clipboard for Ortex Industries Electrical Division. Combines vibrant high-gloss UV graphics with an ultra-durable composite core, engineered for electrical dealers, field contractors, and corporate office presentations.',
  '/assets/products/writing-pad-ortex-switches.jpg',
  '["/assets/products/writing-pad-ortex-switches.jpg"]',
  '["Cast Acrylic / High-Density Board","Polished Chrome Spring Clamp","UV Gloss Topcoat"]',
  '{"Company":"Ortex Industries","Product Type":"Promotional Writing Pad / Clipboard","Thickness":"3.5mm Rigid Substrate","Clip Mechanism":"Heavy-Duty Chrome Wire Spring Clamp","Print Quality":"1440 DPI Full-Bleed UV Digital Print"}',
  1,
  50,
  '["Writing Pad","Clipboard","Ortex Industries","Electrical","Modular Switches","Corporate Stationery"]',
  '[]',
  'published',
  264,
  'Ortex Industries Modular Switches Promotional Writing Pad | RR Foundations',
  'Corporate Ortex Industries modular switches promotional writing pad manufactured with premium finish by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_writing-pads_03',
  'Medinetix Healthcare Medical Equipment Custom Writing Pad',
  'medinetix-healthcare-medical-equipment-custom-writing-pad',
  'RRF-WRITING-PADS_03',
  'writing-pads',
  'Writing Pads',
  'Clinical-grade customized writing pad for Medinetix Healthcare featuring institutional diagnostic branding.',
  'Manufactured specifically for healthcare professionals, hospitals, and clinical diagnostics. Features Medinetix Healthcare 3D logo branding, hygienic non-porous wipe-clean surface, smooth rounded safety corners, and an ergonomic firm-grip document clamp.',
  '/assets/products/writing-pad-medinetix-healthcare.jpg',
  '["/assets/products/writing-pad-medinetix-healthcare.jpg"]',
  '["Medical-Grade Acrylic / Rigid Board","Rustproof Chrome Steel Clip","Hygienic Wipe-Clean Topcoat"]',
  '{"Company":"Medinetix Healthcare","Product Type":"Medical Writing Pad / Patient Chart Board","Thickness":"3.5mm Rigid Substrate","Clip Mechanism":"High-Tension Rustproof Steel Clamp","Surface Finish":"Non-Porous Antibacterial Wipe-Clean"}',
  0,
  50,
  '["Writing Pad","Clipboard","Medinetix Healthcare","Hospital","Medical","Clinical Chart"]',
  '[]',
  'published',
  265,
  'Medinetix Healthcare Medical Equipment Custom Writing Pad | RR Foundations',
  'Custom clinical writing pad for Medinetix Healthcare with hygienic wipe-clean finish manufactured by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_writing-pads_04',
  'Puma Footwear Pvt. Ltd. Exclusive Footwear Writing Pad',
  'puma-footwear-pvt-ltd-exclusive-footwear-writing-pad',
  'RRF-WRITING-PADS_04',
  'writing-pads',
  'Writing Pads',
  'Retail dealership promotional writing pad manufactured for Puma Footwear Pvt. Ltd. displaying product line catalogue.',
  'Custom wholesale dealership writing pad manufactured for Puma Footwear Pvt. Ltd. (Abu Road, Rajasthan). Features high-contrast full-color product lineup showcase with complete company credentials, reinforced edges, and heavy-gauge steel document clip for order processing.',
  '/assets/products/writing-pad-puma-footwear.jpg',
  '["/assets/products/writing-pad-puma-footwear.jpg"]',
  '["High-Durability Acrylic / Rigid Board","Electroplated Steel Clip","Fade-Proof UV Print"]',
  '{"Company":"Puma Footwear Pvt. Ltd.","Product Type":"Dealer Catalogue Writing Pad / Order Pad","Thickness":"3.5mm Rigid Substrate","Clip Mechanism":"Heavy-Duty Chrome Wire Spring Clamp","Print Quality":"Full-Color Double-Pass UV Flatbed"}',
  0,
  50,
  '["Writing Pad","Clipboard","Puma Footwear","Footwear","Retail Merchandise","Order Pad"]',
  '[]',
  'published',
  266,
  'Puma Footwear Pvt. Ltd. Exclusive Footwear Writing Pad | RR Foundations',
  'Puma Footwear Pvt. Ltd. custom wholesale order writing pad with full-color catalogue print by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_writing-pads_05',
  'Triconix Wires & Cables Industrial Suraksha Writing Pad',
  'triconix-wires-cables-industrial-suraksha-writing-pad',
  'RRF-WRITING-PADS_05',
  'writing-pads',
  'Writing Pads',
  'Heavy-duty industrial promotional writing pad manufactured for Triconix Wires & Cables featuring Suraksha Zindagi Ki campaign.',
  'Engineered for industrial electrical contractors, distribution networks, and wholesale depots of Triconix Wires & Cables. Built to withstand rough job site conditions with impact-resistant rigid board backing and vibrant scratch-resistant UV flatbed printing.',
  '/assets/products/writing-pad-triconix-cables.jpg',
  '["/assets/products/writing-pad-triconix-cables.jpg"]',
  '["Industrial-Grade Rigid Composite / Acrylic","Heavy-Duty Wire Clip","Weather-Resistant UV Print"]',
  '{"Company":"Triconix Wires & Cables","Product Type":"Industrial Promotional Writing Pad / Site Board","Thickness":"3.5mm Rigid Substrate","Clip Mechanism":"Heavy-Duty Chrome Spring Clamp","Print Quality":"Scratch-Resistant Industrial UV Print"}',
  0,
  50,
  '["Writing Pad","Clipboard","Triconix","Wires & Cables","Industrial","Job Site Board"]',
  '[]',
  'published',
  267,
  'Triconix Wires & Cables Industrial Suraksha Writing Pad | RR Foundations',
  'Triconix Wires & Cables promotional industrial writing pad with Suraksha campaign print manufactured by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_crystal-keychain_01',
  'Multi-Shape Crystal Acrylic Keychain Assortment — Model CK-01',
  'multi-shape-crystal-acrylic-keychain-assortment-model-ck-01',
  'RRF-CRYSTAL-KEYCHAIN_01',
  'crystal-keychain',
  'Crystal Keychain',
  'Precision-molded optical crystal acrylic keychains with multi-shape branding inserts and heavy-duty split rings.',
  'Manufactured from ultra-transparent optical acrylic casting with snap-in graphics chambers. Features various classic geometric profiles including round, oval, rectangular, and arched bodies designed for institutional rollouts, corporate giveaways, and automotive dealerships.',
  '/assets/products/crystal-keychain-001.jpeg',
  '["/assets/products/crystal-keychain-001.jpeg"]',
  '["Optical Grade Cast Acrylic","High-Gloss Sealed Paper Insert","Nickel-Plated Steel Split Ring & Chain"]',
  '{"Profiles Available":"Round, Oval, Rectangle, Arched Contour","Ring Diameter":"25 mm Heavy Nickel Split Ring","Print Method":"Double-Sided 1200 DPI Photo Offset / UV Digital","Assembly":"Precision Ultrasonic / Snap-Fit Clear Window","Branding":"Double-Sided Custom Artwork & Contact Details"}',
  1,
  100,
  '["Crystal Keychain","Cryctal Keychain","Acrylic Keychain","Promotional Keychain","Plastic Keychain","Corporate Merchandise"]',
  '["cryctal-keychain-model-ck-01","crystal-keychain-model-ck-01"]',
  'published',
  268,
  'Multi-Shape Crystal Acrylic Keychain Assortment — Model CK-01 | Direct Manufacturer RR Foundations',
  'Precision-molded optical crystal acrylic keychains with multi-shape branding inserts. Direct factory pricing by RR Foundations New Delhi.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_crystal-keychain_02',
  'Corporate Branded Crystal Acrylic Keychain Collection — Model CK-02',
  'corporate-branded-crystal-acrylic-keychain-collection-model-ck-02',
  'RRF-CRYSTAL-KEYCHAIN_02',
  'crystal-keychain',
  'Crystal Keychain',
  'Crystal clear promotional acrylic keychains with vibrant dual-side corporate branding inserts.',
  'Engineered with shatter-resistant optical polystyrene and crystal acrylic providing maximum light transmission and clarity. Ideal for FMCG brand awareness campaigns, mobile app promotions, and automotive dealer distribution.',
  '/assets/products/crystal-keychain-002.jpeg',
  '["/assets/products/crystal-keychain-002.jpeg"]',
  '["Optical Grade Polystyrene & Acrylic","Double-Sided Coated Art Paper Insert","Tempered Steel O-Ring"]',
  '{"Shapes":"Square, Rectangle, Capsule Oval, Circle, Shield","Edge Finish":"Diamond Polished Clear Edge","Wall Thickness":"4.5 mm – 5.5 mm Solid Edge","Packaging":"Individual Scratch-Resistant Poly Pouch","Production Turnaround":"Bulk Dispatch within 3–5 Days"}',
  1,
  100,
  '["Crystal Keychain","Cryctal Keychain","Custom Keychain","FMCG Merchandise","Promotional Keyring"]',
  '["cryctal-keychain-model-ck-02","crystal-keychain-model-ck-02"]',
  'published',
  269,
  'Corporate Branded Crystal Acrylic Keychain Collection — Model CK-02 | RR Foundations',
  'Crystal clear promotional acrylic keychains with vibrant dual-side corporate inserts. Manufactured in New Delhi by RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_crystal-keychain_03',
  'Dual-Profile Commercial Crystal Keychain Set — Model CK-03',
  'dual-profile-commercial-crystal-keychain-set-model-ck-03',
  'RRF-CRYSTAL-KEYCHAIN_03',
  'crystal-keychain',
  'Crystal Keychain',
  'Sleek capsule-oval and notched-rectangle crystal keychains designed for delivery fleets and automotive tires.',
  'High-transparency promotional crystal keychains featuring moisture-sealed double-sided graphics chambers. Specially crafted for high-wear fleet environments, logistics operators, quick-commerce delivery fleets, and automotive tire brands.',
  '/assets/products/crystal-keychain-003.jpeg',
  '["/assets/products/crystal-keychain-003.jpeg"]',
  '["Clear Polycarbonate / Acrylic Core","UV-Resistant Poly Art Print","Heavy-Duty Swivel Jump Ring"]',
  '{"Profiles":"Capsule Oval (60x28mm) & Notched Rectangle (55x30mm)","Unit Weight":"14g – 16g per unit","Split Ring":"28 mm Chrome Plated Keyring","Usage":"Fleet Management, Quick Commerce, Automobile Accessories"}',
  1,
  100,
  '["Crystal Keychain","Cryctal Keychain","Automotive Keychain","Fleet Keyring","Logistics Merchandise"]',
  '["cryctal-keychain-model-ck-03","crystal-keychain-model-ck-03"]',
  'published',
  270,
  'Dual-Profile Commercial Crystal Keychain Set — Model CK-03 | Direct Manufacturer RR Foundations',
  'Sleek capsule-oval and notched-rectangle crystal keychains designed for delivery fleets and automotive brands. Factory direct pricing.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_crystal-keychain_04',
  'Industrial & Healthcare Crystal Keychain Trio — Model CK-04',
  'industrial-healthcare-crystal-keychain-trio-model-ck-04',
  'RRF-CRYSTAL-KEYCHAIN_04',
  'crystal-keychain',
  'Crystal Keychain',
  'Heavy-duty crystal keyrings with shield, rectangle, and round acrylic bodies for industrial and pharmaceutical branding.',
  'Built for building material manufacturers, pharmaceutical awareness campaigns, and automotive battery distributor networks. Encased in high-clarity scratch-resistant acrylic windows with rigid perimeter seals.',
  '/assets/products/crystal-keychain-004.jpeg',
  '["/assets/products/crystal-keychain-004.jpeg"]',
  '["High-Impact Acrylic","Gloss Coated Offset Card Insert","Steel Link Chain & Keyring"]',
  '{"Body Styles":"Classic Round (40mm), Slim Rectangle (50x24mm), Shield (48x32mm)","Chain Attachment":"4-Link Heavy Curb Chain + Tempered Split Ring","Double-Sided":"Yes, Dual Brand / Dealer Contact Space","Print Resolution":"Offset Micro-Dot High Definition Print"}',
  0,
  100,
  '["Crystal Keychain","Cryctal Keychain","Industrial Keychain","Pharma Merchandise","Battery Dealer Keychain"]',
  '["cryctal-keychain-model-ck-04","crystal-keychain-model-ck-04"]',
  'published',
  271,
  'Industrial & Healthcare Crystal Keychain Trio — Model CK-04 | RR Foundations',
  'Heavy-duty crystal keyrings with shield, rectangle, and round acrylic bodies for industrial and pharmaceutical branding. Direct manufacturer New Delhi.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_crystal-keychain_05',
  'Vibrant Yellow Oval Frame Crystal Keychain — Model CK-05',
  'vibrant-yellow-oval-frame-crystal-keychain-model-ck-05',
  'RRF-CRYSTAL-KEYCHAIN_05',
  'crystal-keychain',
  'Crystal Keychain',
  'Eye-catching canary yellow molded border with crystal-clear center display window for beverage and retail gifting.',
  'Combines an impact-resistant colored polymer outer border with a crystal clear viewing window on both sides. High-contrast framing accentuates company logos, FMCG tea/beverage branding, and distributor contact details.',
  '/assets/products/crystal-keychain-005.jpeg',
  '["/assets/products/crystal-keychain-005.jpeg"]',
  '["Colored High-Density Polymer Frame","Crystal Clear Acrylic Inlay","Tempered Nickel Split Ring"]',
  '{"Frame Color":"Signal Yellow (Custom PMS on Volume)","Window Size":"45 x 25 mm Oval Aperture","Overall Length":"85 mm including split ring","Branding Area":"Full Color Front & Back Graphic Insert"}',
  0,
  100,
  '["Crystal Keychain","Cryctal Keychain","Yellow Frame Keychain","FMCG Promotional Gifts","Retail Merchandise"]',
  '["cryctal-keychain-model-ck-05","crystal-keychain-model-ck-05"]',
  'published',
  272,
  'Vibrant Yellow Oval Frame Crystal Keychain — Model CK-05 | RR Foundations',
  'Canary yellow molded border with crystal-clear center display window for beverage and retail gifting. Direct factory pricing.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_crystal-keychain_06',
  'Contoured Gold-Tone Border Crystal Keychain — Model CK-06',
  'contoured-gold-tone-border-crystal-keychain-model-ck-06',
  'RRF-CRYSTAL-KEYCHAIN_06',
  'crystal-keychain',
  'Crystal Keychain',
  'Elegantly contoured yellow frame crystal keychain crafted for luxury jewelry showrooms and retail inaugurations.',
  'Featuring a distinct tapered contour border in radiant golden yellow, housing a double-sided crystal clear window. Ideal for jewelry house customer giveaways, wedding return gifts, festive retail promotions, and showroom celebrations.',
  '/assets/products/crystal-keychain-006.jpeg',
  '["/assets/products/crystal-keychain-006.jpeg"]',
  '["High-Gloss Polymer Housing","Ultra-Clear Acrylic Shield","Nickel Plated Steel O-Ring"]',
  '{"Overall Dimensions":"62 x 34 mm","Insert Window":"42 x 22 mm","Frame Color":"Golden Yellow Luster","Unit Weight":"18 grams","Customization":"Jewelry Logo Front + Address / Branch Info Back"}',
  0,
  100,
  '["Crystal Keychain","Cryctal Keychain","Jewellery Keychain","Golden Frame Keychain","Luxury Return Gift"]',
  '["cryctal-keychain-model-ck-06","crystal-keychain-model-ck-06"]',
  'published',
  273,
  'Contoured Gold-Tone Border Crystal Keychain — Model CK-06 | RR Foundations',
  'Elegantly contoured yellow frame crystal keychain crafted for luxury jewelry showrooms and festive promotions. Direct manufacturer.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_crystal-keychain_07',
  'Royal Blue Border Rectangle Crystal Keychain — Model CK-07',
  'royal-blue-border-rectangle-crystal-keychain-model-ck-07',
  'RRF-CRYSTAL-KEYCHAIN_07',
  'crystal-keychain',
  'Crystal Keychain',
  'Deep royal blue frame crystal keychain with rectangular viewing aperture for premium lifestyle and luxury jewelry brands.',
  'Engineered with a rich cobalt blue molded outer perimeter and high-transparency crystal lens. Protects fine micro-typography, brand logos, and showroom details against scratches, water drops, and daily pocket wear.',
  '/assets/products/crystal-keychain-007.jpeg',
  '["/assets/products/crystal-keychain-007.jpeg"]',
  '["Cobalt Blue Molded Resin","Optical Acrylic Front & Back","Nickel Jump Ring & Split Ring"]',
  '{"Dimensions":"58 x 30 mm","Border Color":"Cobalt Royal Blue","Attachment":"Reinforced Top Eyelet + Swivel Split Ring","Target Sectors":"Jewelry Boutiques, Luxury Lifestyle, Real Estate"}',
  0,
  100,
  '["Crystal Keychain","Cryctal Keychain","Blue Border Keychain","Luxury Design Keychain","Corporate Gifting"]',
  '["cryctal-keychain-model-ck-07","crystal-keychain-model-ck-07"]',
  'published',
  274,
  'Royal Blue Border Rectangle Crystal Keychain — Model CK-07 | RR Foundations',
  'Deep royal blue frame crystal keychain with rectangular viewing aperture for premium lifestyle and luxury jewelry brands. Factory direct.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_crystal-keychain_08',
  'Teardrop Clear Crystal Acrylic Keychain — Model CK-08',
  'teardrop-clear-crystal-acrylic-keychain-model-ck-08',
  'RRF-CRYSTAL-KEYCHAIN_08',
  'crystal-keychain',
  'Crystal Keychain',
  'All-transparent aerodynamic teardrop crystal keychain designed for motorcycle helmet and automotive accessory brands.',
  'Sleek aerodynamic teardrop profile manufactured from 100% virgin crystal clear acrylic. Features an integrated top mounting lug and sonically sealed dual-sided graphics chamber with radiused edges for effortless pocket slip.',
  '/assets/products/crystal-keychain-008.jpeg',
  '["/assets/products/crystal-keychain-008.jpeg"]',
  '["Virgin Optical Grade Acrylic","Synthetic Waterproof Graphic Film","Heavy Gauge Steel Ring"]',
  '{"Profile":"Aerodynamic Teardrop / Pear Shape","Dimensions":"60 x 38 mm","Edge Profile":"Full 360-Degree Radiused Smooth Edge","Recommended For":"Automotive, Helmet Dealers, Biker Clubs, Sports Brands"}',
  0,
  100,
  '["Crystal Keychain","Cryctal Keychain","Teardrop Keychain","Helmet Keychain","Automobile Keychain"]',
  '["cryctal-keychain-model-ck-08","crystal-keychain-model-ck-08"]',
  'published',
  275,
  'Teardrop Clear Crystal Acrylic Keychain — Model CK-08 | RR Foundations',
  'All-transparent aerodynamic teardrop crystal keychain designed for motorcycle helmet and automotive brands. Manufactured in New Delhi.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_crystal-keychain_09',
  'Transparent Oval Crystal Motorcycle Keychain — Model CK-09',
  'transparent-oval-crystal-motorcycle-keychain-model-ck-09',
  'RRF-CRYSTAL-KEYCHAIN_09',
  'crystal-keychain',
  'Crystal Keychain',
  'Precision oval transparent crystal keychain engineered for automotive showrooms, two-wheeler keys, and bike launches.',
  'Classic oval crystal acrylic keychain offering exceptional clarity and scratch resistance. Designed to comfortably fit inside motorcycle ignition wells without scratching adjacent instrument dials or painted petrol tanks.',
  '/assets/products/crystal-keychain-009.jpeg',
  '["/assets/products/crystal-keychain-009.jpeg"]',
  '["Clear Impact-Modified Acrylic","UV Printed Photographic Insert","Reinforced Nickel Key Loop"]',
  '{"Dimensions":"65 x 30 mm","Shape":"Elongated Oval","Ring Spec":"25 mm Heavy Spring Ring with Solid Eyelet","Customization":"Motorcycle Model, Showroom Name & 24x7 Roadside Assistance Info"}',
  0,
  100,
  '["Crystal Keychain","Cryctal Keychain","Bike Keychain","Motorcycle Keychain","Two Wheeler Keychain"]',
  '["cryctal-keychain-model-ck-09","crystal-keychain-model-ck-09"]',
  'published',
  276,
  'Transparent Oval Crystal Motorcycle Keychain — Model CK-09 | RR Foundations',
  'Precision oval transparent crystal keychain engineered for automotive showrooms, two-wheeler keys, and bike launches. Factory direct.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);
INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category_id`, `category_name`, `short_description`, `full_description`, `thumbnail`, `images`, `materials`, `specifications`, `featured`, `min_quantity`, `tags`, `aliases`, `status`, `display_order`, `seo_title`, `seo_description`)
VALUES (
  'prod_crystal-keychain_010',
  'Scarlet Red Border Crystal Keychain — Model CK-10',
  'scarlet-red-border-crystal-keychain-model-ck-10',
  'RRF-CRYSTAL-KEYCHAIN_010',
  'crystal-keychain',
  'Crystal Keychain',
  'High-visibility crimson red frame crystal keychain designed for food delivery fleets and restaurant partners.',
  'Vibrant scarlet red frame providing maximum pocket and counter visibility. Fitted with an ultra-clear snap-in acrylic window for full-color partner branding, promotional QR codes, and delivery rider fleet identifications.',
  '/assets/products/crystal-keychain-010.jpeg',
  '["/assets/products/crystal-keychain-010.jpeg"]',
  '["Impact-Grade Scarlet Polymer","Scratch-Resistant Acrylic Window","Chrome Plated Key Ring"]',
  '{"Dimensions":"60 x 32 mm","Frame Finish":"Bright Red (Pantone 186 C Matched)","Insert Area":"45 x 22 mm Double-Sided Window","Applications":"Food Delivery, Logistics, Courier Services, Restaurant Brands"}',
  0,
  100,
  '["Crystal Keychain","Cryctal Keychain","Red Frame Keychain","Delivery Fleet Keychain","Quick Commerce Merchandise"]',
  '["cryctal-keychain-model-ck-10","crystal-keychain-model-ck-10"]',
  'published',
  277,
  'Scarlet Red Border Crystal Keychain — Model CK-10 | RR Foundations',
  'High-visibility crimson red frame crystal keychain designed for food delivery fleets and restaurant partners. Direct manufacturer RR Foundations.'
)
ON DUPLICATE KEY UPDATE 
  `title` = VALUES(`title`),
  `short_description` = VALUES(`short_description`),
  `full_description` = VALUES(`full_description`),
  `thumbnail` = VALUES(`thumbnail`);

-- 3. Insert Existing Leads (5 customer records)
INSERT INTO `leads` (`id`, `full_name`, `company_name`, `email`, `phone`, `product_name`, `category`, `quantity`, `message`, `status`, `created_at`)
VALUES (
  'enq_1793702130962_6z3qp',
  'Test Procurement Manager',
  'Apex Enterprises',
  'test@apex.example',
  '+919876543210',
  'Customized Metal Name Badges',
  NULL,
  '500',
  'Requesting sample proof and bulk quotation.',
  'New',
  '2026-11-03 10:35:30'
)
ON DUPLICATE KEY UPDATE `status` = VALUES(`status`);
INSERT INTO `leads` (`id`, `full_name`, `company_name`, `email`, `phone`, `product_name`, `category`, `quantity`, `message`, `status`, `created_at`)
VALUES (
  'enq_1793704269539_44nt6',
  'B2B Procurement Director',
  'Heritage Hotels Group',
  'procurement@heritagehotels.example',
  '+919876543210',
  'Customized Metal Name Badges',
  NULL,
  '1000',
  'Requesting antique copper badge pin samples with custom laser engraved logo.',
  'New',
  '2026-11-03 11:11:09'
)
ON DUPLICATE KEY UPDATE `status` = VALUES(`status`);
INSERT INTO `leads` (`id`, `full_name`, `company_name`, `email`, `phone`, `product_name`, `category`, `quantity`, `message`, `status`, `created_at`)
VALUES (
  'enq_1793775590308_id154',
  'Test Procurement Officer',
  NULL,
  'procurement@corporate.test',
  '+91 98765 43210',
  'Custom Precision Metal Badge Pin',
  'metal-badges',
  '500 units',
  'Testing automated B2B quote request verification.',
  'New',
  '2026-11-04 06:59:50'
)
ON DUPLICATE KEY UPDATE `status` = VALUES(`status`);
INSERT INTO `leads` (`id`, `full_name`, `company_name`, `email`, `phone`, `product_name`, `category`, `quantity`, `message`, `status`, `created_at`)
VALUES (
  'enq_1793776664635_qkynn',
  'Direct QA Tester',
  NULL,
  'qa@rrfoundations.org',
  '+91 99999 11111',
  'Traditional Divine Photo Frame',
  'photo-frames-awards',
  '250 units',
  'Controlled QA test of customer enquiry submission.',
  'New',
  '2026-11-04 07:17:44'
)
ON DUPLICATE KEY UPDATE `status` = VALUES(`status`);
INSERT INTO `leads` (`id`, `full_name`, `company_name`, `email`, `phone`, `product_name`, `category`, `quantity`, `message`, `status`, `created_at`)
VALUES (
  'enq_1793777008105_i5mb9',
  'Final Verification User',
  NULL,
  'verification@corporate.test',
  '+91 98765 43210',
  'Verified Badge Pin',
  'badges-lapel-pins',
  '500',
  'Final verified deployment check.',
  'New',
  '2026-11-04 07:23:28'
)
ON DUPLICATE KEY UPDATE `status` = VALUES(`status`);

-- 4. Insert Website Settings
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('company_name', 'RR Foundations', 'general')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('legal_name', 'RR Foundations & Manufacturing Solutions', 'general')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('tagline', 'Manufacturing Ideas Into Products That Matter', 'general')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('email', 'help@rrfoundation.org', 'contact')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('phone', '+91 74280 45813', 'contact')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('phone_raw', '917428045813', 'contact')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('address', 'Shop No. 12, Om Vihar, Opposite Metro Pillar No. 702, New Delhi – 110059, India', 'contact')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('hours', 'Monday to Friday, 9:00 AM – 6:00 PM IST', 'contact')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('website', 'https://solutions.rrfoundations.org', 'general')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('logo_url', '/assets/rr_logo_white.png', 'branding')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('favicon_url', '/favicon.ico', 'branding')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('meta_title', 'RR Foundations | Premium B2B Manufacturing & Custom Products', 'seo')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);
INSERT INTO `website_settings` (`setting_key`, `setting_value`, `setting_group`)
VALUES ('meta_description', 'Direct physical manufacturing of precision metal badges, conference ID card kits, custom acrylic & MDF products, corporate drinkware, and executive gift hampers in New Delhi.', 'seo')
ON DUPLICATE KEY UPDATE `setting_value` = VALUES(`setting_value`);

-- 5. Initial Superadmin Account
-- Email: admin@rrfoundations.org
-- Temporary Demo Password: Admin@RR2026!
INSERT INTO `admins` (`id`, `email`, `password_hash`, `full_name`, `role`, `status`, `created_at`)
VALUES (1, 'admin@rrfoundations.org', '$2y$10$WYMjysb2WpbleNEdLCtLCOew.4yV4Tk7kSCLo.NK4/Skm/.muNsBC', 'Executive Administrator', 'superadmin', 'active', NOW())
ON DUPLICATE KEY UPDATE `password_hash` = VALUES(`password_hash`), `status` = 'active';

SET FOREIGN_KEY_CHECKS = 1;
