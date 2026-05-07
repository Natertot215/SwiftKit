import SwiftUI

struct UnderlineGalleryPage: View {
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

extension UnderlineGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.underline",
        title: "Underline",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.underline(_:pattern:color:)"],
        blurb: "Applies an underline to the text in this view, with optional pattern and color.",
        signature: "func underline(_ isActive: Bool = true, pattern: Text.LineStyle.Pattern = .solid, color: Color? = nil) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/underline(_:pattern:color:).md",
        page: { AnyView(UnderlineGalleryPage()) }
    )
}

#Preview {
    UnderlineGalleryPage()
        .frame(width: 900, height: 700)
}
