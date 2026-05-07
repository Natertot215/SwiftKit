import SwiftUI

struct TextCaseGalleryPage: View {
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
