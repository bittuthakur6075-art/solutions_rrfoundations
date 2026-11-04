import { NextRequest, NextResponse } from "next/server";
import fs from "fs";
import path from "path";
import { z } from "zod";
import { EnquirySchema } from "@/lib/validation/enquiry";
import type { InquirySubmission } from "@/types";

const DATA_FILE_PATH = path.join(process.cwd(), "docs", "enquiry_submissions.json");

// In-memory sliding window rate limiter (max 10 requests / 60 seconds per IP)
const rateLimitMap = new Map<string, { count: number; expiresAt: number }>();

export async function POST(req: NextRequest) {
  try {
    const ip = req.headers.get("x-forwarded-for")?.split(",")[0] || req.ip || "local_client";
    const now = Date.now();
    const rateData = rateLimitMap.get(ip);

    if (rateData && now < rateData.expiresAt) {
      if (rateData.count >= 10) {
        return NextResponse.json(
          { success: false, message: "Too many submission attempts. Please wait a minute before retrying." },
          { status: 429 }
        );
      }
      rateData.count++;
    } else {
      rateLimitMap.set(ip, { count: 1, expiresAt: now + 60000 });
    }

    const body = await req.json();
    const validatedData = EnquirySchema.parse(body);

    // Spam Honeypot Check: If hidden field is filled, silently ignore without saving
    if (validatedData.website_hp && validatedData.website_hp.trim().length > 0) {
      console.warn("Spam honeypot triggered by submission from IP:", ip);
      return NextResponse.json({
        success: true,
        id: "enq_verified",
        message: "Enquiry received successfully.",
      });
    }

    const { website_hp, ...cleanData } = validatedData;

    const submission: InquirySubmission = {
      id: `enq_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
      timestamp: new Date().toISOString(),
      ...cleanData,
      status: "New",
    };

    // Persist to local JSON datastore
    let currentData: InquirySubmission[] = [];
    if (fs.existsSync(DATA_FILE_PATH)) {
      try {
        const fileContent = fs.readFileSync(DATA_FILE_PATH, "utf8");
        const parsed = JSON.parse(fileContent);
        if (Array.isArray(parsed)) {
          currentData = parsed;
        }
      } catch {
        currentData = [];
      }
    }
    currentData.push(submission);
    fs.writeFileSync(DATA_FILE_PATH, JSON.stringify(currentData, null, 2), "utf8");

    console.log("Recorded B2B Enquiry:", submission.id, submission.fullName, submission.productName);

    return NextResponse.json({
      success: true,
      id: submission.id,
      message: "Enquiry received successfully. Our sales desk will follow up shortly.",
    });
  } catch (err: unknown) {
    console.error("Enquiry submission error:", err);
    if (err instanceof z.ZodError) {
      return NextResponse.json(
        { success: false, errors: err.errors },
        { status: 400 }
      );
    }
    return NextResponse.json(
      { success: false, message: "Internal server error" },
      { status: 500 }
    );
  }
}
