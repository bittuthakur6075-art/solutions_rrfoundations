import React, { useState } from "react";
import { useNavigate, Navigate } from "react-router-dom";
import { Lock, Mail, Loader2, ShieldCheck, ArrowRight, AlertCircle } from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";

export function AdminLoginPage() {
  const { isAuthenticated, login } = useAdminAuth();
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [rememberMe, setRememberMe] = useState(true);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  if (isAuthenticated) {
    return <Navigate to="/admin" replace />;
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!email || !password) {
      setError("Please provide both email address and password.");
      return;
    }

    setLoading(true);
    setError(null);

    const res = await login(email, password);
    setLoading(false);

    if (res.success) {
      navigate("/admin");
    } else {
      setError(res.message || "Invalid administrative credentials.");
    }
  };

  return (
    <div className="min-h-screen bg-[#102A25] flex items-center justify-center p-4 relative overflow-hidden selection:bg-[#D9B878] selection:text-[#102A25]">
      {/* Subtle luxury glow backgrounds */}
      <div className="absolute top-1/4 -left-32 w-96 h-96 bg-[#D9B878]/10 rounded-full blur-[120px] pointer-events-none" />
      <div className="absolute bottom-1/4 -right-32 w-96 h-96 bg-[#172B27] rounded-full blur-[140px] pointer-events-none" />

      <div className="w-full max-w-md relative z-10 animate-in fade-in zoom-in-95 duration-300">
        {/* Brand Header */}
        <div className="text-center mb-8">
          <div className="inline-flex items-center justify-center w-14 h-14 rounded-2xl bg-[#D9B878] text-[#102A25] font-extrabold text-xl shadow-xl border border-[#D9B878]/40 mb-4">
            RR
          </div>
          <h1 className="text-2xl font-bold font-heading text-white tracking-tight">
            RR FOUNDATIONS
          </h1>
          <p className="text-xs text-[#D9B878] font-semibold tracking-widest uppercase mt-1">
            Enterprise CMS & Operations Console
          </p>
        </div>

        {/* Card */}
        <div className="bg-white rounded-3xl p-6 sm:p-8 shadow-2xl border border-[#E8E2D7]">
          <div className="mb-6">
            <h2 className="text-lg font-bold text-[#102A25]">Administrator Sign In</h2>
            <p className="text-xs text-neutral-500 mt-0.5">
              Enter your authorized credentials to manage website operations.
            </p>
          </div>

          {error && (
            <div className="mb-5 p-3.5 rounded-xl bg-red-50 border border-red-200 flex items-start gap-3 text-xs text-red-700 animate-in fade-in duration-200">
              <AlertCircle className="w-4 h-4 text-red-500 shrink-0 mt-0.5" />
              <span>{error}</span>
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label className="block text-xs font-semibold text-neutral-700 mb-1.5">
                Work Email Address
              </label>
              <div className="relative">
                <Mail className="w-4 h-4 text-neutral-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  placeholder="admin@rrfoundations.org"
                  required
                  className="w-full pl-10 pr-4 py-2.5 rounded-xl bg-neutral-50 border border-neutral-200 text-xs text-neutral-900 focus:outline-none focus:ring-2 focus:ring-[#102A25] focus:bg-white transition"
                />
              </div>
            </div>

            <div>
              <label className="block text-xs font-semibold text-neutral-700 mb-1.5">
                Password
              </label>
              <div className="relative">
                <Lock className="w-4 h-4 text-neutral-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="••••••••••••"
                  required
                  className="w-full pl-10 pr-4 py-2.5 rounded-xl bg-neutral-50 border border-neutral-200 text-xs text-neutral-900 focus:outline-none focus:ring-2 focus:ring-[#102A25] focus:bg-white transition"
                />
              </div>
            </div>

            <div className="flex items-center justify-between text-xs pt-1">
              <label className="flex items-center gap-2 text-neutral-600 cursor-pointer select-none">
                <input
                  type="checkbox"
                  checked={rememberMe}
                  onChange={(e) => setRememberMe(e.target.checked)}
                  className="rounded border-neutral-300 text-[#102A25] focus:ring-[#102A25]"
                />
                Remember this session
              </label>
            </div>

            <button
              type="submit"
              disabled={loading}
              className="w-full mt-2 py-3 px-4 rounded-xl bg-[#102A25] hover:bg-[#172B27] text-white text-xs font-bold tracking-wide transition shadow-lg shadow-[#102A25]/20 flex items-center justify-center gap-2 border border-[#D9B878]/30 disabled:opacity-60"
            >
              {loading ? (
                <>
                  <Loader2 className="w-4 h-4 animate-spin text-[#D9B878]" />
                  <span>Authenticating...</span>
                </>
              ) : (
                <>
                  <span>Sign In to Console</span>
                  <ArrowRight className="w-4 h-4 text-[#D9B878]" />
                </>
              )}
            </button>
          </form>

          {/* Temporary Demo Credentials Notice */}
          <div className="mt-5 p-3 rounded-xl bg-[#FAF8F5] border border-[#E8E2D7] text-[11px] text-neutral-600 space-y-1">
            <div className="flex items-center justify-between font-semibold text-[#102A25]">
              <span>Temporary Demo Access</span>
              <span className="text-[10px] text-[#D9B878] font-bold uppercase tracking-wider">Initial</span>
            </div>
            <div className="flex justify-between font-mono text-[10px] text-neutral-500">
              <span>admin@rrfoundations.org</span>
              <span>Admin@RR2026!</span>
            </div>
            <p className="text-[10px] text-neutral-400 italic pt-0.5">
              Change this temporary password immediately after login via Admin Profile.
            </p>
          </div>

          <div className="mt-6 pt-5 border-t border-neutral-100 flex items-center justify-center gap-1.5 text-[11px] text-neutral-400">
            <ShieldCheck className="w-3.5 h-3.5 text-[#102A25]" />
            <span>256-Bit Encrypted B2B Administrative Session</span>
          </div>
        </div>

        {/* Back Link */}
        <div className="text-center mt-6">
          <a
            href="/"
            className="text-xs text-white/50 hover:text-white transition font-medium"
          >
            ← Return to Public Website
          </a>
        </div>
      </div>
    </div>
  );
}
