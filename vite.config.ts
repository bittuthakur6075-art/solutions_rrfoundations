import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import path from "path";

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./"),
      "next/image": path.resolve(__dirname, "./components/ui/Image.tsx"),
      "next/link": path.resolve(__dirname, "./components/ui/Link.tsx"),
      "next/navigation": path.resolve(__dirname, "./components/ui/Navigation.tsx"),
    },
  },
  build: {
    outDir: "dist",
    emptyOutDir: true,
    sourcemap: false,
  },
  server: {
    port: 5173,
  },
});
