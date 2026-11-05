import React, { useState } from "react";
import { Link, useLocation } from "react-router-dom";
import {
  Menu,
  UploadCloud,
  Check,
  Loader2,
  ExternalLink,
  User,
  Shield,
  LogOut,
  ChevronDown,
} from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";
import { useToast } from "./Toast";

export function AdminHeader({
  onMenuToggle,
}: {
  onMenuToggle: () => void;
}) {
  const location = useLocation();
  const { admin, csrfToken, logout } = useAdminAuth();
  const toast = useToast();
  const [publishing, setPublishing] = useState(false);
  const [userMenuOpen, setUserMenuOpen] = useState(false);

  // Derive breadcrumb
  const getPageInfo = () => {
    const path = location.pathname;
    if (path === "/admin" || path === "/admin/") return { title: "Dashboard", crumb: "Operations" };
    if (path.startsWith("/admin/products")) return { title: "Product Management", crumb: "Catalogue" };
    if (path.startsWith("/admin/categories")) return { title: "Category Management", crumb: "Taxonomy" };
    if (path.startsWith("/admin/leads")) return { title: "Leads & Enquiries", crumb: "CRM" };
    if (path.startsWith("/admin/media")) return { title: "Media Library", crumb: "Assets" };
    if (path.startsWith("/admin/seo")) return { title: "SEO Management", crumb: "Search Engine" };
    if (path.startsWith("/admin/settings")) return { title: "Website Settings", crumb: "Configuration" };
    if (path.startsWith("/admin/logs")) return { title: "Activity Audit Logs", crumb: "Security" };
    if (path.startsWith("/admin/profile")) return { title: "Admin Profile", crumb: "Account" };
    return { title: "Admin Portal", crumb: "Portal" };
  };

  const { title, crumb } = getPageInfo();

  const handlePublish = async () => {
    setPublishing(true);
    try {
      const res = await fetch("/api/admin/publish", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success(
          `Published successfully! ${data.metrics?.productsPublished || 0} products & sitemap synchronized.`
        );
      } else {
        toast.error(data.message || "Publishing failed. Please check error logs.");
      }
    } catch (e) {
      toast.error("Network error during publishing.");
    } finally {
      setPublishing(false);
    }
  };

  return (
    <header className="h-16 bg-white border-b border-[#E8E2D7] px-4 sm:px-6 flex items-center justify-between sticky top-0 z-30 shadow-xs">
      {/* Left: Mobile Toggle & Breadcrumbs */}
      <div className="flex items-center gap-3">
        <button
          onClick={onMenuToggle}
          className="p-2 -ml-2 text-neutral-600 hover:text-neutral-900 rounded-lg lg:hidden"
        >
          <Menu className="w-5 h-5" />
        </button>

        <div>
          <div className="flex items-center gap-2 text-[11px] text-neutral-400 font-medium">
            <Link to="/admin" className="hover:text-neutral-600 transition">
              Admin
            </Link>
            <span>/</span>
            <span>{crumb}</span>
          </div>
          <h1 className="text-base sm:text-lg font-bold text-[#102A25] tracking-tight leading-tight">
            {title}
          </h1>
        </div>
      </div>

      {/* Right: Publish CTA & User Profile Dropdown */}
      <div className="flex items-center gap-3 sm:gap-4">
        {/* Publish Action Button */}
        <button
          onClick={handlePublish}
          disabled={publishing}
          title="Synchronize database catalogue to public static JSON & rebuild sitemap"
          className="flex items-center gap-2 px-3.5 py-1.5 rounded-lg bg-[#102A25] hover:bg-[#172B27] text-white text-xs font-semibold shadow-sm transition border border-[#D9B878]/30 disabled:opacity-50"
        >
          {publishing ? (
            <Loader2 className="w-3.5 h-3.5 animate-spin text-[#D9B878]" />
          ) : (
            <UploadCloud className="w-3.5 h-3.5 text-[#D9B878]" />
          )}
          <span className="hidden sm:inline">
            {publishing ? "Publishing..." : "Publish to Website"}
          </span>
          <span className="sm:hidden">{publishing ? "..." : "Publish"}</span>
        </button>

        {/* User Menu */}
        <div className="relative">
          <button
            onClick={() => setUserMenuOpen((prev) => !prev)}
            className="flex items-center gap-2 p-1.5 rounded-lg hover:bg-neutral-100 transition"
          >
            <div className="w-8 h-8 rounded-full bg-[#102A25] text-[#D9B878] font-bold text-xs flex items-center justify-center border border-[#D9B878]/30">
              {admin?.fullName?.charAt(0).toUpperCase() || "A"}
            </div>
            <div className="hidden md:block text-left text-xs leading-none">
              <div className="font-semibold text-neutral-800 truncate max-w-[120px]">
                {admin?.fullName || "Admin"}
              </div>
              <div className="text-[10px] text-neutral-400 capitalize mt-0.5">
                {admin?.role || "superadmin"}
              </div>
            </div>
            <ChevronDown className="w-3.5 h-3.5 text-neutral-400 hidden md:block" />
          </button>

          {userMenuOpen && (
            <>
              <div
                className="fixed inset-0 z-30"
                onClick={() => setUserMenuOpen(false)}
              />
              <div className="absolute right-0 mt-2 w-48 bg-white rounded-xl shadow-xl border border-neutral-200 py-1.5 z-40 animate-in fade-in zoom-in-95 duration-100">
                <div className="px-3 py-2 border-b border-neutral-100 mb-1">
                  <div className="text-xs font-semibold text-neutral-900 truncate">
                    {admin?.fullName}
                  </div>
                  <div className="text-[11px] text-neutral-500 truncate">
                    {admin?.email}
                  </div>
                </div>

                <Link
                  to="/admin/profile"
                  onClick={() => setUserMenuOpen(false)}
                  className="flex items-center gap-2 px-3 py-2 text-xs text-neutral-700 hover:bg-neutral-50 transition"
                >
                  <User className="w-4 h-4 text-neutral-400" />
                  Account Profile
                </Link>

                <a
                  href="/"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-2 px-3 py-2 text-xs text-neutral-700 hover:bg-neutral-50 transition"
                >
                  <ExternalLink className="w-4 h-4 text-neutral-400" />
                  Live Website
                </a>

                <div className="my-1 border-t border-neutral-100" />

                <button
                  onClick={() => {
                    setUserMenuOpen(false);
                    logout();
                  }}
                  className="w-full flex items-center gap-2 px-3 py-2 text-xs text-red-600 hover:bg-red-50 transition text-left"
                >
                  <LogOut className="w-4 h-4" />
                  Sign Out
                </button>
              </div>
            </>
          )}
        </div>
      </div>
    </header>
  );
}
