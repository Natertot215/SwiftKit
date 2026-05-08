import SwiftUI

/// Gallery page scaffold for Picker. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct PickerGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Picker", api: nil) { Color.clear }
            VariantTile(name: "PickerStyle", api: nil) { Color.clear }
            VariantTile(name: "pickerStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "paletteSelectionEffect(_:)", api: nil) { Color.clear }
            VariantTile(name: "horizontalRadioGroupLayout()", api: nil) { Color.clear }
            VariantTile(name: "defaultWheelPickerItemHeight(_:)", api: nil) { Color.clear }
            VariantTile(name: "PaletteSelectionEffect", api: nil) { Color.clear }
        }
    }
}

extension PickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controls.picker",
        title: "Picker",
        folder: "Controls",
        framework: .swiftUI,
        absorbedSymbols: ["Picker", "PickerStyle", "pickerStyle"],
        blurb: "Picker — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(PickerGalleryPage()) }
    )
}
