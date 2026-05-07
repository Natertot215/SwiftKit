import SwiftUI

struct TextGalleryPage: View {
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

extension TextGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.text",
        title: "Text",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.text"],
        blurb: "A view that displays one or more lines of read-only text.",
        signature: "@frozen struct Text",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/text.md",
        page: { AnyView(TextGalleryPage()) }
    )
}

#Preview {
    TextGalleryPage()
        .frame(width: 900, height: 700)
}
