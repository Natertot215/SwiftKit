import SwiftUI

/// Gallery page scaffold for NSPathControl. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct NSPathControlGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "NSPathControl", api: nil) { Color.clear }
            VariantTile(name: "NSPathControl.Style", api: nil) { Color.clear }
            VariantTile(name: "NSPathControlDelegate", api: nil) { Color.clear }
            VariantTile(name: "NSPathCell", api: nil) { Color.clear }
            VariantTile(name: "NSPathCellDelegate", api: nil) { Color.clear }
            VariantTile(name: "NSPathComponentCell", api: nil) { Color.clear }
            VariantTile(name: "NSPathControlItem", api: nil) { Color.clear }
        }
    }
}

extension NSPathControlGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsPathControl.nsPathControl",
        title: "NSPathControl",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSPathControl", "NSPathControlDelegate"],
        blurb: "NSPathControl — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(NSPathControlGalleryPage()) }
    )
}
