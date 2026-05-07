import SwiftUI

struct TabViewStyleGalleryPage: View {
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

extension TabViewStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.tabViewStyle",
        title: "TabViewStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: ["TabViewStyle"],
        blurb: "A specification for the appearance and interaction of a tab view. Built-in conformers include DefaultTabViewStyle, PageTabViewStyle, SidebarAdaptableTabViewStyle, and TabBarOnlyTabViewStyle.",
        signature: "@MainActor @preconcurrency protocol TabViewStyle",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/view-styles/tabviewstyle.md",
        page: { AnyView(TabViewStyleGalleryPage()) }
    )
}

#Preview {
    TabViewStyleGalleryPage()
        .frame(width: 900, height: 700)
}
