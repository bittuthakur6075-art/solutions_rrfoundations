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
    ];
  },
};

export default nextConfig;
