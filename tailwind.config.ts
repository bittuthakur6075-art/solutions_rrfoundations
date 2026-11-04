import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        forest: {
          DEFAULT: "#102A25",
          950: "#0B1D19",
          900: "#102A25", // Primary background
          850: "#172B27", // Secondary background
          800: "#203A33", // Dark surface
          700: "#294840",
          600: "#365A51",
          100: "#E3ECE9",
          50: "#F0F5F3",
        },
        gold: {
          DEFAULT: "#D9B878", // Champagne gold
          hover: "#E8CB8D", // Gold hover
          light: "#F5EADA",
          dark: "#B89650",
          border: "rgba(217, 184, 120, 0.4)",
        },
        champagne: {
          DEFAULT: "#D9B878",
          hover: "#E8CB8D",
          light: "#F5EADA",
          dark: "#B89650",
        },
        ivory: {
          DEFAULT: "#F7F4EE", // Warm ivory
          canvas: "#F7F4EE",
          surface: "#FFFFFF",
          muted: "#EDE7DA",
        },
        darktext: {
          primary: "#182A25",
          secondary: "#5C6E66",
        },
        text: {
          primary: "#FFFFFF",
          secondary: "#AAB8B0",
          dark: "#182A25",
          muted: "#7E9188",
        },
        border: {
          dark: "rgba(255, 255, 255, 0.16)",
          gold: "rgba(217, 184, 120, 0.35)",
          light: "#E8E2D7",
        },
      },
      fontFamily: {
        serif: ["var(--font-playfair)", "var(--font-cormorant)", "Georgia", "serif"],
        display: ["var(--font-playfair)", "Georgia", "serif"],
        heading: ["var(--font-manrope)", "sans-serif"],
        sans: ["var(--font-inter)", "sans-serif"],
      },
      boxShadow: {
        luxury: "0 24px 48px -12px rgba(11, 29, 25, 0.35)",
        gold: "0 8px 24px -4px rgba(217, 184, 120, 0.25)",
        card: "0 4px 16px -2px rgba(16, 42, 37, 0.08)",
        elevated: "0 12px 32px -6px rgba(16, 42, 37, 0.16)",
      },
    },
  },
  plugins: [],
};

export default config;
