/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  transpilePackages: ["tailwind-merge", "clsx"],
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "horizons-cdn.hostinger.com",
      },
      {
        protocol: "https",
        hostname: "images.hostinger.com",
      },
      {
        protocol: "https",
        hostname: "images.unsplash.com",
      },
    ],
  },
  async redirects() {
    return [
      {
        source: "/store",
        destination: "/products",
        permanent: true,
      },
      {
        source: "/why-us",
        destination: "/about",
        permanent: true,
      },
      {
        source: "/campaigns",
        destination: "/industries",
        permanent: true,
      },
      // 301 Permanent Redirects for Archived Duplicate Products to Canonical Targets
      {
        source: "/products/traditional-divine-corporate-photo-frame-model-fr-02",
        destination: "/products#traditional-divine-corporate-photo-frame-model-fr-01",
        permanent: true,
      },
      {
        source: "/products/traditional-divine-corporate-photo-frame-model-fr-03",
        destination: "/products#traditional-divine-corporate-photo-frame-model-fr-01",
        permanent: true,
      },
      {
        source: "/products/traditional-divine-corporate-photo-frame-model-fr-09",
        destination: "/products#traditional-divine-corporate-photo-frame-model-fr-08",
        permanent: true,
      },
      {
        source: "/products/custom-precision-badge-pin-model-bd-02",
        destination: "/products#custom-precision-badge-pin-model-bd-01",
        permanent: true,
      },
      {
        source: "/products/custom-die-struck-metal-acrylic-keychain-model-kc-17",
        destination: "/products#custom-die-struck-metal-acrylic-keychain-model-kc-15",
        permanent: true,
      },
      // Legacy API Product URL redirects to active canonical categories / items
      {
        source: "/products/copper-badge-pin-circular-with-clasp",
        destination: "/products#custom-precision-badge-pin-model-bd-01",
        permanent: true,
      },
      {
        source: "/products/copper-safety-pin-badge-circular",
        destination: "/products#custom-precision-badge-pin-model-bd-01",
        permanent: true,
      },
      {
        source: "/products/customized-metal-name-badges",
        destination: "/products#custom-precision-badge-pin-model-bd-01",
        permanent: true,
      },
      {
        source: "/products/executive-promotional-clipboards",
        destination: "/products#heavy-duty-examination-writing-pad-model-eb-01",
        permanent: true,
      },
      {
        source: "/products/event-conference-id-card-kits",
        destination: "/products#custom-sublimation-satin-lanyard-id-kit-model-ln-01",
        permanent: true,
      },
      {
        source: "/products/branded-corporate-gift-hampers",
        destination: "/products#executive-metallic-ballpoint-pen-model-pn-01",
        permanent: true,
      },
    ];
  },
};

export default nextConfig;
