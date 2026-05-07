import SwiftUI

struct LazyGridGalleryPage: View {
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

extension LazyGridGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.lazyGrid",
        title: "LazyGrid",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "LazyVGrid",
            "LazyHGrid",
            "GridItem",
        ],
        blurb: "A container view that arranges its subviews in a grid that grows lazily along one axis. Use LazyVGrid for vertically-scrolling grids and LazyHGrid for horizontal scrolling, configuring tracks with an array of GridItem values.",
        signature: "struct LazyVGrid<Content> where Content : View · struct LazyHGrid<Content> where Content : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/lazyvgrid.md",
        page: { AnyView(LazyGridGalleryPage()) }
    )
}

#Preview {
    LazyGridGalleryPage()
        .frame(width: 900, height: 700)
}
