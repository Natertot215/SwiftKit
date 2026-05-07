import SwiftUI

struct TextInputDictationGalleryPage: View {
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

extension TextInputDictationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textInputDictation",
        title: "Text Input Dictation",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.textinputdictationactivation",
            "swiftui.text-input-and-output.textinputdictationbehavior",
            "swiftui.text-input-and-output.searchdictationbehavior(_:)"
        ],
        blurb: "Configures dictation activation and behavior for text input, including the modifier that wires dictation into searchable fields.",
        signature: "struct TextInputDictationActivation · struct TextInputDictationBehavior · func searchDictationBehavior(_:)",
        availability: nil,
        docPath: "Documentation/SwiftUI/text-input-and-output/textinputdictationbehavior.md",
        page: { AnyView(TextInputDictationGalleryPage()) }
    )
}

#Preview {
    TextInputDictationGalleryPage()
        .frame(width: 900, height: 700)
}
