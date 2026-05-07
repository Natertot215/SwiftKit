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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
