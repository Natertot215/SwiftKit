import SwiftUI

/// Gallery page scaffold for LazyGrid. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct LazyGridGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "LazyVGrid", api: nil) { Color.clear }
            VariantTile(name: "LazyHGrid", api: nil) { Color.clear }
            VariantTile(name: "GridItem", api: nil) { Color.clear }
            VariantTile(name: "PinnedScrollableViews", api: nil) { Color.clear }
        }
    }
}

extension LazyGridGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.lazyGrid",
        title: "LazyGrid",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: ["GridItem", "LazyGrid", "LazyHGrid", "LazyVGrid"],
        blurb: "LazyGrid — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(LazyGridGalleryPage()) }
    )
}
