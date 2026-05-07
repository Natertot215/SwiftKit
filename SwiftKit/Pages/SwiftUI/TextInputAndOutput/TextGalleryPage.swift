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
        absorbedSymbols: [
            "swiftui.text-input-and-output.bold(_:)",
            "swiftui.text-input-and-output.italic(_:)",
            "swiftui.text-input-and-output.strikethrough(_:pattern:color:)",
            "swiftui.text-input-and-output.text",
            "swiftui.text-input-and-output.underline(_:pattern:color:)"
        ],
        blurb: "A view that displays one or more lines of read-only text. This page also covers the inline text-decoration modifiers: bold, italic, underline, and strikethrough.",
        signature: "Text \u{00b7} View/bold(_:) \u{00b7} View/italic(_:) \u{00b7} View/underline(_:pattern:color:) \u{00b7} View/strikethrough(_:pattern:color:)",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/text.md",
        page: { AnyView(TextGalleryPage()) }
    )
}

#Preview {
    TextGalleryPage()
        .frame(width: 900, height: 700)
}
