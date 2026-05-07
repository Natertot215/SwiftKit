import SwiftUI

// WritingToolsBehavior — control the Writing Tools editing experience for
// text and text input. The behavior types themselves don't render; demos
// show TextEditor/TextField with each behavior applied.

struct WritingToolsBehaviorGalleryPage: View {
    @State private var draftText: String = "Compose a quick note here…"

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".writingToolsBehavior(.automatic)",
                api: ".writingToolsBehavior(.automatic)"
            ) {
                TextEditor(text: $draftText)
                    .frame(height: 60)
                    .writingToolsBehavior(.automatic)
            }

            VariantTile(
                name: ".writingToolsBehavior(.complete)",
                api: ".writingToolsBehavior(.complete)"
            ) {
                TextEditor(text: $draftText)
                    .frame(height: 60)
                    .writingToolsBehavior(.complete)
            }

            VariantTile(
                name: ".writingToolsBehavior(.limited)",
                api: ".writingToolsBehavior(.limited)"
            ) {
                TextEditor(text: $draftText)
                    .frame(height: 60)
                    .writingToolsBehavior(.limited)
            }

            VariantTile(
                name: ".writingToolsBehavior(.disabled)",
                api: ".writingToolsBehavior(.disabled)"
            ) {
                TextEditor(text: $draftText)
                    .frame(height: 60)
                    .writingToolsBehavior(.disabled)
            }

            // MARK: Reference

            ReferenceTile(
                name: "WritingToolsBehavior",
                signature: "struct WritingToolsBehavior",
                note: "Controls the Writing Tools editing experience for text and text input. Apply to a TextEditor, TextField, or any container that hosts editable text."
            )

            ReferenceTile(
                name: "Available values",
                signature: ".automatic · .complete · .limited · .disabled",
                note: ".automatic — system default; .complete — full Writing Tools panel; .limited — inline suggestions only; .disabled — opt out entirely. Values exist as static type properties."
            )

            ReferenceTile(
                name: "writingToolsBehavior(_:)",
                signature: "func writingToolsBehavior(_ behavior: WritingToolsBehavior) -> some View",
                note: "Applies the behavior to this view's text-input descendants. Inheritable — set once on a container and every TextField/TextEditor below picks it up."
            )

            ReferenceTile(
                name: "Availability",
                signature: "// macOS 15.0+ / iOS 18.0+",
                note: "Writing Tools shipped alongside Apple Intelligence in macOS 15. On older systems, the modifier compiles but is a no-op."
            )
        }
    }
}

extension WritingToolsBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.writingToolsBehavior",
        title: "WritingToolsBehavior",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.writingtoolsbehavior",
            "swiftui.text-input-and-output.writingtoolsbehavior(_:)"
        ],
        blurb: "Controls the Writing Tools editing experience for text and text input.",
        signature: "struct WritingToolsBehavior · func writingToolsBehavior(_:)",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/writingtoolsbehavior.md",
        page: { AnyView(WritingToolsBehaviorGalleryPage()) }
    )
}

#Preview {
    WritingToolsBehaviorGalleryPage()
        .frame(width: 900, height: 700)
}
