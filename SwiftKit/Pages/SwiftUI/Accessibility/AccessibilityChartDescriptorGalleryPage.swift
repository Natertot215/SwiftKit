import SwiftUI

struct AccessibilityChartDescriptorGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Reference (no live demo — protocol-driven)

            ReferenceTile(
                name: "AXChartDescriptorRepresentable",
                signature: "protocol AXChartDescriptorRepresentable { func makeChartDescriptor() -> AXChartDescriptor }",
                note: "Conform on your own type and return an AXChartDescriptor describing axes, data series, and content direction. SwiftUI hands the descriptor to VoiceOver and the Audio Graph feature."
            )

            ReferenceTile(
                name: "AXChartDescriptor",
                signature: "import Accessibility  // class AXChartDescriptor",
                note: "Lives in the Accessibility framework, not SwiftUI. Holds title, summary, axes (AXNumericDataAxisDescriptor / AXCategoricalDataAxisDescriptor), and series of AXDataPoint values."
            )

            ReferenceTile(
                name: "Audio Graph",
                signature: "Activate via Rotor → Audio Graph (VoiceOver).",
                note: "Once a descriptor is attached, VoiceOver users can play data sonifications, hear axis bounds, and step through individual data points."
            )

            ReferenceTile(
                name: "Pair with Swift Charts",
                signature: ".accessibilityChartDescriptor(MyDescriptor(data: data))",
                note: "Apply to the Chart view itself. Swift Charts already supplies a sensible default — implement the protocol when you need custom titles, summary phrasing, or curated data points."
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Required for Audio Graph support on custom chart renderings.",
                note: "If you draw the chart with Canvas, GeometryReader, or Path rather than Swift Charts, this modifier is the only way to expose the data structure to assistive tech."
            )
        }
    }
}

extension AccessibilityChartDescriptorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityChartDescriptor",
        title: "AccessibilityChartDescriptor",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityChartDescriptor(_:)",
            "AXChartDescriptorRepresentable",
            "swiftui.accessible-descriptions.accessibilitychartdescriptor(_:)",
            "swiftui.accessible-descriptions.axchartdescriptorrepresentable"
        ],
        blurb: "Attaches an AXChartDescriptor to a chart so VoiceOver and the Audio Graph feature can navigate axes, summarize trends, and play data sonifications.",
        signature: "func accessibilityChartDescriptor<R>(_ representable: R) -> some View where R : AXChartDescriptorRepresentable",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilitychartdescriptor(_:).md",
        page: { AnyView(AccessibilityChartDescriptorGalleryPage()) }
    )
}

#Preview {
    AccessibilityChartDescriptorGalleryPage()
        .frame(width: 900, height: 700)
}
