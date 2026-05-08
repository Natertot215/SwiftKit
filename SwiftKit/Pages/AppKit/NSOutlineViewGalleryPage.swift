import SwiftUI

/// Gallery page scaffold for NSOutlineView. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct NSOutlineViewGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "NSOutlineView", api: nil) { Color.clear }
            VariantTile(name: "NSOutlineViewDataSource", api: nil) { Color.clear }
            VariantTile(name: "NSOutlineViewDelegate", api: nil) { Color.clear }
        }
    }
}

extension NSOutlineViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsOutlineView.nsOutlineView",
        title: "NSOutlineView",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSOutlineView", "NSOutlineViewDataSource", "NSOutlineViewDelegate"],
        blurb: "NSOutlineView — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(NSOutlineViewGalleryPage()) }
    )
}
