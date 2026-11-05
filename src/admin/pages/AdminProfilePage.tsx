import React, { useState } from "react";
import {
  User,
  Lock,
  Shield,
  Key,
  CheckCircle2,
  AlertCircle,
  Loader2,
  Save,
  ShieldCheck,
} from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";
import { useToast } from "../components/Toast";

export function AdminProfilePage() {
  const { admin, changePassword } = useAdminAuth();
  const toast = useToast();

  const [currentPassword, setCurrentPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [loading, setLoading] = useState(false);

  const handlePasswordSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!currentPassword || !newPassword) {
      toast.error("Please fill in all password fields.");
      return;
    }

    if (newPassword.length < 8) {
      toast.error("New password must be at least 8 characters long.");
      return;
    }

    if (newPassword !== confirmPassword) {
      toast.error("New password and confirm password do not match.");
      return;
    }

    setLoading(true);
    const res = await changePassword(currentPassword, newPassword);
    setLoading(false);

    if (res.success) {
      toast.success("Password changed successfully. Please keep it secure.");
      setCurrentPassword("");
      setNewPassword("");
      setConfirmPassword("");
    } else {
      toast.error(res.message || "Failed to update password.");
    }
  };

  return (
    <div className="space-y-6 max-w-4xl">
      {/* Header */}
      <div>
        <h2 className="text-2xl font-bold text-[#102A25] tracking-tight">
          Admin Profile & Security
        </h2>
        <p className="text-xs text-neutral-500 mt-1">
          Manage your account credentials, view security privileges, and update authentication passwords.
        </p>
      </div>

      {/* Account Info Card */}
      <div className="bg-white rounded-2xl p-6 border border-neutral-200 shadow-xs flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">
        <div className="flex items-center gap-4">
          <div className="w-14 h-14 rounded-2xl bg-[#102A25] text-[#D9B878] font-bold text-xl flex items-center justify-center shadow-md">
            {admin?.fullName ? admin.fullName.charAt(0).toUpperCase() : "A"}
          </div>
          <div>
            <h3 className="font-bold text-base text-[#102A25]">{admin?.fullName || "Administrator"}</h3>
            <p className="text-xs text-neutral-500 font-mono mt-0.5">{admin?.email}</p>
            <div className="flex items-center gap-2 mt-2">
              <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[10px] font-bold bg-[#D9B878]/30 text-[#102A25] uppercase tracking-wider">
                <ShieldCheck className="w-3 h-3 text-[#102A25]" />
                <span>{admin?.role || "Superadmin"}</span>
              </span>
              <span className="text-[11px] text-neutral-400">ID #{admin?.id}</span>
            </div>
          </div>
        </div>

        <div className="p-3 bg-[#FAF8F5] rounded-xl border border-neutral-200 text-xs text-neutral-600 max-w-xs">
          <div className="font-semibold text-neutral-800 flex items-center gap-1.5 mb-1">
            <Shield className="w-3.5 h-3.5 text-[#102A25]" />
            <span>Hostinger Security Guard</span>
          </div>
          <p className="text-[11px] text-neutral-500 leading-snug">
            Protected with HttpOnly session cookies, SameSite=Strict, and CSRF token verification.
          </p>
        </div>
      </div>

      {/* Change Password Card */}
      <div className="bg-white rounded-2xl p-6 border border-neutral-200 shadow-xs">
        <div className="flex items-center gap-2 border-b border-neutral-100 pb-3 mb-6">
          <Key className="w-5 h-5 text-[#D9B878]" />
          <h3 className="font-bold text-sm text-[#102A25]">
            Update Administrator Password
          </h3>
        </div>

        <form onSubmit={handlePasswordSubmit} className="space-y-4 max-w-md text-xs">
          <div>
            <label className="block font-semibold text-neutral-700 mb-1">
              Current Password <span className="text-red-500">*</span>
            </label>
            <input
              type="password"
              required
              value={currentPassword}
              onChange={(e) => setCurrentPassword(e.target.value)}
              placeholder="••••••••••••"
              className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
            />
          </div>

          <div>
            <label className="block font-semibold text-neutral-700 mb-1">
              New Password <span className="text-red-500">*</span>
            </label>
            <input
              type="password"
              required
              value={newPassword}
              onChange={(e) => setNewPassword(e.target.value)}
              placeholder="Minimum 8 characters"
              className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
            />
            <p className="text-[10px] text-neutral-400 mt-1">
              Use a mix of uppercase, lowercase, numbers, and symbols.
            </p>
          </div>

          <div>
            <label className="block font-semibold text-neutral-700 mb-1">
              Confirm New Password <span className="text-red-500">*</span>
            </label>
            <input
              type="password"
              required
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              placeholder="Re-enter new password"
              className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
            />
          </div>

          <div className="pt-2">
            <button
              type="submit"
              disabled={loading}
              className="px-5 py-2.5 rounded-xl bg-[#102A25] hover:bg-[#172B27] text-white text-xs font-bold transition flex items-center gap-2 shadow-sm disabled:opacity-50"
            >
              {loading ? (
                <Loader2 className="w-4 h-4 animate-spin text-[#D9B878]" />
              ) : (
                <Save className="w-4 h-4 text-[#D9B878]" />
              )}
              <span>Update Password</span>
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
