import SwiftUI

/// Gallery page scaffold for AttributedString. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct AttributedStringGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "AttributedTextFormatting", api: nil) { Color.clear }
            VariantTile(name: "AttributedTextFormattingDefinition", api: nil) { Color.clear }
            VariantTile(name: "AttributedTextValueConstraint", api: nil) { Color.clear }
            VariantTile(name: "TextAttribute", api: nil) { Color.clear }
            VariantTile(name: "TextRenderer", api: nil) { Color.clear }
            VariantTile(name: "TextVariantPreference", api: nil) { Color.clear }
            VariantTile(name: "FixedTextVariant", api: nil) { Color.clear }
            VariantTile(name: "SizeDependentTextVariant", api: nil) { Color.clear }
            VariantTile(name: "textRenderer(_:)", api: nil) { Color.clear }
        }
    }
}

extension AttributedStringGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textAndInput.attributedString",
        title: "AttributedString",
        folder: "Text and Input",
        framework: .swiftUI,
        absorbedSymbols: ["AttributedString", "AttributedTextFormatting", "AttributedTextFormattingDefinition", "AttributedTextValueConstraint"],
        blurb: "AttributedString — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(AttributedStringGalleryPage()) }
    )
}
