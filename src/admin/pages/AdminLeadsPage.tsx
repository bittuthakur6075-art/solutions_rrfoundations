import React, { useState, useEffect, useCallback } from "react";
import {
  Inbox,
  Search,
  Filter,
  Download,
  Mail,
  Phone,
  Building,
  Calendar,
  Clock,
  Star,
  MessageSquare,
  ChevronLeft,
  ChevronRight,
  RefreshCw,
  Loader2,
  X,
  Send,
  User,
  CheckCircle2,
  AlertCircle,
  FileText,
  ExternalLink,
} from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";
import { useToast } from "../components/Toast";

interface LeadItem {
  id: string;
  fullName: string;
  companyName?: string;
  email: string;
  phone: string;
  productName?: string;
  category?: string;
  quantity?: string;
  message?: string;
  status: "New" | "Contacted" | "Qualified" | "Quotation Sent" | "Negotiation" | "Converted" | "Lost" | "Spam";
  isStarred: boolean;
  createdAt: string;
  updatedAt?: string;
  notesCount?: number;
}

interface LeadDetail extends LeadItem {
  notes?: Array<{
    id: number;
    admin_name: string;
    note: string;
    created_at: string;
  }>;
}

const statusOptions = [
  "New",
  "Contacted",
  "Qualified",
  "Quotation Sent",
  "Negotiation",
  "Converted",
  "Lost",
  "Spam",
];

