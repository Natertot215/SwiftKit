import SwiftUI

struct SpacerGalleryPage: View {
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

extension SpacerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.spacer",
        title: "Spacer",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Spacer",
        ],
        blurb: "A flexible space that expands along the major axis of its containing stack — or on both axes when used outside one. Use spacers to push siblings apart or anchor content to one edge of a stack.",
        signature: "@frozen struct Spacer",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/spacer.md",
        page: { AnyView(SpacerGalleryPage()) }
    )
}

#Preview {
    SpacerGalleryPage()
        .frame(width: 900, height: 700)
}
