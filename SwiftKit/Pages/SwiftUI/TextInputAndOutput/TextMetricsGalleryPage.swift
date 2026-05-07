import SwiftUI

struct TextMetricsGalleryPage: View {
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

extension TextMetricsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textMetrics",
        title: "Text Metrics",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.baselineoffset(_:)",
            "swiftui.text-input-and-output.kerning(_:)",
            "swiftui.text-input-and-output.tracking(_:)"
        ],
        blurb: "Typographic metrics applied to text: baseline offset shifts vertical position, kerning adjusts spacing between specific character pairs, and tracking adjusts spacing uniformly across the run.",
        signature: "func baselineOffset(_:) · func kerning(_:) · func tracking(_:)",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/kerning(_:).md",
        page: { AnyView(TextMetricsGalleryPage()) }
    )
}

#Preview {
    TextMetricsGalleryPage()
        .frame(width: 900, height: 700)
}
