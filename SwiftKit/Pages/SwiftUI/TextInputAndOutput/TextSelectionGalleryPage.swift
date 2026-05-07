import SwiftUI

struct TextSelectionGalleryPage: View {
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

extension TextSelectionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textSelection",
        title: "TextSelection",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.textselection",
            "swiftui.text-input-and-output.textselection(_:)",
            "swiftui.text-input-and-output.textselectability",
            "swiftui.text-input-and-output.textselectionaffinity",
            "swiftui.text-input-and-output.textselectionaffinity(_:)",
            "swiftui.text-input-and-output.attributedtextselection"
        ],
        blurb: "Represents a selection of text — the TextSelection value, its plain and attributed flavors, the textSelection(_:) and textSelectionAffinity(_:) modifiers, and the TextSelectability protocol that gates whether selection is allowed.",
        signature: "struct TextSelection · protocol TextSelectability · enum TextSelectionAffinity",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/textselection.md",
        page: { AnyView(TextSelectionGalleryPage()) }
    )
}

#Preview {
    TextSelectionGalleryPage()
        .frame(width: 900, height: 700)
}
