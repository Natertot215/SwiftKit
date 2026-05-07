import SwiftUI

struct AlignmentGalleryPage: View {
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

extension AlignmentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.alignment",
        title: "Alignment",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Aligning views across stacks",
            "Aligning views within a stack",
            "Alignment",
            "AlignmentID",
            "DepthAlignment",
            "HorizontalAlignment",
            "VerticalAlignment",
            "View/alignmentGuide(_:computeValue:)",
            "swiftui.layout-adjustments.aligning-views-across-stacks",
            "swiftui.layout-adjustments.aligning-views-within-a-stack",
            "swiftui.layout-adjustments.alignment",
            "swiftui.layout-adjustments.alignmentguide(_:computevalue:)",
            "swiftui.layout-adjustments.alignmentid",
            "swiftui.layout-adjustments.depthalignment",
            "swiftui.layout-adjustments.horizontalalignment",
            "swiftui.layout-adjustments.verticalalignment",
        ],
        blurb: "The Alignment family covers two-axis Alignment plus the per-axis HorizontalAlignment, VerticalAlignment, and DepthAlignment guides (and the AlignmentID protocol behind them). The alignmentGuide(_:computeValue:) modifier overrides a guide's value on a single view to nudge it relative to its siblings.",
        signature: "Alignment \u{00b7} HorizontalAlignment \u{00b7} VerticalAlignment \u{00b7} DepthAlignment \u{00b7} AlignmentID \u{00b7} alignmentGuide",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/alignment.md",
        page: { AnyView(AlignmentGalleryPage()) }
    )
}

#Preview {
    AlignmentGalleryPage()
        .frame(width: 900, height: 700)
}
