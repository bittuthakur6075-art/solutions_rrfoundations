import React, { createContext, useContext, useState, useEffect } from "react";

export interface AdminUser {
  id: number;
  email: string;
  fullName: string;
  role: "superadmin" | "admin" | "editor";
}

interface AdminAuthContextType {
  admin: AdminUser | null;
  isAuthenticated: boolean;
  isLoading: boolean;
  csrfToken: string;
  login: (email: string, pass: string) => Promise<{ success: boolean; message?: string }>;
  logout: () => Promise<void>;
  changePassword: (currentPass: string, newPass: string) => Promise<{ success: boolean; message?: string }>;
  refreshAuth: () => Promise<void>;
}

const AdminAuthContext = createContext<AdminAuthContextType | undefined>(undefined);

export function AdminAuthProvider({ children }: { children: React.ReactNode }) {
  const [admin, setAdmin] = useState<AdminUser | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [csrfToken, setCsrfToken] = useState("");

  const refreshAuth = async () => {
    try {
      const res = await fetch("/api/admin/auth?action=me", {
        credentials: "include",
      });
      if (res.ok) {
        const data = await res.json();
        if (data.success && data.user) {
          setAdmin(data.user);
          if (data.csrfToken) setCsrfToken(data.csrfToken);
        } else {
          setAdmin(null);
        }
      } else {
        setAdmin(null);
      }
    } catch (e) {
      setAdmin(null);
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    refreshAuth();
  }, []);

  const login = async (email: string, pass: string) => {
    try {
      const res = await fetch("/api/admin/auth?action=login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ email, password: pass }),
      });
      const data = await res.json();
      if (res.ok && data.success) {
        setAdmin(data.user);
        if (data.csrfToken) setCsrfToken(data.csrfToken);
        return { success: true };
      } else {
        return { success: false, message: data.message || "Invalid email or password" };
      }
    } catch (e) {
      return { success: false, message: "Connection error. Please try again." };
    }
  };

  const logout = async () => {
    try {
      await fetch("/api/admin/auth?action=logout", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
      });
    } catch (e) {
      // Ignored
    } finally {
      setAdmin(null);
      setCsrfToken("");
    }
  };

  const changePassword = async (currentPass: string, newPass: string) => {
    try {
      const res = await fetch("/api/admin/auth?action=change-password", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body: JSON.stringify({ currentPassword: currentPass, newPassword: newPass }),
      });
      const data = await res.json();
      return { success: res.ok && data.success, message: data.message };
    } catch (e) {
      return { success: false, message: "Connection failed" };
    }
  };

  return (
    <AdminAuthContext.Provider
      value={{
        admin,
        isAuthenticated: !!admin,
        isLoading,
        csrfToken,
        login,
        logout,
        changePassword,
        refreshAuth,
      }}
    >
      {children}
    </AdminAuthContext.Provider>
  );
}

export function useAdminAuth() {
  const ctx = useContext(AdminAuthContext);
  if (!ctx) throw new Error("useAdminAuth must be used inside AdminAuthProvider");
  return ctx;
}
