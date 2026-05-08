import SwiftUI

/// Gallery page scaffold for TabView. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct TabViewGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "TabView", api: nil) { Color.clear }
            VariantTile(name: "Tab", api: nil) { Color.clear }
            VariantTile(name: "TabSection", api: nil) { Color.clear }
            VariantTile(name: "TabContentBuilder", api: nil) { Color.clear }
            VariantTile(name: "TabCustomizationBehavior", api: nil) { Color.clear }
            VariantTile(name: "TabBarPlacement", api: nil) { Color.clear }
            VariantTile(name: "TabBarMinimizeBehavior", api: nil) { Color.clear }
            VariantTile(name: "TabViewCustomization", api: nil) { Color.clear }
            VariantTile(name: "TabRole", api: nil) { Color.clear }
            VariantTile(name: "TabPlacement", api: nil) { Color.clear }
            VariantTile(name: "TabViewBottomAccessoryPlacement", api: nil) { Color.clear }
            VariantTile(name: "AdaptableTabBarPlacement", api: nil) { Color.clear }
            VariantTile(name: "AnyTabContent", api: nil) { Color.clear }
            VariantTile(name: "TabContent", api: nil) { Color.clear }
            VariantTile(name: "tabItem(_:)", api: nil) { Color.clear }
            VariantTile(name: "tabViewStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "tabViewCustomization(_:)", api: nil) { Color.clear }
            VariantTile(name: "tabViewSidebarHeader(content:)", api: nil) { Color.clear }
            VariantTile(name: "tabViewSidebarFooter(content:)", api: nil) { Color.clear }
            VariantTile(name: "tabViewSidebarBottomBar(content:)", api: nil) { Color.clear }
            VariantTile(name: "defaultAdaptableTabBarPlacement(_:)", api: nil) { Color.clear }
            VariantTile(name: "TabViewStyle", api: nil) { Color.clear }
        }
    }
}

extension TabViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.tabView",
        title: "TabView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: ["Tab", "TabSection", "TabView"],
        blurb: "TabView — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(TabViewGalleryPage()) }
    )
}
