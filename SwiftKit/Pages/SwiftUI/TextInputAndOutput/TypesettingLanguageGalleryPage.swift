import SwiftUI

// TypesettingLanguage — disambiguates which language-specific typesetting
// rules apply when the same Unicode characters render differently across
// languages (Chinese vs. Japanese kanji, for example).

struct TypesettingLanguageGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".typesettingLanguage(.automatic)",
                api: ".typesettingLanguage(.automatic)"
            ) {
                Text("Automatic — inherits from locale")
                    .font(.body)
                    .typesettingLanguage(.automatic)
            }

            VariantTile(
                name: ".typesettingLanguage(.explicit(.init(identifier: \"ja\")))",
                api: ".typesettingLanguage(.explicit(Locale.Language(identifier: \"ja\")))"
            ) {
                Text("漢字 — Japanese typesetting")
                    .font(.body)
                    .typesettingLanguage(.explicit(Locale.Language(identifier: "ja")))
            }

            VariantTile(
                name: ".typesettingLanguage(.explicit(.init(identifier: \"zh-Hans\")))",
                api: ".typesettingLanguage(.explicit(Locale.Language(identifier: \"zh-Hans\")))"
            ) {
                Text("汉字 — Simplified Chinese typesetting")
                    .font(.body)
                    .typesettingLanguage(.explicit(Locale.Language(identifier: "zh-Hans")))
            }

            VariantTile(
                name: ".typesettingLanguage(_:isEnabled: false)",
                api: ".typesettingLanguage(.automatic, isEnabled: false)"
            ) {
                Text("Override disabled")
                    .font(.body)
                    .typesettingLanguage(.automatic, isEnabled: false)
            }

            // MARK: Reference

            ReferenceTile(
                name: "TypesettingLanguage",
                signature: "struct TypesettingLanguage",
                note: "Defines how typesetting language is determined for text. Two ways to construct: `.automatic` (inherits from the environment locale) or `.explicit(Locale.Language)` (force a specific language)."
            )

            ReferenceTile(
                name: ".automatic",
                signature: "static var automatic: TypesettingLanguage",
                note: "Default. Resolves to the active locale's language. Use unless you have a reason to override per-view."
            )

            ReferenceTile(
                name: ".explicit(_:)",
                signature: "static func explicit(_ language: Locale.Language) -> TypesettingLanguage",
                note: "Force a specific language for typesetting decisions. Useful in mixed-language layouts where one paragraph should follow Japanese rules even though the app is in English."
            )

            ReferenceTile(
                name: "typesettingLanguage(_:isEnabled:)",
                signature: "func typesettingLanguage(_ language: TypesettingLanguage, isEnabled: Bool = true) -> some View",
                note: "Applies the typesetting language to this view and its descendants. The `isEnabled:` parameter lets you toggle the override without restructuring the view."
            )
        }
    }
}

extension TypesettingLanguageGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.typesettingLanguage",
        title: "TypesettingLanguage",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.typesettinglanguage",
            "swiftui.text-input-and-output.typesettinglanguage(_:isenabled:)"
        ],
        blurb: "Defines how typesetting language is determined for text, plus the modifier used to set it.",
        signature: "struct TypesettingLanguage · func typesettingLanguage(_:isEnabled:)",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/typesettinglanguage.md",
        page: { AnyView(TypesettingLanguageGalleryPage()) }
    )
}

#Preview {
    TypesettingLanguageGalleryPage()
        .frame(width: 900, height: 700)
}
