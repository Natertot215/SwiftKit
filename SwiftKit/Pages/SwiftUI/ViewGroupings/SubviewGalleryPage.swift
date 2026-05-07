import SwiftUI

struct SubviewGalleryPage: View {
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

extension SubviewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewGroupings.subview",
        title: "Subview",
        folder: "View groupings",
        framework: .swiftUI,
        absorbedSymbols: [
            "Subview",
            "SubviewsCollection",
            "SubviewsCollectionSlice",
            "ForEachSubviewCollection"
        ],
        blurb: "An opaque proxy for a single subview of another view, accessed via ForEach(subviews:) or Group(subviews:). Lets a custom container introspect and lay out its content individually.",
        signature: "struct Subview",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/view-groupings/subview.md",
        page: { AnyView(SubviewGalleryPage()) }
    )
}

#Preview {
    SubviewGalleryPage()
        .frame(width: 900, height: 700)
}
