import SwiftUI

/// Gallery page scaffold for ColorPicker. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ColorPickerGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "ColorPicker", api: nil) { Color.clear }
        }
    }
}

extension ColorPickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controls.colorPicker",
        title: "ColorPicker",
        folder: "Controls",
        framework: .swiftUI,
        absorbedSymbols: ["ColorPicker"],
        blurb: "ColorPicker — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ColorPickerGalleryPage()) }
    )
}
