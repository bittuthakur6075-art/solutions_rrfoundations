import React from "react";
import { Link as RouterLink, LinkProps as RouterLinkProps } from "react-router-dom";

export interface CustomLinkProps extends Omit<React.AnchorHTMLAttributes<HTMLAnchorElement>, "href"> {
  href?: string;
  to?: string;
  children?: React.ReactNode;
}

export const Link = React.forwardRef<HTMLAnchorElement, CustomLinkProps>(
  ({ href, to, children, className, onClick, ...props }, ref) => {
    const destination = href || to || "/";

    // External link or protocol handler
    if (
      destination.startsWith("http://") ||
      destination.startsWith("https://") ||
      destination.startsWith("mailto:") ||
      destination.startsWith("tel:")
    ) {
      return (
        <a
          ref={ref}
          href={destination}
          className={className}
          onClick={onClick}
          {...props}
        >
          {children}
        </a>
      );
    }

    const handleClick = (e: React.MouseEvent<HTMLAnchorElement>) => {
      if (onClick) onClick(e);

      // Handle hash links scrolling smoothly if on the same page
      if (destination.includes("#")) {
        const [path, hash] = destination.split("#");
        const currentPath = window.location.pathname;
        if (path === "" || path === currentPath) {
          const el = document.getElementById(hash);
          if (el) {
            el.scrollIntoView({ behavior: "smooth" });
          }
        }
      }
    };

    return (
      <RouterLink
        ref={ref}
        to={destination}
        className={className}
        onClick={handleClick}
        {...(props as Omit<RouterLinkProps, "to">)}
      >
        {children}
      </RouterLink>
    );
  }
);

Link.displayName = "Link";

export default Link;
