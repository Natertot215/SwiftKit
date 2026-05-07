import SwiftUI

struct ScrollPositionGalleryPage: View {
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

extension ScrollPositionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollPosition",
        title: "ScrollPosition",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScrollPosition",
            "View/scrollPosition(_:anchor:)",
            "View/scrollPosition(id:anchor:)"
        ],
        blurb: "Defines the semantic position of a scroll view within its content. Pair with the scrollPosition modifier to bind position by view identity or by concrete offset.",
        signature: "struct ScrollPosition",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollposition.md",
        page: { AnyView(ScrollPositionGalleryPage()) }
    )
}

#Preview {
    ScrollPositionGalleryPage()
        .frame(width: 900, height: 700)
}
