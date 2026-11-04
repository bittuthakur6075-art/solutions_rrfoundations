import { ManufacturingProcess } from "@/types";

export const MANUFACTURING_PROCESSES: ManufacturingProcess[] = [
  {
    id: "laser-cutting-engraving",
    name: "Fiber & CO2 Laser Processing",
    tagline: "Sub-millimeter accuracy on metals, acrylic, and wood",
    description: "Equipped with high-precision fiber lasers for high-contrast permanent annealing on stainless steel, brass, and copper, as well as high-power CO2 laser cutters for acrylic edge polishing and intricate MDF contour cutting.",
    capabilities: [
      "Vector tolerance down to ±0.05mm",
      "Permanent laser annealing without toxic surface inks",
      "Crisp micro-lettering down to 0.6pt font size",
      "Continuous rotary engraving on cylindrical drinkware",
    ],
    materials: ["Stainless Steel 304/316", "Pure Brass & Copper", "Cast Acrylic", "High-Density MDF"],
    icon: "Laser",
    image: "/assets/products/copper-badge-pin-circular-with-clasp.png",
  },
  {
    id: "flatbed-uv-printing",
    name: "Industrial Flatbed UV Printing",
    tagline: "Vibrant, scratch-resistant direct-to-substrate curing",
    description: "High-output piezoelectric flatbed UV printers curing instantaneous UV polymer inks directly onto flat and textured substrates up to 100mm depth. Delivers vibrant CMYK + White + Gloss Clear Varnish layers.",
    capabilities: [
      "1440 x 1200 DPI photographic resolution",
      "Embossed tactile texture and spot gloss varnish",
      "White ink underprinting for rich color fidelity on dark surfaces",
      "Weather-resistant, UV-stable fade proof formulation",
    ],
    materials: ["MDF Boards", "Anodized Aluminum", "Rigid PVC", "Acrylic Panels", "Wood Veneer"],
    icon: "Printer",
    image: "/assets/products/executive-promotional-clipboards.png",
  },
  {
    id: "die-stamping-pin-assembly",
    name: "Die Stamping & Fastening Assembly",
    tagline: "Precision metal forming, electroplating and mechanical attachment",
    description: "Hydraulic die-struck stamping lines combined with automated fastening stations for multi-tier badge pins, heavy-duty safety brooches, and multi-pole neodymium magnetic bars.",
    capabilities: [
      "High-pressure hydraulic coin stamping",
      "Hard & soft synthetic enamel filling",
      "Electroplating baths: antique bronze, mirror gold, nickel, chrome",
      "High-tensile ultrasonic & adhesive mounting",
    ],
    materials: ["Zinc Alloy (Zamak)", "Brass", "Copper", "Neodymium N35/N45", "Hardened Spring Steel"],
    icon: "Hammer",
    image: "/assets/products/customized-metal-name-badges.png",
  },
  {
    id: "dye-sublimation-weaving",
    name: "Dye Sublimation & Textile Finishing",
    tagline: "High-density continuous transfer for lanyards and conference kits",
    description: "Rotary heat calenders and automated ultrasonic ribbon cutters producing high-tensile custom woven and satin lanyards with edge-to-edge sublimation printing.",
    capabilities: [
      "Continuous roll-to-roll heat sublimation",
      "Non-fray ultrasonic sealed edge cut",
      "Reinforced heavy-duty metal crimping",
      "Integrated safety breakaways & buckle attachments",
    ],
    materials: ["Satin Polyester", "High-Density Tubular Woven Ribbons", "Nylon Cord"],
    icon: "Layers",
    image: "/assets/products/event-conference-id-card-kits.png",
  },
];
