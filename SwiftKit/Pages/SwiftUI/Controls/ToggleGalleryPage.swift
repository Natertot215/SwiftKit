import SwiftUI

/// Gallery page scaffold for Toggle. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ToggleGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Toggle", api: nil) { Color.clear }
            VariantTile(name: "ToggleStyle", api: nil) { Color.clear }
            VariantTile(name: "ToggleStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "toggleStyle(_:)", api: nil) { Color.clear }
        }
    }
}

extension ToggleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controls.toggle",
        title: "Toggle",
        folder: "Controls",
        framework: .swiftUI,
        absorbedSymbols: ["Toggle", "ToggleStyle", "ToggleStyleConfiguration"],
        blurb: "Toggle — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ToggleGalleryPage()) }
    )
}
