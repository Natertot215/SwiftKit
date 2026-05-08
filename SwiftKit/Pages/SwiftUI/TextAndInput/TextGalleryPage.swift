import SwiftUI

/// Gallery page scaffold for Text. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct TextGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Text", api: nil) { Color.clear }
            VariantTile(name: "Font", api: nil) { Color.clear }
            VariantTile(name: "LocalizedStringKey", api: nil) { Color.clear }
            VariantTile(name: "ScaledMetric", api: nil) { Color.clear }
            VariantTile(name: "DynamicTypeSize", api: nil) { Color.clear }
            VariantTile(name: "ContentSizeCategory", api: nil) { Color.clear }
            VariantTile(name: "TextAlignment", api: nil) { Color.clear }
            VariantTile(name: "font(_:)", api: nil) { Color.clear }
            VariantTile(name: "fontDesign(_:)", api: nil) { Color.clear }
            VariantTile(name: "fontWeight(_:)", api: nil) { Color.clear }
            VariantTile(name: "fontWidth(_:)", api: nil) { Color.clear }
            VariantTile(name: "bold(_:)", api: nil) { Color.clear }
            VariantTile(name: "italic(_:)", api: nil) { Color.clear }
            VariantTile(name: "monospaced(_:)", api: nil) { Color.clear }
            VariantTile(name: "monospacedDigit()", api: nil) { Color.clear }
            VariantTile(name: "strikethrough(_:pattern:color:)", api: nil) { Color.clear }
            VariantTile(name: "underline(_:pattern:color:)", api: nil) { Color.clear }
            VariantTile(name: "kerning(_:)", api: nil) { Color.clear }
            VariantTile(name: "tracking(_:)", api: nil) { Color.clear }
            VariantTile(name: "baselineOffset(_:)", api: nil) { Color.clear }
            VariantTile(name: "lineSpacing(_:)", api: nil) { Color.clear }
            VariantTile(name: "lineLimit(_:)", api: nil) { Color.clear }
            VariantTile(name: "minimumScaleFactor(_:)", api: nil) { Color.clear }
            VariantTile(name: "allowsTightening(_:)", api: nil) { Color.clear }
            VariantTile(name: "truncationMode(_:)", api: nil) { Color.clear }
            VariantTile(name: "textCase(_:)", api: nil) { Color.clear }
            VariantTile(name: "textScale(_:isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "multilineTextAlignment(_:)", api: nil) { Color.clear }
            VariantTile(name: "flipsForRightToLeftLayoutDirection(_:)", api: nil) { Color.clear }
            VariantTile(name: "dynamicTypeSize(_:)", api: nil) { Color.clear }
            VariantTile(name: "typesettingLanguage(_:isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "TextProxy", api: nil) { Color.clear }
            VariantTile(name: "TimeDataSource", api: nil) { Color.clear }
            VariantTile(name: "SystemFormatStyle", api: nil) { Color.clear }
        }
    }
}

extension TextGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textAndInput.text",
        title: "Text",
        folder: "Text and Input",
        framework: .swiftUI,
        absorbedSymbols: ["Font", "LocalizedStringKey", "Text"],
        blurb: "Text — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(TextGalleryPage()) }
    )
}
