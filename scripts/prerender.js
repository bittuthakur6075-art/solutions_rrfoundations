const fs = require('fs');
const path = require('path');

const distDir = path.join(__dirname, '../dist');
const template = fs.readFileSync(path.join(distDir, 'index.html'), 'utf8');

// Parse products
const prodCode = fs.readFileSync(path.join(__dirname, '../lib/data/products.ts'), 'utf8')
  .replace(/import\s+.*?;/g, '')
  .replace(/export\s+const\s+PRODUCTS:\s*Product\[\]\s*=\s*/, 'const PRODUCTS = ') + '; module.exports = PRODUCTS;';
const products = eval(prodCode);

const baseUrl = 'https://solutions.rrfoundations.org';

const coreRoutes = [
  {
    path: 'about',
    title: 'About Us | Factory Heritage & B2B Manufacturing | RR Foundations',
    description: 'Direct manufacturer of precision metal badges, corporate merchandise, and institutional accessories based in New Delhi, India.',
    canonical: `${baseUrl}/about`,
    schema: {
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": [
        { "@type": "ListItem", "position": 1, "name": "Home", "item": baseUrl },
        { "@type": "ListItem", "position": 2, "name": "About Us", "item": `${baseUrl}/about` }
      ]
    }
  },
  {
    path: 'products',
    title: 'Product Catalogue | Verified Factory Inventory | RR Foundations',
    description: 'Explore 260+ physical products manufactured in New Delhi: precision metal badges, conference ID card kits, custom acrylic & MDF products, corporate drinkware, and writing instruments.',
    canonical: `${baseUrl}/products`,
    schema: {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": "RR Foundations B2B Product Catalogue",
      "description": "Full catalogue of verified in-house manufactured physical products and custom promotional items.",
      "url": `${baseUrl}/products`
    }
  },
  {
    path: 'manufacturing',
    title: 'Manufacturing Capabilities | RR Foundations',
    description: 'Cinematic overview of our in-house laser cutting, UV printing, CNC routing, and hydraulic metal die-stamping lines in New Delhi.',
    canonical: `${baseUrl}/manufacturing`
  },
  {
    path: 'industries',
    title: 'Industries We Serve | RR Foundations',
    description: 'Products that fit your industry. Solutions that fit your needs. Customised corporate merchandise, institutional accessories, event kits, and bulk manufacturing across 9 key sectors.',
    canonical: `${baseUrl}/industries`
  },
  {
    path: 'contact',
    title: 'Contact Us | Factory Workshop & Office | RR Foundations',
    description: 'Connect directly with our engineering and manufacturing desk in New Delhi. Phone: +91 74280 45813, Email: help@rrfoundation.org. Shop No. 12, Om Vihar, New Delhi.',
    canonical: `${baseUrl}/contact`,
    schema: {
      "@context": "https://schema.org",
      "@type": "ContactPage",
      "name": "Contact RR Foundations",
      "url": `${baseUrl}/contact`
    }
  },
  {
    path: 'request-quote',
    title: 'Request a Bulk Quote | Custom B2B Manufacturing RFQ | RR Foundations',
    description: 'Submit custom product specifications and request direct factory pricing for precision metal badges, conference ID kits, acrylic awards, and corporate gifting.',
    canonical: `${baseUrl}/request-quote`
  },
  {
    path: 'privacy-policy',
    title: 'Privacy Policy | RR Foundations',
    description: 'Privacy policy and client data handling commitments for RR Foundations.',
    canonical: `${baseUrl}/privacy-policy`
  },
  {
    path: 'terms-and-conditions',
    title: 'Terms and Conditions | RR Foundations',
    description: 'Commercial and manufacturing terms and conditions for RR Foundations.',
    canonical: `${baseUrl}/terms-and-conditions`
  }
];

function injectMetadata(html, route) {
  let output = html;
  output = output.replace(/<title>.*?<\/title>/, `<title>${route.title}</title>`);
  output = output.replace(/<meta\s+name="description"[\s\S]*?\/>/, `<meta name="description" content="${route.description.replace(/"/g, '&quot;')}" />`);

  const headAdditions = `
    <link rel="canonical" href="${route.canonical}" />
    <meta property="og:title" content="${route.title.replace(/"/g, '&quot;')}" />
    <meta property="og:description" content="${route.description.replace(/"/g, '&quot;')}" />
    <meta property="og:url" content="${route.canonical}" />
    ${route.ogImage ? `<meta property="og:image" content="${route.ogImage}" />` : ''}
    ${route.schema ? `<script type="application/ld+json">${JSON.stringify(route.schema)}</script>` : ''}
  `;
  return output.replace('</head>', `${headAdditions}\n  </head>`);
}

// 1. Prerender Core Static Pages
coreRoutes.forEach(route => {
  const targetDir = path.join(distDir, route.path);
  if (!fs.existsSync(targetDir)) {
    fs.mkdirSync(targetDir, { recursive: true });
  }
  const prerendered = injectMetadata(template, route);
  fs.writeFileSync(path.join(targetDir, 'index.html'), prerendered, 'utf8');
});
console.log(`Prerendered ${coreRoutes.length} core static routes.`);

// 2. Prerender All 268 Product Routes
let productCount = 0;
products.forEach(prod => {
  const targetDir = path.join(distDir, 'products', prod.slug);
  if (!fs.existsSync(targetDir)) {
    fs.mkdirSync(targetDir, { recursive: true });
  }

  const title = prod.seoTitle || `${prod.title} | Direct Manufacturer RR Foundations`;
  const description = prod.seoDescription || `${prod.shortDescription} Manufactured in New Delhi by RR Foundations with certified materials.`;
  const canonical = `${baseUrl}/products/${prod.slug}`;
  const ogImage = `${baseUrl}${prod.thumbnail}`;

  const schema = {
    "@context": "https://schema.org",
    "@type": "Product",
    "name": prod.title,
    "image": ogImage,
    "description": prod.shortDescription,
    "category": prod.categoryName,
    "brand": {
      "@type": "Brand",
      "name": "RR Foundations"
    },
    "manufacturer": {
      "@type": "Organization",
      "name": "RR Foundations",
      "telephone": "+91 74280 45813",
      "address": "Shop No. 12, Om Vihar, Opposite Metro Pillar No. 702, New Delhi – 110059, India"
    },
    "offers": {
      "@type": "Offer",
      "priceCurrency": "INR",
      "price": "0",
      "priceValidUntil": "2027-12-31",
      "availability": "https://schema.org/InStock",
      "url": canonical
    }
  };

  const prerendered = injectMetadata(template, {
    title,
    description,
    canonical,
    ogImage,
    schema
  });

  fs.writeFileSync(path.join(targetDir, 'index.html'), prerendered, 'utf8');
  productCount++;
});

console.log(`Prerendered ${productCount} individual product catalogue routes in dist/products/<slug>/index.html.`);
console.log('Complete static route prerendering finished for Hostinger Premium Web Hosting.');
