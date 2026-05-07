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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
