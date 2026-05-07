import SwiftUI

struct AttributedTextFormattingGalleryPage: View {
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

extension AttributedTextFormattingGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.attributedTextFormatting",
        title: "AttributedTextFormatting",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.attributedtextformatting",
            "swiftui.text-input-and-output.attributedtextformattingdefinition",
            "swiftui.text-input-and-output.attributedtextvalueconstraint"
        ],
        blurb: "A namespace for types related to attributed text formatting definitions, plus the AttributedTextFormattingDefinition protocol and the AttributedTextValueConstraint protocol.",
        signature: "enum AttributedTextFormatting · protocol AttributedTextFormattingDefinition · protocol AttributedTextValueConstraint",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/attributedtextformatting.md",
        page: { AnyView(AttributedTextFormattingGalleryPage()) }
    )
}

#Preview {
    AttributedTextFormattingGalleryPage()
        .frame(width: 900, height: 700)
}
