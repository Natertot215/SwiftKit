import SwiftUI

struct TextRendererGalleryPage: View {
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

extension TextRendererGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textRenderer",
        title: "TextRenderer",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.textrenderer",
            "swiftui.text-input-and-output.textrenderer(_:)",
            "swiftui.text-input-and-output.textproxy",
            "swiftui.text-input-and-output.textattribute",
            "swiftui.text-input-and-output.creating-visual-effects-with-swiftui"
        ],
        blurb: "A value that can replace the default text view rendering behavior, plus the textRenderer(_:) modifier, the TextProxy used by custom renderers, and TextAttribute values that text renderers can query.",
        signature: "protocol TextRenderer : Animatable · struct TextProxy · protocol TextAttribute",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/textrenderer.md",
        page: { AnyView(TextRendererGalleryPage()) }
    )
}

#Preview {
    TextRendererGalleryPage()
        .frame(width: 900, height: 700)
}
