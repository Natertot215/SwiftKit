import SwiftUI

struct FixedSizeGalleryPage: View {
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

extension FixedSizeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.fixedSize",
        title: "FixedSize",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/fixedSize()",
            "View/fixedSize(horizontal:vertical:)",
            "swiftui.layout-adjustments.fixedsize()",
            "swiftui.layout-adjustments.fixedsize(horizontal:vertical:)",
        ],
        blurb: "Lock a view to its ideal size in one or both axes, ignoring the parent's size proposal. Useful for letting a Text reach its natural multi-line size or preventing a flexible view from shrinking.",
        signature: "func fixedSize(horizontal: Bool, vertical: Bool) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/fixedsize().md",
        page: { AnyView(FixedSizeGalleryPage()) }
    )
}

#Preview {
    FixedSizeGalleryPage()
        .frame(width: 900, height: 700)
}
