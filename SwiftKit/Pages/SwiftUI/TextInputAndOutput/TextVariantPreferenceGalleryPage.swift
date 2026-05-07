import SwiftUI

struct TextVariantPreferenceGalleryPage: View {
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

extension TextVariantPreferenceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textVariantPreference",
        title: "TextVariantPreference",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.textvariantpreference",
            "swiftui.text-input-and-output.fixedtextvariant",
            "swiftui.text-input-and-output.sizedependenttextvariant"
        ],
        blurb: "A protocol for controlling the size variant of text views, plus its FixedTextVariant and SizeDependentTextVariant conforming types.",
        signature: "protocol TextVariantPreference",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/textvariantpreference.md",
        page: { AnyView(TextVariantPreferenceGalleryPage()) }
    )
}

#Preview {
    TextVariantPreferenceGalleryPage()
        .frame(width: 900, height: 700)
}
