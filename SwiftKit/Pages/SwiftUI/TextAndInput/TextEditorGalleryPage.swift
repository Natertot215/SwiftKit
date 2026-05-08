import SwiftUI

/// Gallery page scaffold for TextEditor. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct TextEditorGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "TextEditor", api: nil) { Color.clear }
            VariantTile(name: "TextEditorStyle", api: nil) { Color.clear }
            VariantTile(name: "TextEditorStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "textEditorStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "TextSelection", api: nil) { Color.clear }
            VariantTile(name: "AttributedTextSelection", api: nil) { Color.clear }
            VariantTile(name: "TextSelectionAffinity", api: nil) { Color.clear }
            VariantTile(name: "textSelection(_:)", api: nil) { Color.clear }
            VariantTile(name: "textSelectionAffinity(_:)", api: nil) { Color.clear }
            VariantTile(name: "TextSelectability", api: nil) { Color.clear }
            VariantTile(name: "typeSelectEquivalent(_:)", api: nil) { Color.clear }
        }
    }
}

extension TextEditorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textAndInput.textEditor",
        title: "TextEditor",
        folder: "Text and Input",
        framework: .swiftUI,
        absorbedSymbols: ["TextEditor", "TextEditorStyle", "TextEditorStyleConfiguration"],
        blurb: "TextEditor — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(TextEditorGalleryPage()) }
    )
}
