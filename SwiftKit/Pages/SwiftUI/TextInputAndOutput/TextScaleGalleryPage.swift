import SwiftUI

struct TextScaleGalleryPage: View {
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

extension TextScaleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textScale",
        title: "TextScale",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.textscale(_:isenabled:)"],
        blurb: "Applies a text scale to text in the view.",
        signature: "func textScale(_ scale: Text.Scale, isEnabled: Bool = true) -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/textscale(_:isenabled:).md",
        page: { AnyView(TextScaleGalleryPage()) }
    )
}

#Preview {
    TextScaleGalleryPage()
        .frame(width: 900, height: 700)
}
