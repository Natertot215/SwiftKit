import SwiftUI

struct PhysicalMetricGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Reference

            ReferenceTile(
                name: "PhysicalMetric",
                signature: "@propertyWrapper @frozen struct PhysicalMetric<Value>",
                note: "Property wrapper that converts a real-world length measurement into points so views can size themselves to a physical dimension. Most commonly used in visionOS but available on all SwiftUI platforms.",
                badge: "visionOS 1+"
            )

            ReferenceTile(
                name: "Usage — declaration",
                signature: "@PhysicalMetric(from: .meters) var width = 0.5",
                note: "Reads as a CGFloat in points; the underlying conversion uses the system's physical-to-points mapping. The unit is supplied at declaration time as a `UnitLength` value."
            )

            ReferenceTile(
                name: "PhysicalMetricsConverter",
                signature: "struct PhysicalMetricsConverter",
                note: "Performs the same conversion outside a view context. Useful in models, layout helpers, and tests where the property wrapper isn't applicable."
            )

            ReferenceTile(
                name: "Converter — call site",
                signature: "let converter = PhysicalMetricsConverter(...)  ·  converter.convert(_:from:)",
                note: "Construct a converter from an environment or platform-supplied scaling, then call convert(_:from:) for ad-hoc conversions."
            )

            ReferenceTile(
                name: "Platform availability",
                signature: "available: visionOS 1+, macOS 14+ (limited)",
                note: "Designed primarily for visionOS where physical scale is meaningful. On macOS the conversion uses the display's scale; values are approximate and not display-accurate without calibration."
            )

            ReferenceTile(
                name: "Why no live demo?",
                signature: "// physical-to-points mapping is platform/display dependent",
                note: "PhysicalMetric values render at a size that depends on the platform's physical mapping — there is no universally correct on-screen visualization. The reference tiles above describe the API; consult Apple's docs for visionOS-specific guidance."
            )
        }
    }
}

extension PhysicalMetricGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.physicalMetric",
        title: "PhysicalMetric",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["PhysicalMetric", "PhysicalMetricsConverter"],
        blurb: "Property wrapper that converts a physical measurement of length into a value in points — and the converter type that drives the conversion in non-view contexts.",
        signature: "@propertyWrapper @frozen struct PhysicalMetric<Value>",
        availability: nil,
        docPath: "Documentation/SwiftUI/drawing-and-graphics/physicalmetric.md",
        page: { AnyView(PhysicalMetricGalleryPage()) }
    )
}

#Preview {
    PhysicalMetricGalleryPage()
        .frame(width: 900, height: 700)
}
