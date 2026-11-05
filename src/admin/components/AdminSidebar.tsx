import React from "react";
import { Link, useLocation } from "react-router-dom";
import {
  LayoutDashboard,
  Package,
  Layers,
  Inbox,
  Image as ImageIcon,
  Globe,
  Settings,
  History,
  User,
  LogOut,
  ExternalLink,
  ChevronRight,
  Shield,
} from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";

interface NavItem {
  name: string;
  href: string;
  icon: React.ElementType;
  badge?: string;
}

const navItems: NavItem[] = [
  { name: "Dashboard", href: "/admin", icon: LayoutDashboard },
  { name: "Products", href: "/admin/products", icon: Package },
  { name: "Categories", href: "/admin/categories", icon: Layers },
  { name: "Leads & Enquiries", href: "/admin/leads", icon: Inbox },
  { name: "Media Library", href: "/admin/media", icon: ImageIcon },
  { name: "SEO Management", href: "/admin/seo", icon: Globe },
  { name: "Website Settings", href: "/admin/settings", icon: Settings },
  { name: "Activity Logs", href: "/admin/logs", icon: History },
  { name: "Admin Profile", href: "/admin/profile", icon: User },
];

export function AdminSidebar({
  isOpen,
  onClose,
}: {
  isOpen: boolean;
  onClose?: () => void;
}) {
  const location = useLocation();
  const { admin, logout } = useAdminAuth();

  const isActive = (href: string) => {
    if (href === "/admin") {
      return location.pathname === "/admin" || location.pathname === "/admin/";
    }
    return location.pathname.startsWith(href);
  };

  return (
    <>
      {/* Mobile backdrop */}
      {isOpen && (
        <div
          className="fixed inset-0 z-40 bg-black/60 backdrop-blur-sm lg:hidden"
          onClick={onClose}
        />
      )}

      <aside
        className={`fixed top-0 bottom-0 left-0 z-50 w-64 bg-[#102A25] border-r border-[#172B27] flex flex-col transition-transform duration-300 lg:translate-x-0 ${
          isOpen ? "translate-x-0" : "-translate-x-full"
        }`}
      >
        {/* Brand Header */}
        <div className="h-16 px-6 flex items-center justify-between border-b border-white/10 bg-[#0B1D19]">
          <Link to="/admin" className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-lg bg-[#D9B878] flex items-center justify-center text-[#102A25] font-bold text-sm shadow-md">
              RR
            </div>
            <div>
              <div className="font-heading font-bold text-sm tracking-wide text-white">
                RR FOUNDATIONS
              </div>
              <div className="text-[10px] tracking-widest uppercase text-[#D9B878] font-semibold">
                Enterprise CMS
              </div>
            </div>
          </Link>
        </div>

        {/* User Mini Profile */}
        <div className="px-5 py-4 border-b border-white/5 bg-[#172B27]/40 flex items-center gap-3">
          <div className="w-9 h-9 rounded-full bg-[#D9B878]/20 border border-[#D9B878]/30 flex items-center justify-center text-[#D9B878] font-semibold text-xs">
            {admin?.fullName ? admin.fullName.charAt(0).toUpperCase() : "A"}
          </div>
          <div className="flex-1 min-w-0">
            <div className="text-xs font-semibold text-white truncate">
              {admin?.fullName || "Administrator"}
            </div>
            <div className="text-[11px] text-[#D9B878] flex items-center gap-1 capitalize">
              <Shield className="w-3 h-3" />
              {admin?.role || "superadmin"}
            </div>
          </div>
        </div>

        {/* Navigation Menu */}
        <nav className="flex-1 px-3 py-4 space-y-1 overflow-y-auto">
          {navItems.map((item) => {
            const active = isActive(item.href);
            const Icon = item.icon;
            return (
              <Link
                key={item.name}
                to={item.href}
                onClick={onClose}
                className={`group flex items-center justify-between px-3 py-2.5 rounded-xl text-xs font-medium transition-all ${
                  active
                    ? "bg-[#D9B878] text-[#102A25] font-semibold shadow-md"
                    : "text-white/70 hover:text-white hover:bg-white/5"
                }`}
              >
                <div className="flex items-center gap-3">
                  <Icon
                    className={`w-4 h-4 shrink-0 transition-colors ${
                      active ? "text-[#102A25]" : "text-white/50 group-hover:text-[#D9B878]"
                    }`}
                  />
                  <span>{item.name}</span>
                </div>
                {active ? (
                  <ChevronRight className="w-3.5 h-3.5 text-[#102A25]" />
                ) : null}
              </Link>
            );
          })}
        </nav>

        {/* Footer Actions */}
        <div className="p-3 border-t border-white/10 space-y-1 bg-[#0B1D19]/60">
          <a
            href="/"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-between px-3 py-2 rounded-xl text-xs font-medium text-white/70 hover:text-white hover:bg-white/5 transition"
          >
            <span className="flex items-center gap-2.5">
              <ExternalLink className="w-4 h-4 text-[#D9B878]" />
              View Public Website
            </span>
          </a>

          <button
            onClick={() => logout()}
            className="w-full flex items-center gap-2.5 px-3 py-2 rounded-xl text-xs font-medium text-red-400 hover:text-red-300 hover:bg-red-950/30 transition text-left"
          >
            <LogOut className="w-4 h-4" />
            <span>Sign Out</span>
          </button>
        </div>
      </aside>
    </>
  );
}
