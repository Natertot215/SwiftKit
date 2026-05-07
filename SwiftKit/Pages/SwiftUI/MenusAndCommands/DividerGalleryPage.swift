import SwiftUI

struct DividerGalleryPage: View {
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

extension DividerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.menusAndCommands.divider",
        title: "Divider",
        folder: "Menus and commands",
        framework: .swiftUI,
        absorbedSymbols: [
            "Divider"
        ],
        blurb: "A visual element used to separate content. Inside a stack, the divider extends across the minor axis; outside a stack it draws horizontally. Useful as a Menu separator and as a generic in-line rule.",
        signature: "struct Divider",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/menus-and-commands/divider.md",
        page: { AnyView(DividerGalleryPage()) }
    )
}

#Preview {
    DividerGalleryPage()
        .frame(width: 900, height: 700)
}
