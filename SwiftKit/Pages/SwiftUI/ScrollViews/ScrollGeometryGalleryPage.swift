import SwiftUI

struct ScrollGeometryGalleryPage: View {
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

extension ScrollGeometryGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollGeometry",
        title: "ScrollGeometry",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScrollGeometry",
            "View/onScrollGeometryChange(for:of:action:)"
        ],
        blurb: "A type that defines the geometry of a scroll view (content offset, content size, container size, visible rect). Observe changes via onScrollGeometryChange with a transform to a value type so updates only fire when the projected value changes.",
        signature: "struct ScrollGeometry",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollgeometry.md",
        page: { AnyView(ScrollGeometryGalleryPage()) }
    )
}

#Preview {
    ScrollGeometryGalleryPage()
        .frame(width: 900, height: 700)
}
