import SwiftUI

/// Gallery page scaffold for NavigationSplitView. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct NavigationSplitViewGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "NavigationSplitView", api: nil) { Color.clear }
            VariantTile(name: "NavigationSplitViewVisibility", api: nil) { Color.clear }
            VariantTile(name: "NavigationSplitViewColumn", api: nil) { Color.clear }
            VariantTile(name: "HSplitView", api: nil) { Color.clear }
            VariantTile(name: "VSplitView", api: nil) { Color.clear }
            VariantTile(name: "navigationSplitViewStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "navigationSplitViewColumnWidth(_:)", api: nil) { Color.clear }
            VariantTile(name: "NavigationSplitViewStyle", api: nil) { Color.clear }
        }
    }
}

extension NavigationSplitViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationSplitView",
        title: "NavigationSplitView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: ["NavigationSplitView", "NavigationSplitViewColumn", "NavigationSplitViewVisibility"],
        blurb: "NavigationSplitView — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(NavigationSplitViewGalleryPage()) }
    )
}
