import SwiftUI

/// Gallery page scaffold for Grid. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct GridGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Grid", api: nil) { Color.clear }
            VariantTile(name: "GridRow", api: nil) { Color.clear }
            VariantTile(name: "GridItem", api: nil) { Color.clear }
            VariantTile(name: "gridCellColumns(_:)", api: nil) { Color.clear }
            VariantTile(name: "gridCellAnchor(_:)", api: nil) { Color.clear }
            VariantTile(name: "gridCellUnsizedAxes(_:)", api: nil) { Color.clear }
            VariantTile(name: "gridColumnAlignment(_:)", api: nil) { Color.clear }
        }
    }
}

extension GridGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.grid",
        title: "Grid",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: ["Grid", "GridItem", "GridRow"],
        blurb: "Grid — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(GridGalleryPage()) }
    )
}