export function AdminLeadsPage() {
  const { csrfToken } = useAdminAuth();
  const toast = useToast();

  const [leads, setLeads] = useState<LeadItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);

  // Filters
  const [search, setSearch] = useState("");
  const [statusFilter, setStatusFilter] = useState("");
  const [starredOnly, setStarredOnly] = useState(false);
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalCount, setTotalCount] = useState(0);

  // Detail Drawer
  const [selectedLeadId, setSelectedLeadId] = useState<string | null>(null);
  const [detailLead, setDetailLead] = useState<LeadDetail | null>(null);
  const [detailLoading, setDetailLoading] = useState(false);
  const [newNote, setNewNote] = useState("");
  const [savingNote, setSavingNote] = useState(false);

  const fetchLeads = useCallback(
    async (isManual = false) => {
      if (isManual) setRefreshing(true);
      else setLoading(true);

      try {
        const params = new URLSearchParams({
          page: String(page),
          limit: "25",
        });
        if (search) params.set("search", search);
        if (statusFilter) params.set("status", statusFilter);
        if (starredOnly) params.set("starred", "1");

        const res = await fetch(`/api/admin/leads?${params.toString()}`, {
          credentials: "include",
        });
        const data = await res.json();
        if (res.ok && data.success) {
          setLeads(data.leads || []);
          setTotalCount(data.total || 0);
          setTotalPages(data.totalPages || 1);
        } else {
          toast.error(data.message || "Failed to load enquiries");
        }
      } catch (e) {
        toast.error("Network error while loading enquiries");
      } finally {
        setLoading(false);
        setRefreshing(false);
      }
    },
    [page, search, statusFilter, starredOnly, toast]
  );

  useEffect(() => {
    fetchLeads();
  }, [fetchLeads]);

  // Load Lead Detail
  const openLeadDetail = async (id: string) => {
    setSelectedLeadId(id);
    setDetailLoading(true);
    try {
      const res = await fetch(`/api/admin/leads?id=${encodeURIComponent(id)}`, {
        credentials: "include",
      });
      const data = await res.json();
      if (res.ok && data.success && data.lead) {
        setDetailLead(data.lead);
      } else {
        toast.error("Could not load lead details");
      }
    } catch (e) {
      toast.error("Error fetching enquiry details");
    } finally {
      setDetailLoading(false);
    }
  };

  // Update Status
  const handleUpdateStatus = async (leadId: string, newStatus: string) => {
    try {
      const res = await fetch(`/api/admin/leads?id=${encodeURIComponent(leadId)}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body: JSON.stringify({ status: newStatus }),
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success(`Status updated to ${newStatus}`);
        setLeads((prev) =>
          prev.map((l) => (l.id === leadId ? { ...l, status: newStatus as any } : l))
        );
        if (detailLead && detailLead.id === leadId) {
          setDetailLead((prev) => (prev ? { ...prev, status: newStatus as any } : null));
        }
      } else {
        toast.error(data.message || "Could not update status");
      }
    } catch (e) {
      toast.error("Error updating lead status");
    }
  };

  // Toggle Star
  const handleToggleStar = async (leadId: string, currentVal: boolean) => {
    const newVal = !currentVal;
    try {
      const res = await fetch(`/api/admin/leads?id=${encodeURIComponent(leadId)}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body: JSON.stringify({ isStarred: newVal }),
      });
      const data = await res.json();
      if (res.ok && data.success) {
        setLeads((prev) =>
          prev.map((l) => (l.id === leadId ? { ...l, isStarred: newVal } : l))
        );
        if (detailLead && detailLead.id === leadId) {
          setDetailLead((prev) => (prev ? { ...prev, isStarred: newVal } : null));
        }
      }
    } catch (e) {}
  };

  // Add Note
  const handleAddNote = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!newNote.trim() || !selectedLeadId) return;

    setSavingNote(true);
    try {
      const res = await fetch("/api/admin/leads?action=add-note", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body: JSON.stringify({
          leadId: selectedLeadId,
          note: newNote,
        }),
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success("Note added");
        setNewNote("");
        // Reload details
        openLeadDetail(selectedLeadId);
      } else {
        toast.error(data.message || "Could not add note");
      }
    } catch (e) {
      toast.error("Failed to add note");
    } finally {
      setSavingNote(false);
    }
  };

  const getStatusBadge = (status: string) => {
    switch (status) {
      case "New":
        return "bg-blue-50 text-blue-700 border-blue-200";
      case "Contacted":
        return "bg-purple-50 text-purple-700 border-purple-200";
      case "Qualified":
        return "bg-emerald-50 text-emerald-700 border-emerald-200";
      case "Quotation Sent":
        return "bg-amber-50 text-amber-700 border-amber-200";
      case "Converted":
        return "bg-emerald-600 text-white border-transparent";
      case "Lost":
        return "bg-red-50 text-red-700 border-red-200";
      case "Spam":
        return "bg-neutral-100 text-neutral-500 border-neutral-300";
      default:
        return "bg-neutral-100 text-neutral-700 border-neutral-200";
    }
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2">
            <h2 className="text-2xl font-bold text-[#102A25] tracking-tight">
              Customer Enquiries & RFQ Leads
            </h2>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-[#102A25]/10 text-[#102A25]">
              {totalCount} Total
            </span>
          </div>
          <p className="text-xs text-neutral-500 mt-1">
            Review incoming quote requests, track client follow-ups, and export pipeline analytics.
          </p>
        </div>

        <div className="flex items-center gap-2.5">
          <a
            href="/api/admin/leads?action=export"
            download
            className="inline-flex items-center gap-1.5 px-3 py-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 text-xs font-semibold text-neutral-700 shadow-xs transition"
          >
            <Download className="w-4 h-4 text-neutral-500" />
            <span className="hidden sm:inline">Export Leads CSV</span>
          </a>

          <button
            onClick={() => fetchLeads(true)}
            disabled={refreshing}
            className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 text-neutral-600 transition shadow-xs"
            title="Refresh List"
          >
            <RefreshCw className={`w-4 h-4 ${refreshing ? "animate-spin" : ""}`} />
          </button>
        </div>
      </div>

      {/* Filters Bar */}
      <div className="bg-white rounded-2xl p-4 border border-neutral-200 shadow-xs flex flex-col md:flex-row gap-3 items-stretch md:items-center justify-between">
        <div className="relative flex-1">
          <Search className="w-4 h-4 absolute left-3.5 top-1/2 -translate-y-1/2 text-neutral-400" />
          <input
            type="text"
            value={search}
            onChange={(e) => {
              setSearch(e.target.value);
              setPage(1);
            }}
            placeholder="Search by name, company, email or phone..."
            className="w-full pl-9 pr-4 py-2 text-xs rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
          />
        </div>

        <div className="flex flex-wrap items-center gap-2">
          {/* Status Filter */}
          <select
            value={statusFilter}
            onChange={(e) => {
              setStatusFilter(e.target.value);
              setPage(1);
            }}
            className="px-3 py-2 text-xs rounded-xl border border-neutral-200 bg-white text-neutral-700 focus:outline-none focus:border-[#102A25]"
          >
            <option value="">All Statuses</option>
            {statusOptions.map((s) => (
              <option key={s} value={s}>
                {s}
              </option>
            ))}
          </select>

          {/* Starred Toggle */}
          <button
            onClick={() => {
              setStarredOnly(!starredOnly);
              setPage(1);
            }}
            className={`px-3 py-2 text-xs rounded-xl border flex items-center gap-1.5 transition ${
              starredOnly
                ? "bg-amber-50 border-amber-300 text-amber-800 font-semibold"
                : "border-neutral-200 bg-white text-neutral-600"
            }`}
          >
            <Star className={`w-3.5 h-3.5 ${starredOnly ? "fill-amber-400 text-amber-500" : ""}`} />
            <span>Starred</span>
          </button>
        </div>
      </div>

      {/* Leads Table */}
      <div className="bg-white rounded-2xl border border-neutral-200 shadow-xs overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-xs text-neutral-600">
            <thead className="bg-[#FAF8F5] border-b border-neutral-200 text-neutral-500 uppercase tracking-wider font-semibold text-[10px]">
              <tr>
                <th className="p-4 w-10"></th>
                <th className="p-4">Client Contact</th>
                <th className="p-4">Requested Item</th>
                <th className="p-4">Quantity</th>
                <th className="p-4">Status</th>
                <th className="p-4">Date</th>
                <th className="p-4 text-right">Action</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-neutral-100">
              {loading ? (
                <tr>
                  <td colSpan={7} className="py-16 text-center">
                    <Loader2 className="w-6 h-6 animate-spin text-[#102A25] mx-auto mb-2" />
                    <p className="text-xs text-neutral-400">Loading incoming leads...</p>
                  </td>
                </tr>
              ) : leads.length === 0 ? (
                <tr>
                  <td colSpan={7} className="py-16 text-center">
                    <Inbox className="w-8 h-8 text-neutral-300 mx-auto mb-2" />
                    <p className="text-sm font-semibold text-neutral-700">No enquiries found</p>
                    <p className="text-xs text-neutral-400 mt-0.5">
                      New quotation requests submitted through public forms will appear here.
                    </p>
                  </td>
                </tr>
              ) : (
                leads.map((lead) => (
                  <tr
                    key={lead.id}
                    className={`hover:bg-[#FAF8F5]/60 transition cursor-pointer ${
                      selectedLeadId === lead.id ? "bg-[#FAF8F5]" : ""
                    }`}
                    onClick={() => openLeadDetail(lead.id)}
                  >
                    {/* Star */}
                    <td className="p-4" onClick={(e) => e.stopPropagation()}>
                      <button
                        onClick={() => handleToggleStar(lead.id, lead.isStarred)}
                        className="text-neutral-300 hover:text-amber-400 transition"
                      >
                        <Star
                          className={`w-4 h-4 ${
                            lead.isStarred ? "fill-amber-400 text-amber-500" : ""
                          }`}
                        />
                      </button>
                    </td>

                    {/* Contact */}
                    <td className="p-4 max-w-xs">
                      <div className="font-bold text-neutral-900 flex items-center gap-1.5">
                        <span>{lead.fullName}</span>
                      </div>
                      {lead.companyName && (
                        <div className="text-[11px] text-neutral-500 flex items-center gap-1 mt-0.5">
                          <Building className="w-3 h-3 text-neutral-400" />
                          <span>{lead.companyName}</span>
                        </div>
                      )}
                      <div className="text-[11px] text-neutral-400 font-mono mt-0.5">
                        {lead.email} • {lead.phone}
                      </div>
                    </td>

                    {/* Product */}
                    <td className="p-4">
                      <div className="font-semibold text-neutral-800">
                        {lead.productName || "General Enquiry"}
                      </div>
                      <div className="text-[11px] text-neutral-400">
                        {lead.category || "General"}
                      </div>
                    </td>

                    {/* Quantity */}
                    <td className="p-4 font-mono text-[11px] text-neutral-600">
                      {lead.quantity || "—"}
                    </td>

                    {/* Status */}
                    <td className="p-4" onClick={(e) => e.stopPropagation()}>
                      <select
                        value={lead.status}
                        onChange={(e) => handleUpdateStatus(lead.id, e.target.value)}
                        className={`text-[11px] font-semibold px-2.5 py-1 rounded-full border cursor-pointer ${getStatusBadge(
                          lead.status
                        )}`}
                      >
                        {statusOptions.map((opt) => (
                          <option key={opt} value={opt}>
                            {opt}
                          </option>
                        ))}
                      </select>
                    </td>

                    {/* Date */}
                    <td className="p-4 text-[11px] text-neutral-400 whitespace-nowrap">
                      {new Date(lead.createdAt).toLocaleDateString("en-IN", {
                        day: "2-digit",
                        month: "short",
                        year: "numeric",
                      })}
                    </td>

                    {/* Action */}
                    <td className="p-4 text-right" onClick={(e) => e.stopPropagation()}>
                      <button
                        onClick={() => openLeadDetail(lead.id)}
                        className="px-2.5 py-1.5 rounded-lg border border-neutral-200 hover:bg-neutral-100 text-[11px] font-semibold text-neutral-700 transition"
                      >
                        Details
                      </button>
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
            Showing <span className="font-semibold">{leads.length ? (page - 1) * 25 + 1 : 0}</span> to{" "}
            <span className="font-semibold">{Math.min(page * 25, totalCount)}</span> of{" "}
            <span className="font-semibold">{totalCount}</span> enquiries
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

      {/* Lead Detail Drawer */}
      {selectedLeadId && (
        <div className="fixed inset-0 z-50 bg-black/60 backdrop-blur-xs flex justify-end animate-in fade-in duration-200">
          <div className="bg-white w-full max-w-lg h-full flex flex-col shadow-2xl animate-in slide-in-from-right duration-200">
            {/* Drawer Header */}
            <div className="p-6 border-b border-neutral-200 flex items-center justify-between bg-[#FAF8F5]">
              <div>
                <span className="text-[10px] font-bold uppercase tracking-wider text-neutral-400">
                  Enquiry ID: {selectedLeadId}
                </span>
                <h3 className="font-bold text-lg text-[#102A25] mt-0.5">
                  {detailLead?.fullName || "Loading details..."}
                </h3>
              </div>
              <button
                onClick={() => setSelectedLeadId(null)}
                className="p-2 rounded-lg text-neutral-400 hover:text-neutral-700"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            {/* Drawer Body */}
            {detailLoading ? (
              <div className="flex-1 flex items-center justify-center">
                <Loader2 className="w-6 h-6 animate-spin text-[#102A25]" />
              </div>
            ) : detailLead ? (
              <div className="flex-1 overflow-y-auto p-6 space-y-6 text-xs text-neutral-700">
                {/* Contact Action Pill */}
                <div className="grid grid-cols-2 gap-3">
                  <a
                    href={`mailto:${detailLead.email}`}
                    className="p-3 rounded-xl border border-neutral-200 hover:border-[#102A25] bg-neutral-50 flex items-center gap-2 font-semibold text-neutral-800 transition"
                  >
                    <Mail className="w-4 h-4 text-[#D9B878]" />
                    <span className="truncate">Email Client</span>
                  </a>

                  <a
                    href={`tel:${detailLead.phone}`}
                    className="p-3 rounded-xl border border-neutral-200 hover:border-[#102A25] bg-neutral-50 flex items-center gap-2 font-semibold text-neutral-800 transition"
                  >
                    <Phone className="w-4 h-4 text-[#D9B878]" />
                    <span className="truncate">Call Client</span>
                  </a>
                </div>

                {/* Info Card */}
                <div className="bg-neutral-50 rounded-2xl p-4 border border-neutral-200 space-y-2.5">
                  <div className="flex justify-between py-1 border-b border-neutral-200/60">
                    <span className="text-neutral-500">Company:</span>
                    <span className="font-semibold">{detailLead.companyName || "N/A"}</span>
                  </div>
                  <div className="flex justify-between py-1 border-b border-neutral-200/60">
                    <span className="text-neutral-500">Email:</span>
                    <span className="font-mono">{detailLead.email}</span>
                  </div>
                  <div className="flex justify-between py-1 border-b border-neutral-200/60">
                    <span className="text-neutral-500">Phone:</span>
                    <span className="font-mono">{detailLead.phone}</span>
                  </div>
                  <div className="flex justify-between py-1 border-b border-neutral-200/60">
                    <span className="text-neutral-500">Product / Category:</span>
                    <span className="font-semibold text-right">
                      {detailLead.productName || "General"} ({detailLead.category || "General"})
                    </span>
                  </div>
                  <div className="flex justify-between py-1 border-b border-neutral-200/60">
                    <span className="text-neutral-500">Estimated Quantity:</span>
                    <span className="font-mono font-bold">{detailLead.quantity || "Not specified"}</span>
                  </div>
                  <div className="flex justify-between py-1">
                    <span className="text-neutral-500">Received Date:</span>
                    <span>{new Date(detailLead.createdAt).toLocaleString("en-IN")}</span>
                  </div>
                </div>

                {/* Customer Message */}
                <div>
                  <h4 className="font-bold text-neutral-900 mb-2 flex items-center gap-1.5">
                    <MessageSquare className="w-3.5 h-3.5 text-neutral-500" />
                    <span>Customer Requirements & Message</span>
                  </h4>
                  <div className="p-4 rounded-xl bg-white border border-neutral-200 leading-relaxed text-neutral-800 whitespace-pre-wrap">
                    {detailLead.message || "No specific message provided."}
                  </div>
                </div>

                {/* Status Switcher */}
                <div>
                  <h4 className="font-bold text-neutral-900 mb-2">Update Pipeline Status</h4>
                  <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
                    {statusOptions.map((st) => (
                      <button
                        key={st}
                        onClick={() => handleUpdateStatus(detailLead.id, st)}
                        className={`p-2 rounded-xl text-[11px] font-semibold border transition text-center ${
                          detailLead.status === st
                            ? "bg-[#102A25] text-white border-[#102A25]"
                            : "bg-white border-neutral-200 text-neutral-700 hover:bg-neutral-50"
                        }`}
                      >
                        {st}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Internal Notes Section */}
                <div>
                  <h4 className="font-bold text-neutral-900 mb-2 flex items-center gap-1.5">
                    <FileText className="w-3.5 h-3.5 text-neutral-500" />
                    <span>Internal Administrative Notes</span>
                  </h4>

                  {/* Add Note Input */}
                  <form onSubmit={handleAddNote} className="flex gap-2 mb-4">
                    <input
                      type="text"
                      value={newNote}
                      onChange={(e) => setNewNote(e.target.value)}
                      placeholder="Add an internal follow-up note..."
                      className="flex-1 px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
                    />
                    <button
                      type="submit"
                      disabled={savingNote || !newNote.trim()}
                      className="px-4 py-2 rounded-xl bg-[#102A25] text-white font-bold hover:bg-[#172B27] disabled:opacity-50 flex items-center gap-1"
                    >
                      {savingNote ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <Send className="w-3.5 h-3.5" />}
                    </button>
                  </form>

                  {/* Notes List */}
                  <div className="space-y-2">
                    {detailLead.notes && detailLead.notes.length > 0 ? (
                      detailLead.notes.map((note) => (
                        <div
                          key={note.id}
                          className="p-3 rounded-xl bg-neutral-50 border border-neutral-200 space-y-1"
                        >
                          <div className="flex items-center justify-between text-[10px] text-neutral-400">
                            <span className="font-semibold text-neutral-600">{note.admin_name}</span>
                            <span>{new Date(note.created_at).toLocaleString("en-IN")}</span>
                          </div>
                          <p className="text-neutral-800 leading-normal">{note.note}</p>
                        </div>
                      ))
                    ) : (
                      <p className="text-neutral-400 italic text-[11px]">No internal notes yet.</p>
                    )}
                  </div>
                </div>
              </div>
            ) : null}
          </div>
        </div>
      )}
    </div>
  );
}
