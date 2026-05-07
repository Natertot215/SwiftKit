import SwiftUI

struct BoldGalleryPage: View {
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

extension BoldGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.bold",
        title: "Bold",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.bold(_:)"],
        blurb: "Applies a bold font weight to the text in this view.",
        signature: "func bold(_ isActive: Bool = true) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/bold(_:).md",
        page: { AnyView(BoldGalleryPage()) }
    )
}

#Preview {
    BoldGalleryPage()
        .frame(width: 900, height: 700)
}
