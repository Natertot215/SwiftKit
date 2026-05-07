import SwiftUI

struct NavigationSplitViewStyleGalleryPage: View {
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

extension NavigationSplitViewStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.navigationSplitViewStyle",
        title: "NavigationSplitViewStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: ["NavigationSplitViewStyle"],
        blurb: "A type that specifies the appearance and interaction of navigation split views within a view hierarchy. Apply with View/navigationSplitViewStyle(_:); built-in conformers include AutomaticNavigationSplitViewStyle, BalancedNavigationSplitViewStyle, and ProminentDetailNavigationSplitViewStyle.",
        signature: "@MainActor @preconcurrency protocol NavigationSplitViewStyle",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/view-styles/navigationsplitviewstyle.md",
        page: { AnyView(NavigationSplitViewStyleGalleryPage()) }
    )
}

#Preview {
    NavigationSplitViewStyleGalleryPage()
        .frame(width: 900, height: 700)
}
