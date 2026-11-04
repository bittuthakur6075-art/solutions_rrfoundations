import type { Metadata } from "next";
import { Manrope, Inter, Playfair_Display } from "next/font/google";
import "./globals.css";
import { Header } from "@/components/layout/Header";
import { Footer } from "@/components/layout/Footer";
import { WhatsAppButton } from "@/components/ui/WhatsAppButton";
import { COMPANY_INFO } from "@/lib/utils";

const manrope = Manrope({
  subsets: ["latin"],
  variable: "--font-manrope",
  display: "swap",
  weight: ["400", "500", "600", "700", "800"],
});

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
  display: "swap",
  weight: ["400", "500", "600"],
});

const playfair = Playfair_Display({
  subsets: ["latin"],
  variable: "--font-playfair",
  display: "swap",
  weight: ["400", "500", "600", "700"],
  style: ["normal", "italic"],
});

export const metadata: Metadata = {
  metadataBase: new URL(COMPANY_INFO.website),
  title: {
    default: "RR Foundations | Premium B2B Manufacturing & Custom Products",
    template: "%s | RR Foundations",
  },
  description:
    "Direct physical manufacturing of precision metal badges, conference ID card kits, custom acrylic & MDF products, corporate drinkware, and executive gift hampers in New Delhi.",
  keywords: [
    "RR Foundations",
    "Metal badges manufacturer",
    "Copper badge pin",
    "Lanyards supplier Delhi",
    "ID card kits",
    "Corporate drinkware",
    "Executive gifting New Delhi",
    "Direct physical manufacturer India",
  ],
  authors: [{ name: "RR Foundations" }],
  openGraph: {
    title: "RR Foundations | Manufacturing Ideas Into Products That Matter",
    description: "Premium B2B manufacturing and custom physical product solutions. New Delhi.",
    url: COMPANY_INFO.website,
    siteName: "RR Foundations",
    images: [
      {
        url: "/assets/hero_composition.jpg",
        width: 1200,
        height: 630,
        alt: "RR Foundations Premium Branded Merchandise",
      },
    ],
    locale: "en_IN",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={`${manrope.variable} ${inter.variable} ${playfair.variable} scroll-smooth`}
    >
      <body className="min-h-screen flex flex-col bg-forest-900 text-text-primary antialiased font-sans selection:bg-gold selection:text-forest-950">
        <Header />
        <main className="flex-1">{children}</main>
        <Footer />
        <WhatsAppButton />
      </body>
    </html>
  );
}
