import React from "react";

export interface ImageProps extends React.ImgHTMLAttributes<HTMLImageElement> {
  fill?: boolean;
  priority?: boolean;
  sizes?: string;
}

export const Image: React.FC<ImageProps> = ({
  fill,
  priority,
  className = "",
  style,
  alt = "",
  loading,
  ...props
}) => {
  const combinedStyle: React.CSSProperties = fill
    ? {
        position: "absolute",
        height: "100%",
        width: "100%",
        inset: 0,
        ...style,
      }
    : { ...style };

  return (
    <img
      alt={alt}
      loading={loading || (priority ? "eager" : "lazy")}
      // @ts-expect-error fetchpriority is a valid HTML attribute in modern browsers
      fetchpriority={priority ? "high" : "auto"}
      className={className}
      style={combinedStyle}
      {...props}
    />
  );
};

export default Image;
