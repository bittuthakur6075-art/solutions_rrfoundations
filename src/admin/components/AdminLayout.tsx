import React, { useState } from "react";
import { Outlet, Navigate } from "react-router-dom";
import { AdminSidebar } from "./AdminSidebar";
import { AdminHeader } from "./AdminHeader";
import { useAdminAuth } from "../context/AdminAuthContext";
import { Loader2 } from "lucide-react";

export function AdminLayout() {
  const { isAuthenticated, isLoading } = useAdminAuth();
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  if (isLoading) {
    return (
      <div className="min-h-screen bg-[#F7F4EE] flex flex-col items-center justify-center">
        <div className="w-12 h-12 rounded-2xl bg-[#102A25] flex items-center justify-center text-[#D9B878] mb-4 shadow-lg border border-[#D9B878]/30">
          <Loader2 className="w-6 h-6 animate-spin" />
        </div>
        <div className="font-heading font-bold text-sm tracking-widest text-[#102A25] uppercase">
          RR FOUNDATIONS CMS
        </div>
        <p className="text-xs text-neutral-500 mt-1">Verifying administrator session...</p>
      </div>
    );
  }

  if (!isAuthenticated) {
    return <Navigate to="/admin/login" replace />;
  }

  return (
    <div className="min-h-screen bg-[#F7F4EE] flex text-neutral-800 antialiased font-sans">
      {/* Fixed Sidebar */}
      <AdminSidebar
        isOpen={mobileMenuOpen}
        onClose={() => setMobileMenuOpen(false)}
      />

      {/* Main Container */}
      <div className="flex-1 flex flex-col lg:pl-64 min-w-0">
        <AdminHeader onMenuToggle={() => setMobileMenuOpen((prev) => !prev)} />
        <main className="flex-1 p-4 sm:p-6 lg:p-8 max-w-7xl w-full mx-auto">
          <Outlet />
        </main>
      </div>
    </div>
  );
}
