const fs = require('fs');
const path = require('path');

const distDir = path.join(__dirname, '../dist');
const template = fs.readFileSync(path.join(distDir, 'index.html'), 'utf8');

const routes = [
  {
    path: 'about',
    title: 'About Us | Factory Heritage & B2B Manufacturing | RR Foundations',
    description: 'Direct manufacturer of precision metal badges, corporate merchandise, and institutional accessories based in New Delhi, India.',
    canonical: 'https://solutions.rrfoundations.org/about',
    schema: {
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": [
        { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://solutions.rrfoundations.org" },
        { "@type": "ListItem", "position": 2, "name": "About Us", "item": "https://solutions.rrfoundations.org/about" }
      ]
    }
  },
  {
    path: 'products',
    title: 'Product Catalogue | Verified Factory Inventory | RR Foundations',
    description: 'Explore 260+ physical products manufactured in New Delhi: precision metal badges, conference ID card kits, custom acrylic & MDF products, corporate drinkware, and writing instruments.',
    canonical: 'https://solutions.rrfoundations.org/products',
    schema: {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": "RR Foundations B2B Product Catalogue",
      "description": "Full catalogue of verified in-house manufactured physical products and custom promotional items.",
      "url": "https://solutions.rrfoundations.org/products"
    }
  },
  {
    path: 'manufacturing',
    title: 'Manufacturing Capabilities | RR Foundations',
    description: 'Cinematic overview of our in-house laser cutting, UV printing, CNC routing, and hydraulic metal die-stamping lines in New Delhi.',
    canonical: 'https://solutions.rrfoundations.org/manufacturing'
  },
  {
    path: 'industries',
    title: 'Industries We Serve | RR Foundations',
    description: 'Products that fit your industry. Solutions that fit your needs. Customised corporate merchandise, institutional accessories, event kits, and bulk manufacturing across 9 key sectors.',
    canonical: 'https://solutions.rrfoundations.org/industries'
  },
  {
    path: 'contact',
    title: 'Contact Us | Factory Workshop & Office | RR Foundations',
    description: 'Connect directly with our engineering and manufacturing desk in New Delhi. Phone: +91 74280 45813, Email: help@rrfoundation.org. Shop No. 12, Om Vihar, New Delhi.',
    canonical: 'https://solutions.rrfoundations.org/contact',
    schema: {
      "@context": "https://schema.org",
      "@type": "ContactPage",
      "name": "Contact RR Foundations",
      "url": "https://solutions.rrfoundations.org/contact"
    }
  },
  {
    path: 'request-quote',
    title: 'Request a Bulk Quote | Custom B2B Manufacturing RFQ | RR Foundations',
    description: 'Submit custom product specifications and request direct factory pricing for precision metal badges, conference ID kits, acrylic awards, and corporate gifting.',
    canonical: 'https://solutions.rrfoundations.org/request-quote'
  },
  {
    path: 'privacy-policy',
    title: 'Privacy Policy | RR Foundations',
    description: 'Privacy policy and client data handling commitments for RR Foundations.',
    canonical: 'https://solutions.rrfoundations.org/privacy-policy'
  },
  {
    path: 'terms-and-conditions',
    title: 'Terms and Conditions | RR Foundations',
    description: 'Commercial and manufacturing terms and conditions for RR Foundations.',
    canonical: 'https://solutions.rrfoundations.org/terms-and-conditions'
  }
];

routes.forEach(route => {
  const targetDir = path.join(distDir, route.path);
  if (!fs.existsSync(targetDir)) {
    fs.mkdirSync(targetDir, { recursive: true });
  }

  let html = template;
  html = html.replace(/<title>.*?<\/title>/, `<title>${route.title}</title>`);
  html = html.replace(/<meta\s+name="description"[\s\S]*?\/>/, `<meta name="description" content="${route.description}" />`);

  // Inject canonical and structured data
  const headAdditions = `
    <link rel="canonical" href="${route.canonical}" />
    <meta property="og:title" content="${route.title}" />
    <meta property="og:description" content="${route.description}" />
    <meta property="og:url" content="${route.canonical}" />
    ${route.schema ? `<script type="application/ld+json">${JSON.stringify(route.schema)}</script>` : ''}
  `;
  html = html.replace('</head>', `${headAdditions}\n  </head>`);

  fs.writeFileSync(path.join(targetDir, 'index.html'), html, 'utf8');
  console.log(`Prerendered: dist/${route.path}/index.html`);
});

console.log('Static route prerendering complete for Hostinger.');
