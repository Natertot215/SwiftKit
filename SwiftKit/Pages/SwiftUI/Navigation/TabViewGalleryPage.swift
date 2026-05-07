import SwiftUI

struct TabViewGalleryPage: View {
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

extension TabViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.tabView",
        title: "TabView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "AdaptableTabBarPlacement",
            "AnyTabContent",
            "Enhancing your app content with tab navigation",
            "EnvironmentValues/isTabBarShowingSections",
            "EnvironmentValues/tabBarPlacement",
            "Tab",
            "TabBarMinimizeBehavior",
            "TabBarPlacement",
            "TabContent",
            "TabContentBuilder",
            "TabCustomizationBehavior",
            "TabPlacement",
            "TabRole",
            "TabSection",
            "TabView",
            "TabViewBottomAccessoryPlacement",
            "TabViewCustomization",
            "View/defaultAdaptableTabBarPlacement(_:)",
            "View/sectionActions(content:)",
            "View/tabItem(_:)",
            "View/tabViewCustomization(_:)",
            "View/tabViewSidebarBottomBar(content:)",
            "View/tabViewSidebarFooter(content:)",
            "View/tabViewSidebarHeader(content:)",
            "View/tabViewStyle(_:)"
        ],
        blurb: "The TabView family: the container plus its Tab / TabSection / TabContent builders, TabViewCustomization for persisted user reordering, and the placement / behavior enums (TabRole, TabPlacement, AdaptableTabBarPlacement, TabBarMinimizeBehavior, TabViewBottomAccessoryPlacement) that drive sidebar-tab and tab-bar surfaces across macOS and iPadOS.",
        signature: "TabView · Tab · TabSection · TabContent · TabViewCustomization · TabRole · TabPlacement · AdaptableTabBarPlacement · TabBarMinimizeBehavior · TabViewBottomAccessoryPlacement",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/navigation/tabview.md",
        page: { AnyView(TabViewGalleryPage()) }
    )
}

#Preview {
    TabViewGalleryPage()
        .frame(width: 900, height: 700)
}
