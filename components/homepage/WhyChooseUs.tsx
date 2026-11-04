import React from "react";
import { ShieldCheck, Factory, Ruler, Clock, Truck, Boxes } from "lucide-react";

export function WhyChooseUs() {
  const points = [
    {
      icon: Factory,
      title: "Direct Physical Manufacturer",
      desc: "Zero intermediate trading markup. Deal directly with the engineers and operators running the production floor.",
    },
    {
      icon: ShieldCheck,
      title: "Verified Material Grades",
      desc: "Authentic 304/316 grade stainless steel, genuine copper alloys, calibrated high-density MDF, and fade-proof UV cured inks.",
    },
    {
      icon: Ruler,
      title: "Precision Sizing & Tooling",
      desc: "In-house vector tooling and die cutting. Custom shapes, custom badge dimensions, and bespoke backings tailored to your uniform specs.",
    },
    {
      icon: Clock,
      title: "Reliable Institutional Timelines",
      desc: "Strict adherence to event deadlines and procurement cycles. Pre-production physical samples dispatched for sign-off prior to mass fabrication.",
    },
    {
      icon: Truck,
      title: "Pan-India Secure Distribution",
      desc: "Heavy-duty carton packaging with individual scratch-resistant sleeves. Doorstep delivery across industrial corridors and corporate hubs.",
    },
    {
      icon: Boxes,
      title: "Flexible Batch Scalability",
      desc: "Agile batch manufacturing supporting sample pilot runs of 50 units up to enterprise rollouts exceeding 50,000+ units.",
    },
  ];

  return (
    <section className="py-20 sm:py-28 bg-[#F7F4EE] text-[#182A25] border-b border-[#E8E2D7]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header */}
        <div className="text-center max-w-3xl mx-auto mb-16">
          <div className="flex items-center justify-center gap-2 mb-2">
            <span className="w-5 h-[1.5px] bg-[#D9B878]" />
            <span className="text-[#B89650] font-heading font-bold text-xs uppercase tracking-[0.2em]">
              THE MANUFACTURING STANDARD
            </span>
            <span className="w-5 h-[1.5px] bg-[#D9B878]" />
          </div>
          <h2 className="font-serif text-3xl sm:text-4xl lg:text-5xl text-[#182A25] tracking-tight">
            Why Choose RR Foundations.
          </h2>
          <p className="text-[#5C6E66] text-base sm:text-lg mt-3">
            Engineered for corporate procurement teams, institutions, and merchandise buyers who demand accountability and quality.
          </p>
        </div>

        {/* Features Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {points.map((pt, i) => {
            const Icon = pt.icon;
            return (
              <div
                key={i}
                className="bg-white p-8 rounded-2xl border border-[#E8E2D7] hover:border-[#D9B878] shadow-card hover:shadow-luxury transition-all duration-300"
              >
                <div className="w-12 h-12 rounded-xl bg-[#102A25] text-[#D9B878] flex items-center justify-center mb-5 shadow-sm">
                  <Icon className="w-6 h-6" strokeWidth={1.75} />
                </div>
                <h3 className="font-heading font-bold text-lg text-[#182A25] mb-2">
                  {pt.title}
                </h3>
                <p className="text-sm text-[#5C6E66] leading-relaxed">
                  {pt.desc}
                </p>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
