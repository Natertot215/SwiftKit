import SwiftUI

/// Gallery page scaffold for NSTokenField. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct NSTokenFieldGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "NSTokenField", api: nil) { Color.clear }
            VariantTile(name: "NSTokenField.TokenStyle", api: nil) { Color.clear }
            VariantTile(name: "NSTokenFieldDelegate", api: nil) { Color.clear }
            VariantTile(name: "NSTokenFieldCell", api: nil) { Color.clear }
            VariantTile(name: "NSTokenFieldCellDelegate", api: nil) { Color.clear }
        }
    }
}

extension NSTokenFieldGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsTokenField.nsTokenField",
        title: "NSTokenField",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSTokenField", "NSTokenFieldDelegate"],
        blurb: "NSTokenField — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(NSTokenFieldGalleryPage()) }
    )
}
