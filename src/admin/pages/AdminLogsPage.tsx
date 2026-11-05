import React, { useState, useEffect, useCallback } from "react";
import {
  History,
  Search,
  Filter,
  RefreshCw,
  Loader2,
  Shield,
  User,
  Activity,
  ChevronLeft,
  ChevronRight,
  Clock,
} from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";
import { useToast } from "../components/Toast";

interface LogEntry {
  id: number;
  admin_id: number;
  admin_name: string;
  action: string;
  entity_type: string;
  entity_id?: string;
  details?: string;
  ip_address?: string;
  created_at: string;
}

export function AdminLogsPage() {
  const toast = useToast();

  const [logs, setLogs] = useState<LogEntry[]>([]);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);

  // Filters
  const [search, setSearch] = useState("");
  const [entityFilter, setEntityFilter] = useState("all");
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalCount, setTotalCount] = useState(0);

  const fetchLogs = useCallback(
    async (isManual = false) => {
      if (isManual) setRefreshing(true);
      else setLoading(true);

      try {
        const params = new URLSearchParams({
          page: String(page),
          limit: "30",
        });
        if (search) params.set("search", search);
        if (entityFilter && entityFilter !== "all") params.set("entity", entityFilter);

        const res = await fetch(`/api/admin/logs?${params.toString()}`, {
          credentials: "include",
        });
        const data = await res.json();
        if (res.ok && data.success) {
          setLogs(data.logs || []);
          setTotalCount(data.pagination?.total || 0);
          setTotalPages(data.pagination?.totalPages || 1);
        } else {
          toast.error(data.message || "Failed to load activity logs");
        }
      } catch (e) {
        toast.error("Network error while loading audit logs");
      } finally {
        setLoading(false);
        setRefreshing(false);
      }
    },
    [page, search, entityFilter, toast]
  );

  useEffect(() => {
    fetchLogs();
  }, [fetchLogs]);

  const getActionBadge = (action: string) => {
    if (action.includes("create") || action.includes("upload")) {
      return "bg-emerald-50 text-emerald-700 border-emerald-200";
    }
    if (action.includes("update") || action.includes("reorder")) {
      return "bg-blue-50 text-blue-700 border-blue-200";
    }
    if (action.includes("delete")) {
      return "bg-red-50 text-red-700 border-red-200";
    }
    if (action.includes("publish")) {
      return "bg-purple-50 text-purple-700 border-purple-200";
    }
    return "bg-neutral-100 text-neutral-700 border-neutral-200";
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2">
            <h2 className="text-2xl font-bold text-[#102A25] tracking-tight">
              Administrative Audit Logs
            </h2>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-[#102A25]/10 text-[#102A25]">
              {totalCount} Total Entries
            </span>
          </div>
          <p className="text-xs text-neutral-500 mt-1">
            Immutable forensic record of administrator activities, catalogue changes, and security events.
          </p>
        </div>

        <button
          onClick={() => fetchLogs(true)}
          disabled={refreshing}
          className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 text-neutral-600 transition shadow-xs self-start sm:self-auto"
          title="Refresh Logs"
        >
          <RefreshCw className={`w-4 h-4 ${refreshing ? "animate-spin" : ""}`} />
        </button>
      </div>

      {/* Filters Bar */}
      <div className="bg-white rounded-2xl p-4 border border-neutral-200 shadow-xs flex flex-col sm:flex-row gap-3 items-center justify-between">
        <div className="relative flex-1 w-full">
          <Search className="w-4 h-4 absolute left-3.5 top-1/2 -translate-y-1/2 text-neutral-400" />
          <input
            type="text"
            value={search}
            onChange={(e) => {
              setSearch(e.target.value);
              setPage(1);
            }}
            placeholder="Search by action, administrator, or details..."
            className="w-full pl-9 pr-3 py-2 text-xs rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
          />
        </div>

        <div className="w-full sm:w-auto">
          <select
            value={entityFilter}
            onChange={(e) => {
              setEntityFilter(e.target.value);
              setPage(1);
            }}
            className="w-full sm:w-auto px-3 py-2 text-xs rounded-xl border border-neutral-200 bg-white text-neutral-700"
          >
            <option value="all">All Entity Types</option>
            <option value="products">Products</option>
            <option value="categories">Categories</option>
            <option value="leads">Leads & RFQ</option>
            <option value="media">Media Library</option>
            <option value="website_settings">Website Settings</option>
            <option value="publishing">Static Publishing</option>
            <option value="security">Authentication & Security</option>
          </select>
        </div>
      </div>

      {/* Table */}
      <div className="bg-white rounded-2xl border border-neutral-200 shadow-xs overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-xs text-neutral-600">
            <thead className="bg-[#FAF8F5] border-b border-neutral-200 text-neutral-500 uppercase tracking-wider font-semibold text-[10px]">
              <tr>
                <th className="p-4 w-44">Timestamp</th>
                <th className="p-4 w-36">Administrator</th>
                <th className="p-4 w-32">Action</th>
                <th className="p-4 w-32">Module</th>
                <th className="p-4">Details</th>
                <th className="p-4 w-32 text-right">IP Address</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-neutral-100">
              {loading ? (
                <tr>
                  <td colSpan={6} className="py-16 text-center">
                    <Loader2 className="w-6 h-6 animate-spin text-[#102A25] mx-auto mb-2" />
                    <p className="text-xs text-neutral-400">Loading audit trail...</p>
                  </td>
                </tr>
              ) : logs.length === 0 ? (
                <tr>
                  <td colSpan={6} className="py-16 text-center">
                    <History className="w-8 h-8 text-neutral-300 mx-auto mb-2" />
                    <p className="text-sm font-semibold text-neutral-700">No activity recorded</p>
                    <p className="text-xs text-neutral-400 mt-0.5">
                      Administrative activities and logins will appear here in real time.
                    </p>
                  </td>
                </tr>
              ) : (
                logs.map((log) => (
                  <tr key={log.id} className="hover:bg-[#FAF8F5]/60 transition">
                    <td className="p-4 text-[11px] text-neutral-500 font-mono whitespace-nowrap">
                      {new Date(log.created_at).toLocaleString("en-IN", {
                        day: "2-digit",
                        month: "short",
                        year: "numeric",
                        hour: "2-digit",
                        minute: "2-digit",
                        second: "2-digit",
                      })}
                    </td>

                    <td className="p-4 font-semibold text-neutral-900">
                      <div className="flex items-center gap-1.5">
                        <User className="w-3.5 h-3.5 text-neutral-400" />
                        <span>{log.admin_name || `Admin #${log.admin_id}`}</span>
                      </div>
                    </td>

                    <td className="p-4">
                      <span
                        className={`inline-block px-2 py-0.5 rounded-full text-[10px] font-bold uppercase tracking-wider border ${getActionBadge(
                          log.action
                        )}`}
                      >
                        {log.action.replace("_", " ")}
                      </span>
                    </td>

                    <td className="p-4 text-[11px] font-mono text-neutral-600">
                      {log.entity_type}
                    </td>

                    <td className="p-4 text-neutral-800 leading-normal max-w-md">
                      {log.details || "—"}
                    </td>

                    <td className="p-4 text-right font-mono text-[11px] text-neutral-400">
                      {log.ip_address || "127.0.0.1"}
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>

        {/* Pagination */}
        <div className="px-6 py-4 border-t border-neutral-200 bg-[#FAF8F5] flex items-center justify-between text-xs text-neutral-500">
          <div>
            Showing <span className="font-semibold">{logs.length ? (page - 1) * 30 + 1 : 0}</span> to{" "}
            <span className="font-semibold">{Math.min(page * 30, totalCount)}</span> of{" "}
            <span className="font-semibold">{totalCount}</span> log entries
          </div>

          <div className="flex items-center gap-2">
            <button
              onClick={() => setPage((p) => Math.max(1, p - 1))}
              disabled={page <= 1 || loading}
              className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 disabled:opacity-40 transition"
            >
              <ChevronLeft className="w-4 h-4" />
            </button>
            <span className="font-semibold px-2">
              Page {page} of {totalPages}
            </span>
            <button
              onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
              disabled={page >= totalPages || loading}
              className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 disabled:opacity-40 transition"
            >
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
