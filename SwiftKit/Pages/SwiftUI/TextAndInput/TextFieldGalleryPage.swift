import SwiftUI

/// Gallery page scaffold for TextField. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct TextFieldGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "TextField", api: nil) { Color.clear }
            VariantTile(name: "SecureField", api: nil) { Color.clear }
            VariantTile(name: "TextFieldStyle", api: nil) { Color.clear }
            VariantTile(name: "textFieldStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "autocorrectionDisabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "keyboardType(_:)", api: nil) { Color.clear }
            VariantTile(name: "textInputAutocapitalization(_:)", api: nil) { Color.clear }
            VariantTile(name: "textContentType(_:)", api: nil) { Color.clear }
            VariantTile(name: "submitLabel(_:)", api: nil) { Color.clear }
            VariantTile(name: "onSubmit(of:_:)", api: nil) { Color.clear }
            VariantTile(name: "submitScope(_:)", api: nil) { Color.clear }
            VariantTile(name: "textInputCompletion(_:)", api: nil) { Color.clear }
            VariantTile(name: "textInputSuggestions(_:)", api: nil) { Color.clear }
            VariantTile(name: "writingToolsBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "searchDictationBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "scrollDismissesKeyboard(_:)", api: nil) { Color.clear }
            VariantTile(name: "TextInputAutocapitalization", api: nil) { Color.clear }
            VariantTile(name: "TextInputDictationActivation", api: nil) { Color.clear }
            VariantTile(name: "TextInputDictationBehavior", api: nil) { Color.clear }
            VariantTile(name: "TextInputFormattingControlPlacement", api: nil) { Color.clear }
            VariantTile(name: "SubmitLabel", api: nil) { Color.clear }
            VariantTile(name: "SubmitTriggers", api: nil) { Color.clear }
            VariantTile(name: "WritingToolsBehavior", api: nil) { Color.clear }
        }
    }
}

extension TextFieldGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textAndInput.textField",
        title: "TextField",
        folder: "Text and Input",
        framework: .swiftUI,
        absorbedSymbols: ["SecureField", "TextField", "TextFieldStyle"],
        blurb: "TextField — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(TextFieldGalleryPage()) }
    )
}
