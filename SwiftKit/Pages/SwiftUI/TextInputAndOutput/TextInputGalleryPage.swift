import SwiftUI

struct TextInputGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension TextInputGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textInput",
        title: "Text Input Behavior",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.autocorrectiondisabled(_:)",
            "swiftui.text-input-and-output.keyboardtype(_:)",
            "swiftui.text-input-and-output.scrolldismisseskeyboard(_:)",
            "swiftui.text-input-and-output.textcontenttype(_:)",
            "swiftui.text-input-and-output.textcontenttype(_:)-4dqqb",
            "swiftui.text-input-and-output.textcontenttype(_:)-6fic1",
            "swiftui.text-input-and-output.textcontenttype(_:)-ufdv",
            "swiftui.text-input-and-output.textinputcompletion(_:)",
            "swiftui.text-input-and-output.textinputsuggestions(_:)",
            "swiftui.text-input-and-output.textinputsuggestions(_:content:)",
            "swiftui.text-input-and-output.textinputsuggestions(_:id:content:)",
            "swiftui.text-input-and-output.textinputautocapitalization",
            "swiftui.text-input-and-output.textinputautocapitalization(_:)",
            "swiftui.text-input-and-output.textinputformattingcontrolplacement",
            "swiftui.text-input-and-output.typeselectequivalent(_:)"
        ],
        blurb: "Modifiers and types that shape text-input behavior on TextField, SecureField, TextEditor, and search fields — autocorrection, keyboard type, content-type hints, completions and suggestions, autocapitalization, formatting-control placement, and type-select equivalents.",
        signature: "func autocorrectionDisabled · func keyboardType · func textContentType · func textInputCompletion · func textInputSuggestions · struct TextInputAutocapitalization · struct TextInputFormattingControlPlacement",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/textcontenttype(_:).md",
        page: { AnyView(TextInputGalleryPage()) }
    )
}

#Preview {
    TextInputGalleryPage()
        .frame(width: 900, height: 700)
}
