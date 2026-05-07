import SwiftUI

struct FontGalleryPage: View {
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

extension FontGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.font",
        title: "Font",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.font",
            "swiftui.text-input-and-output.font(_:)",
            "swiftui.text-input-and-output.fontdesign(_:)",
            "swiftui.text-input-and-output.fontweight(_:)",
            "swiftui.text-input-and-output.fontwidth(_:)",
            "swiftui.text-input-and-output.applying-custom-fonts-to-text"
        ],
        blurb: "An environment-dependent font, plus the modifiers used to set the default font, design axis, weight, and width on a view.",
        signature: "@frozen struct Font",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/font.md",
        page: { AnyView(FontGalleryPage()) }
    )
}

#Preview {
    FontGalleryPage()
        .frame(width: 900, height: 700)
}
