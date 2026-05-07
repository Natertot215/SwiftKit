import SwiftUI

// Text input dictation — TextInputDictationActivation, TextInputDictationBehavior,
// and the searchable dictation modifier. Mostly visionOS / iOS surface; document
// as reference and show searchable() with the modifier applied so it compiles.

struct TextInputDictationGalleryPage: View {
    @State private var query: String = ""

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Reference

            ReferenceTile(
                name: "TextInputDictationActivation",
                signature: "struct TextInputDictationActivation",
                note: "How dictation is activated for an inline text input. Values: `.onLook` (visionOS — dictation starts when looking at the field) and `.onSelect` (starts when the field gains focus)."
            )

            ReferenceTile(
                name: "TextInputDictationBehavior",
                signature: "struct TextInputDictationBehavior",
                note: "How dictation behaves once activated. Values: `.automatic`, `.inline(activation:)` (with a TextInputDictationActivation), and `.preventDictation`."
            )

            ReferenceTile(
                name: "searchDictationBehavior(_:)",
                signature: "func searchDictationBehavior(_ behavior: TextInputDictationBehavior) -> some View",
                note: "Configures the dictation behavior for any search fields configured by the searchable modifier. By default, visionOS search fields auto-start dictation when the user looks at the dictation button."
            )

            ReferenceTile(
                name: "Availability",
                signature: "// iOS 17.0+ · visionOS 1.0+",
                note: "Dictation activation modes are visionOS-leaning. The macOS surface is limited — the modifier compiles but has no behavioral effect on the Mac."
            )

            ReferenceTile(
                name: "Common usage",
                signature: ".searchable(text: $query).searchDictationBehavior(.preventDictation)",
                note: "Apply to a view tree that hosts a searchable bar to opt out of automatic look-to-dictate behavior on visionOS."
            )

            // MARK: Compilable example wired to a searchable surface

            VariantTile(
                name: "Wired to .searchable",
                api: ".searchable(text:).searchDictationBehavior(.preventDictation)"
            ) {
                Text("\"\(query.isEmpty ? "—" : query)\"")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
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
