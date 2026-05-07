import SwiftUI

struct NavigationSplitViewGalleryPage: View {
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

extension NavigationSplitViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationSplitView",
        title: "NavigationSplitView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "NavigationSplitView",
            "View/navigationSplitViewStyle(_:)",
            "View/navigationSplitViewColumnWidth(_:)",
            "View/navigationSplitViewColumnWidth(min:ideal:max:)",
            "NavigationSplitViewVisibility",
            "NavigationSplitViewColumn"
        ],
        blurb: "A view that presents views in two or three columns, where selections in leading columns control presentations in subsequent columns. Companion modifiers configure column style, widths, visibility, and the preferred compact column.",
        signature: "struct NavigationSplitView<Sidebar, Content, Detail> where Sidebar : View, Content : View, Detail : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/navigation/navigationsplitview.md",
        page: { AnyView(NavigationSplitViewGalleryPage()) }
    )
}

#Preview {
    NavigationSplitViewGalleryPage()
        .frame(width: 900, height: 700)
}
