import SwiftUI

struct iOSNavigationTypesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "iOS / iPadOS Navigation Types",
            docPath: "Documentation/SwiftUI/navigation/",
            availability: "iOS 13.0+",
            blurb: """
            These navigation APIs are iOS- or iPadOS-specific. NavigationBarItem and navigationBarTitleDisplayMode(_:) are tied to UIKit's navigation bar — a concept that doesn't exist on macOS. navigationBarBackButtonHidden(_:) controls the back button in a UINavigationController stack. AdaptableTabBarPlacement and defaultAdaptableTabBarPlacement(_:) govern how a TabView adapts between tab bar and sidebar on iPad — the .sidebar option is the basis for TabViewCustomization. TabBarPlacement, TabBarMinimizeBehavior, and TabViewBottomAccessoryPlacement refine the iPad tab bar's position and scroll behavior. isTabBarShowingSections is an environment Bool indicating whether the sidebar is showing tab sections. All compile on macOS but produce no visible effect.
            """,
            signatures: [
                "NavigationBarItem(title:image:action:) — deprecated UIKit bridge",
                ".navigationBarTitleDisplayMode(.large) — iOS/Catalyst only",
                ".navigationBarBackButtonHidden(true) — iOS/Catalyst only",
                "AdaptableTabBarPlacement — .sidebar, .tabBar",
                ".defaultAdaptableTabBarPlacement(.sidebar) — iPadOS modifier",
                "TabBarPlacement — enum for bar position",
                "TabBarMinimizeBehavior — .automatic, .onScrollDown",
                "TabViewBottomAccessoryPlacement",
                "isTabBarShowingSections — environment Bool"
            ],
            notes: [
                "navigationBarTitleDisplayMode and navigationBarBackButtonHidden are @available(iOS, macCatalyst) — unavailable on macOS.",
                "AdaptableTabBarPlacement.sidebar and customizationBehavior(_:for:) were not surfaced as macOS APIs in the macOS 26 SDK."
            ]
        )
    }
}

#Preview {
    iOSNavigationTypesDescribePage()
        .frame(width: 900, height: 700)
}
