import SwiftUI

struct ListStyleGalleryPage: View {
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

extension ListStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.listStyle",
        title: "ListStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: [
            "ListStyle",
            "View/listStyle(_:)"
        ],
        blurb: "A protocol that describes the behavior and appearance of a list. Conforming types include DefaultListStyle, BorderedListStyle, InsetListStyle, PlainListStyle, GroupedListStyle, InsetGroupedListStyle, and SidebarListStyle.",
        signature: "protocol ListStyle",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-styles/liststyle.md",
        page: { AnyView(ListStyleGalleryPage()) }
    )
}

#Preview {
    ListStyleGalleryPage()
        .frame(width: 900, height: 700)
}
