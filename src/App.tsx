import React from "react";
import { Routes, Route } from "react-router-dom";
import { Header } from "@/components/layout/Header";
import { Footer } from "@/components/layout/Footer";
import { WhatsAppButton } from "@/components/ui/WhatsAppButton";
import { ScrollToTop } from "@/components/ui/ScrollToTop";

// Pages
import HomePage from "@/src/pages/HomePage";
import AboutPage from "@/src/pages/AboutPage";
import ProductsPage from "@/src/pages/ProductsPage";
import ManufacturingPage from "@/src/pages/ManufacturingPage";
import IndustriesPage from "@/src/pages/IndustriesPage";
import ContactPage from "@/src/pages/ContactPage";
import RequestQuotePage from "@/src/pages/RequestQuotePage";
import PrivacyPolicyPage from "@/src/pages/PrivacyPolicyPage";
import TermsPage from "@/src/pages/TermsPage";
import NotFoundPage from "@/src/pages/NotFoundPage";

export function App() {
  return (
    <div className="min-h-screen flex flex-col bg-[#102A25] text-white antialiased font-sans selection:bg-[#D9B878] selection:text-[#0B1D19]">
      <ScrollToTop />
      <Header />
      <main className="flex-1">
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/about" element={<AboutPage />} />
          <Route path="/products" element={<ProductsPage />} />
          <Route path="/products/:slug" element={<ProductsPage />} />
          <Route path="/manufacturing" element={<ManufacturingPage />} />
          <Route path="/industries" element={<IndustriesPage />} />
          <Route path="/contact" element={<ContactPage />} />
          <Route path="/request-quote" element={<RequestQuotePage />} />
          <Route path="/privacy-policy" element={<PrivacyPolicyPage />} />
          <Route path="/terms-and-conditions" element={<TermsPage />} />
          {/* Legacy / Alias Redirects */}
          <Route path="/store" element={<ProductsPage />} />
          <Route path="/why-us" element={<AboutPage />} />
          <Route path="/campaigns" element={<IndustriesPage />} />
          {/* Fallback 404 */}
          <Route path="*" element={<NotFoundPage />} />
        </Routes>
      </main>
      <Footer />
      <WhatsAppButton />
    </div>
  );
}

export default App;
