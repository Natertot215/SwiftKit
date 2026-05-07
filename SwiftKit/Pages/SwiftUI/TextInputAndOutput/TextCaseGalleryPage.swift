import SwiftUI

// textCase(_:) — environment override that transforms text case for descendants.

struct TextCaseGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "Default (no override)",
                api: "// no modifier"
            ) {
                Text("Hello, World!")
            }

            VariantTile(
                name: ".textCase(.uppercase)",
                api: ".textCase(.uppercase)"
            ) {
                Text("Hello, World!")
                    .textCase(.uppercase)
            }

            VariantTile(
                name: ".textCase(.lowercase)",
                api: ".textCase(.lowercase)"
            ) {
                Text("Hello, World!")
                    .textCase(.lowercase)
            }

            VariantTile(
                name: ".textCase(nil) — explicit reset",
                api: ".textCase(nil)"
            ) {
                VStack {
                    Text("Hello, World!")
                        .textCase(.lowercase)
                    Text("RESET HERE")
                        .textCase(nil)
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "textCase(_:)",
                signature: "func textCase(_ textCase: Text.Case?) -> some View",
                note: "Sets a transform for the case of text rendered by this view and its descendants. The argument is Text.Case? — pass nil to clear an inherited transform."
            )

            ReferenceTile(
                name: "Text.Case",
                signature: "enum Text.Case { case uppercase, lowercase }",
                note: "The two case transforms supported. There's no .titleCase or .sentenceCase — handle those at the data layer or with a localized formatter."
            )

            ReferenceTile(
                name: "Where it's already applied",
                signature: "// section headers, navigation titles, etc.",
                note: "Some built-in containers (notably grouped List headers) ship with .textCase(.uppercase) baked in. Pass .textCase(nil) inside the header to opt back out."
            )
        }
    }
}

extension TextCaseGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textCase",
        title: "TextCase",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.textcase(_:)"],
        blurb: "Sets a transform for the case of the text contained in this view when displayed.",
        signature: "func textCase(_ textCase: Text.Case?) -> some View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/textcase(_:).md",
        page: { AnyView(TextCaseGalleryPage()) }
    )
}

#Preview {
    TextCaseGalleryPage()
        .frame(width: 900, height: 700)
}
