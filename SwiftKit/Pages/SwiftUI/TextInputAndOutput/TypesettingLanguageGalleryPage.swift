import SwiftUI

struct TypesettingLanguageGalleryPage: View {
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
