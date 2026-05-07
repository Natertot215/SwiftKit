import SwiftUI

struct AlignmentGuideGalleryPage: View {
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

extension AlignmentGuideGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.alignmentGuide",
        title: "AlignmentGuide",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/alignmentGuide(_:computeValue:)",
            "swiftui.layout-adjustments.alignmentguide(_:computevalue:)",
        ],
        blurb: "Override the value of an alignment guide on a view. Use it to nudge a view's alignment relative to its sibling stack — for example, anchoring text baselines or aligning custom guides across stacks.",
        signature: "func alignmentGuide(_ guide: HorizontalAlignment, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/alignmentguide(_:computevalue:).md",
        page: { AnyView(AlignmentGuideGalleryPage()) }
    )
}

#Preview {
    AlignmentGuideGalleryPage()
        .frame(width: 900, height: 700)
}
