import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import path from "path";
// @ts-ignore
import viteApiMockPlugin from "./scripts/vite_dev_server_plugin.js";

export default defineConfig({
  plugins: [react(), viteApiMockPlugin()],
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
    port: 3000,
  },
  preview: {
    port: 3000,
  },
});
