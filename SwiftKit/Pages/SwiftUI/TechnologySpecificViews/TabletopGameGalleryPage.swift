import SwiftUI

struct TabletopGameGalleryPage: View {
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

extension TabletopGameGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.tabletopGame",
        title: "TabletopGame",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/tabletopGame(_:parent:automaticUpdate:)",
            "View/tabletopGame(_:parent:automaticUpdate:interaction:)"
        ],
        blurb: "TabletopKit modifier that attaches a TabletopGame to a view, optionally controlling automatic updates and interaction handling.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/tabletopgame(_:parent:automaticupdate:).md",
        page: { AnyView(TabletopGameGalleryPage()) }
    )
}

#Preview {
    TabletopGameGalleryPage()
        .frame(width: 900, height: 700)
}
