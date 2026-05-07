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
            "Alignment",
            "HorizontalAlignment",
            "VerticalAlignment",
            "DepthAlignment",
            "AlignmentID",
            "Aligning views within a stack",
            "Aligning views across stacks",
            "swiftui.layout-adjustments.aligning-views-within-a-stack",
            "swiftui.layout-adjustments.aligning-views-across-stacks",
            "swiftui.layout-adjustments.alignment",
            "swiftui.layout-adjustments.horizontalalignment",
            "swiftui.layout-adjustments.verticalalignment",
            "swiftui.layout-adjustments.depthalignment",
            "swiftui.layout-adjustments.alignmentid",
        ],
        blurb: "An alignment in both axes, plus the per-axis HorizontalAlignment, VerticalAlignment, and DepthAlignment guides that compose it. Stacks, ZStack overlays, and frame use Alignment values to direct child placement.",
        signature: "@frozen struct Alignment",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/alignment.md",
        page: { AnyView(AlignmentGalleryPage()) }
    )
}

#Preview {
    AlignmentGalleryPage()
        .frame(width: 900, height: 700)
}
