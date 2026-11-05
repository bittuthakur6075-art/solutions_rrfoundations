import React, { useState, useEffect } from "react";
import {
  Settings,
  Save,
  Building,
  Phone,
  Mail,
  MapPin,
  Clock,
  Shield,
  Server,
  Database,
  RefreshCw,
  Loader2,
  FileCheck,
  CheckCircle2,
} from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";
import { useToast } from "../components/Toast";

interface SettingsMap {
  [key: string]: string;
}

export function AdminSettingsPage() {
  const { csrfToken } = useAdminAuth();
  const toast = useToast();

  const [settings, setSettings] = useState<SettingsMap>({
    company_name: "RR Foundations",
    brand_tagline: "Industrial Excellence & Custom Manufacturing",
    email: "help@rrfoundation.org",
    phone: "+91 99718 10844",
    phone_raw: "+919971810844",
    whatsapp: "+919971810844",
    address: "B-21, Okhla Industrial Area, Phase-I, New Delhi - 110020, India",
    gstin: "07AAAAA0000A1Z5",
    opening_hours: "Mon - Sat: 9:30 AM - 6:30 PM IST",
    website: "https://solutions.rrfoundations.org",
  });

  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);

  const fetchSettings = async () => {
    setLoading(true);
    try {
      const res = await fetch("/api/admin/settings", { credentials: "include" });
      const data = await res.json();
      if (res.ok && data.settings) {
        setSettings((prev) => ({ ...prev, ...data.settings }));
      }
    } catch (e) {
      toast.error("Failed to load website settings");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchSettings();
  }, []);

  const handleChange = (key: string, value: string) => {
    setSettings((prev) => ({ ...prev, [key]: value }));
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    try {
      const res = await fetch("/api/admin/settings", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body: JSON.stringify({ settings }),
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success("Settings saved successfully. Remember to publish changes to update public pages.");
      } else {
        toast.error(data.message || "Failed to update settings");
      }
    } catch (e) {
      toast.error("Error saving website settings");
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2">
            <h2 className="text-2xl font-bold text-[#102A25] tracking-tight">
              Website & Organization Settings
            </h2>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-[#102A25]/10 text-[#102A25]">
              Hostinger Environment
            </span>
          </div>
          <p className="text-xs text-neutral-500 mt-1">
            Manage corporate contact details, factory addresses, GST registration, and production parameters.
          </p>
        </div>

        <button
          onClick={handleSave}
          disabled={saving || loading}
          className="inline-flex items-center gap-1.5 px-5 py-2.5 rounded-xl bg-[#102A25] hover:bg-[#172B27] text-white text-xs font-bold shadow-sm transition disabled:opacity-50"
        >
          {saving ? (
            <Loader2 className="w-4 h-4 animate-spin text-[#D9B878]" />
          ) : (
            <Save className="w-4 h-4 text-[#D9B878]" />
          )}
          <span>Save Settings</span>
        </button>
      </div>

      {loading ? (
        <div className="py-20 text-center">
          <Loader2 className="w-8 h-8 animate-spin text-[#102A25] mx-auto mb-2" />
          <p className="text-xs text-neutral-400">Loading system settings...</p>
        </div>
      ) : (
        <form onSubmit={handleSave} className="space-y-6">
          {/* Organization & Branding Details */}
          <div className="bg-white rounded-2xl p-6 border border-neutral-200 shadow-xs space-y-4">
            <div className="flex items-center gap-2 border-b border-neutral-100 pb-3">
              <Building className="w-5 h-5 text-[#D9B878]" />
              <h3 className="font-bold text-sm text-[#102A25]">
                Corporate Profile & Legal Registration
              </h3>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-xs">
              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Company Legal Name
                </label>
                <input
                  type="text"
                  value={settings.company_name || ""}
                  onChange={(e) => handleChange("company_name", e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
                />
              </div>

              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Tagline / Brand Statement
                </label>
                <input
                  type="text"
                  value={settings.brand_tagline || ""}
                  onChange={(e) => handleChange("brand_tagline", e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
                />
              </div>

              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  GSTIN / Tax Identification
                </label>
                <input
                  type="text"
                  value={settings.gstin || ""}
                  onChange={(e) => handleChange("gstin", e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 font-mono"
                />
              </div>

              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Production Canonical URL
                </label>
                <input
                  type="text"
                  value={settings.website || ""}
                  onChange={(e) => handleChange("website", e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 font-mono text-[11px]"
                />
              </div>
            </div>
          </div>

          {/* Contact & Communications */}
          <div className="bg-white rounded-2xl p-6 border border-neutral-200 shadow-xs space-y-4">
            <div className="flex items-center gap-2 border-b border-neutral-100 pb-3">
              <Phone className="w-5 h-5 text-[#D9B878]" />
              <h3 className="font-bold text-sm text-[#102A25]">
                Customer Inquiries & Head Office Contact
              </h3>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-xs">
              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Official Enquiries Email
                </label>
                <input
                  type="email"
                  value={settings.email || ""}
                  onChange={(e) => handleChange("email", e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200"
                />
                <p className="text-[10px] text-neutral-400 mt-1">Recipient of website RFQ submissions</p>
              </div>

              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Customer Hotline (Display)
                </label>
                <input
                  type="text"
                  value={settings.phone || ""}
                  onChange={(e) => handleChange("phone", e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200"
                />
              </div>

              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  WhatsApp Support Number
                </label>
                <input
                  type="text"
                  value={settings.whatsapp || ""}
                  onChange={(e) => handleChange("whatsapp", e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 font-mono"
                />
                <p className="text-[10px] text-neutral-400 mt-1">Format: +919971810844</p>
              </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-xs pt-2">
              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Factory & Office Postal Address
                </label>
                <textarea
                  rows={2}
                  value={settings.address || ""}
                  onChange={(e) => handleChange("address", e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200"
                />
              </div>

              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Working Hours
                </label>
                <textarea
                  rows={2}
                  value={settings.opening_hours || ""}
                  onChange={(e) => handleChange("opening_hours", e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200"
                />
              </div>
            </div>
          </div>

          {/* System Environment Information */}
          <div className="bg-[#102A25] text-white rounded-2xl p-6 shadow-md space-y-4">
            <div className="flex items-center gap-2 border-b border-white/10 pb-3">
              <Server className="w-5 h-5 text-[#D9B878]" />
              <h3 className="font-bold text-sm text-[#D9B878]">
                Hostinger Web Hosting & Architecture Health
              </h3>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 text-xs">
              <div className="p-3 bg-white/5 rounded-xl border border-white/10">
                <span className="text-[11px] text-neutral-400 block">PHP Runtime:</span>
                <span className="font-bold font-mono text-[#D9B878]">PHP 8.1 / 8.2 FastCGI</span>
              </div>

              <div className="p-3 bg-white/5 rounded-xl border border-white/10">
                <span className="text-[11px] text-neutral-400 block">Database Storage:</span>
                <span className="font-bold font-mono text-[#D9B878]">Hostinger MySQL 8.0</span>
              </div>

              <div className="p-3 bg-white/5 rounded-xl border border-white/10">
                <span className="text-[11px] text-neutral-400 block">Publishing Pipeline:</span>
                <span className="font-bold font-mono text-[#D9B878]">Synchronized Snapshots</span>
              </div>
            </div>
          </div>
        </form>
      )}
    </div>
  );
}
