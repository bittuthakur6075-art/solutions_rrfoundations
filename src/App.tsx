import React from "react";
import { Routes, Route, useLocation } from "react-router-dom";
import { Header } from "@/components/layout/Header";
import { Footer } from "@/components/layout/Footer";
import { WhatsAppButton } from "@/components/ui/WhatsAppButton";
import { ScrollToTop } from "@/components/ui/ScrollToTop";

// Public Pages
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

// Admin Context & Layout
import { AdminAuthProvider } from "./admin/context/AdminAuthContext";
import { ToastProvider } from "./admin/components/Toast";
import { AdminLayout } from "./admin/components/AdminLayout";

// Admin Pages
import { AdminLoginPage } from "./admin/pages/AdminLoginPage";
import { AdminDashboardPage } from "./admin/pages/AdminDashboardPage";
import { AdminProductsPage } from "./admin/pages/AdminProductsPage";
import { AdminCategoriesPage } from "./admin/pages/AdminCategoriesPage";
import { AdminLeadsPage } from "./admin/pages/AdminLeadsPage";
import { AdminMediaPage } from "./admin/pages/AdminMediaPage";
import { AdminSeoPage } from "./admin/pages/AdminSeoPage";
import { AdminSettingsPage } from "./admin/pages/AdminSettingsPage";
import { AdminLogsPage } from "./admin/pages/AdminLogsPage";
import { AdminProfilePage } from "./admin/pages/AdminProfilePage";

export function App() {
  const location = useLocation();
  const isAdminRoute = location.pathname.startsWith("/admin");

  // Isolated Admin Panel Shell (B2B SaaS experience, independent from public storefront)
  if (isAdminRoute) {
    return (
      <ToastProvider>
        <AdminAuthProvider>
          <Routes>
            <Route path="/admin/login" element={<AdminLoginPage />} />
            <Route path="/admin" element={<AdminLayout />}>
              <Route index element={<AdminDashboardPage />} />
              <Route path="products" element={<AdminProductsPage />} />
              <Route path="categories" element={<AdminCategoriesPage />} />
              <Route path="leads" element={<AdminLeadsPage />} />
              <Route path="media" element={<AdminMediaPage />} />
              <Route path="seo" element={<AdminSeoPage />} />
              <Route path="settings" element={<AdminSettingsPage />} />
              <Route path="logs" element={<AdminLogsPage />} />
              <Route path="profile" element={<AdminProfilePage />} />
            </Route>
            <Route path="/admin/*" element={<NotFoundPage />} />
          </Routes>
        </AdminAuthProvider>
      </ToastProvider>
    );
  }

  // Production Public Storefront (Preserved 100% identically with brand header & footer)
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
