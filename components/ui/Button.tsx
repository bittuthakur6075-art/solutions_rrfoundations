import * as React from "react";
import Link from "next/link";
import { cn } from "@/lib/utils";

export interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: "primary" | "secondary" | "gold" | "champagne" | "outline" | "ghost" | "link";
  size?: "sm" | "md" | "lg";
  href?: string;
  external?: boolean;
}

export const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant = "gold", size = "md", href, external, children, ...props }, ref) => {
    const baseStyles =
      "inline-flex items-center justify-center font-heading font-semibold transition-all duration-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-gold focus-visible:ring-offset-2 disabled:opacity-50 disabled:pointer-events-none rounded-xl tracking-wide";

    const sizeStyles = {
      sm: "text-xs px-4 py-2 gap-1.5",
      md: "text-sm px-5 py-2.5 gap-2",
      lg: "text-base px-6 py-3.5 gap-2.5",
    };

    const variantStyles = {
      gold:
        "bg-gold text-forest-950 hover:bg-gold-hover active:translate-y-0.5 shadow-gold font-bold",
      champagne:
        "bg-gold text-forest-950 hover:bg-gold-hover active:translate-y-0.5 shadow-gold font-bold",
      primary:
        "bg-gold text-forest-950 hover:bg-gold-hover active:translate-y-0.5 shadow-gold font-bold",
      secondary:
        "bg-forest-800 text-ivory hover:bg-forest-700 active:translate-y-0.5 border border-white/10",
      outline:
        "bg-transparent text-white border border-white/20 hover:border-gold hover:bg-white/5 active:translate-y-0.5",
      ghost:
        "bg-transparent text-white/80 hover:text-white hover:bg-white/5",
      link:
        "bg-transparent text-gold p-0 hover:text-gold-hover underline-offset-4 hover:underline",
    };

    const combinedClassName = cn(baseStyles, sizeStyles[size], variantStyles[variant], className);

    if (href) {
      if (external) {
        return (
          <a
            href={href}
            target="_blank"
            rel="noopener noreferrer"
            className={combinedClassName}
          >
            {children}
          </a>
        );
      }
      return (
        <Link href={href} className={combinedClassName}>
          {children}
        </Link>
      );
    }

    return (
      <button ref={ref} className={combinedClassName} {...props}>
        {children}
      </button>
    );
  }
);

Button.displayName = "Button";
