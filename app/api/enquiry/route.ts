import { NextRequest, NextResponse } from "next/server";
import fs from "fs";
import path from "path";
import { z } from "zod";
import { EnquirySchema } from "@/lib/validation/enquiry";
import type { InquirySubmission } from "@/types";

const DATA_FILE_PATH = path.join(process.cwd(), "docs", "enquiry_submissions.json");

export async function GET() {
  try {
    if (fs.existsSync(DATA_FILE_PATH)) {
      const fileContent = fs.readFileSync(DATA_FILE_PATH, "utf8");
      const data = JSON.parse(fileContent);
      if (Array.isArray(data)) {
        return NextResponse.json(data);
      }
    }
    return NextResponse.json([]);
  } catch (err: unknown) {
    console.error("Enquiry fetch error:", err);
    return NextResponse.json([], { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  try {
    const body = await req.json();
    const validatedData = EnquirySchema.parse(body);

    const submission: InquirySubmission = {
      id: `enq_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
      timestamp: new Date().toISOString(),
      ...validatedData,
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
