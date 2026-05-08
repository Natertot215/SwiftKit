import SwiftUI

/// Gallery page scaffold for NSDatePicker. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct NSDatePickerGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "NSDatePicker", api: nil) { Color.clear }
            VariantTile(name: "NSDatePicker.Style", api: nil) { Color.clear }
            VariantTile(name: "NSDatePicker.Mode", api: nil) { Color.clear }
            VariantTile(name: "NSDatePicker.ElementFlags", api: nil) { Color.clear }
            VariantTile(name: "NSDatePickerCell", api: nil) { Color.clear }
            VariantTile(name: "NSDatePickerCellDelegate", api: nil) { Color.clear }
        }
    }
}

extension NSDatePickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsDatePicker.nsDatePicker",
        title: "NSDatePicker",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSDatePicker"],
        blurb: "NSDatePicker — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(NSDatePickerGalleryPage()) }
    )
}
