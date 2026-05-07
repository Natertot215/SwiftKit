import SwiftUI

struct ItalicGalleryPage: View {
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

extension ItalicGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.italic",
        title: "Italic",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.italic(_:)"],
        blurb: "Applies italics to the text in this view.",
        signature: "func italic(_ isActive: Bool = true) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/italic(_:).md",
        page: { AnyView(ItalicGalleryPage()) }
    )
}

#Preview {
    ItalicGalleryPage()
        .frame(width: 900, height: 700)
}
