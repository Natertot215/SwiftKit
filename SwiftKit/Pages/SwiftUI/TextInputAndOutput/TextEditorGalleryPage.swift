import SwiftUI

struct TextEditorGalleryPage: View {
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

extension TextEditorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textEditor",
        title: "TextEditor",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.texteditor"],
        blurb: "A view that can display and edit long-form text.",
        signature: "struct TextEditor",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/texteditor.md",
        page: { AnyView(TextEditorGalleryPage()) }
    )
}

#Preview {
    TextEditorGalleryPage()
        .frame(width: 900, height: 700)
}
