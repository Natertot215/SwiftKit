import SwiftUI

/// Gallery page scaffold for Form. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct FormGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Form", api: nil) { Color.clear }
            VariantTile(name: "FormStyle", api: nil) { Color.clear }
            VariantTile(name: "FormStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "formStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "LabeledContent", api: nil) { Color.clear }
            VariantTile(name: "LabeledContentStyle", api: nil) { Color.clear }
            VariantTile(name: "LabeledContentStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "labeledContentStyle(_:)", api: nil) { Color.clear }
        }
    }
}

extension FormGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.containers.form",
        title: "Form",
        folder: "Containers",
        framework: .swiftUI,
        absorbedSymbols: ["Form", "FormStyle", "FormStyleConfiguration"],
        blurb: "Form — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(FormGalleryPage()) }
    )
}
