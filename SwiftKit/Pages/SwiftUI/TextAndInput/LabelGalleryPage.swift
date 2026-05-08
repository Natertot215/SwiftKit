import SwiftUI

/// Gallery page scaffold for Label. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct LabelGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Label", api: nil) { Color.clear }
            VariantTile(name: "LabelStyle", api: nil) { Color.clear }
            VariantTile(name: "LabelStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "labelStyle(_:)", api: nil) { Color.clear }
        }
    }
}

extension LabelGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textAndInput.label",
        title: "Label",
        folder: "Text and Input",
        framework: .swiftUI,
        absorbedSymbols: ["Label", "LabelStyle", "LabelStyleConfiguration"],
        blurb: "Label — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(LabelGalleryPage()) }
    )
}
