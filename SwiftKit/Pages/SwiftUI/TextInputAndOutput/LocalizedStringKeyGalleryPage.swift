import SwiftUI

// LocalizedStringKey — implicitly created by Text/Toggle/Picker/etc. when you
// pass a string literal. Demos show the literal-vs-runtime distinction.

struct LocalizedStringKeyGalleryPage: View {
    private let runtimeString: String = "From a String variable"

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Implicit construction from a literal

            VariantTile(
                name: "Text(\"…\") — literal",
                api: "Text(\"Sign in\")"
            ) {
                Text("Sign in")
            }

            VariantTile(
                name: "Text(verbatim:) — bypass localization",
                api: "Text(verbatim: someString)"
            ) {
                Text(verbatim: runtimeString)
            }

            VariantTile(
                name: "Text(_: String) — runtime String, NOT localized",
                api: "Text(runtimeString)"
            ) {
                Text(runtimeString)
            }

            // MARK: Inline interpolation

            VariantTile(
                name: "Inline interpolation",
                api: "Text(\"Hello, \\(name)!\")"
            ) {
                let name = "World"
                Text("Hello, \(name)!")
            }

            // MARK: Markdown via LocalizedStringKey

            VariantTile(
                name: "Markdown in a localized literal",
                api: "Text(\"**Bold** and *italic*\")"
            ) {
                Text("**Bold** and *italic*")
            }

            // MARK: Reference

            ReferenceTile(
                name: "LocalizedStringKey",
                signature: "@frozen struct LocalizedStringKey",
                note: "The key SwiftUI uses to look up a localized string in your strings catalog. Implicitly created when you pass a string literal to Text, Toggle, Picker, Button, Label, etc."
            )

            ReferenceTile(
                name: "ExpressibleByStringLiteral",
                signature: "extension LocalizedStringKey : ExpressibleByStringLiteral",
                note: "The literal initializer is what makes `Text(\"Sign in\")` resolve to a LocalizedStringKey rather than a String. Variables of type String hit the non-localizing String overload instead."
            )

            ReferenceTile(
                name: "Text(verbatim:)",
                signature: "init(verbatim content: String)",
                note: "Explicit non-localizing initializer. Use when displaying user-entered or computed strings that shouldn't be looked up in a strings catalog."
            )
        }
    }
}

extension LocalizedStringKeyGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.localizedStringKey",
        title: "LocalizedStringKey",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.localizedstringkey",
            "swiftui.text-input-and-output.preparing-views-for-localization"
        ],
        blurb: "The key used to look up an entry in a strings file or strings dictionary file. SwiftUI implicitly creates a LocalizedStringKey when you initialize Text, Toggle, or Picker with a string literal.",
        signature: "@frozen struct LocalizedStringKey",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/localizedstringkey.md",
        page: { AnyView(LocalizedStringKeyGalleryPage()) }
    )
}

#Preview {
    LocalizedStringKeyGalleryPage()
        .frame(width: 900, height: 700)
}
