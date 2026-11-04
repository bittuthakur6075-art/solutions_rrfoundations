import * as React from "react";
import { cn } from "@/lib/utils";

interface BadgeProps extends React.HTMLAttributes<HTMLSpanElement> {
  variant?: "champagne" | "forest" | "neutral" | "success" | "outline";
}

export function Badge({ className, variant = "champagne", children, ...props }: BadgeProps) {
  const variantStyles = {
    champagne: "bg-champagne/15 text-forest-900 border border-champagne/40",
    forest: "bg-forest-900 text-ivory border border-forest-800",
    neutral: "bg-line-border/50 text-text-secondary border border-line-border",
    success: "bg-brand-success/10 text-brand-success border border-brand-success/30",
    outline: "bg-transparent text-text-primary border border-line-border",
  };

  return (
    <span
      className={cn(
        "inline-flex items-center text-xs font-semibold px-2.5 py-0.5 rounded-full font-heading tracking-wide",
        variantStyles[variant],
        className
      )}
      {...props}
    >
      {children}
    </span>
  );
}
