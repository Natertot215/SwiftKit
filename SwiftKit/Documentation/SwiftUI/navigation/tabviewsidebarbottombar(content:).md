---
url: https://developer.apple.com/documentation/swiftui/view/tabviewsidebarbottombar(content:)
framework: SwiftUI
category: Navigation
title: tabViewSidebarBottomBar(content:)
kind: method
captured: 2026-05-02
---

# tabViewSidebarBottomBar(content:)

Adds a custom bottom bar to the sidebar of a tab view.

## Declaration

```swift
nonisolated func tabViewSidebarBottomBar<Content>(@ViewBuilder content: () -> Content) -> some View where Content : View

```

### Discussion

The content is pinned at the bottom of the sidebar, so it’s always visible when the sidebar is visible and doesn’t scroll with the content.

The following example adds an account button to the bottom of the sidebar:

```swift
TabView {
    Tab("Home", systemImage: "house") {
        HomeView()
    }

    Tab("Alerts", systemImage: "bell") {
        AlertsView()
    }

    Tab("Browse", systemImage: "list.bullet") {
        MyBrowseView()
    }
}
.tabViewStyle(.sidebarAdaptable)
.tabViewSidebarBottomBar {
    AccountButton()
}
```







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- visionOS 2.0



## See Also

- `defaultAdaptableTabBarPlacement(_:)`
- `tabViewSidebarHeader(content:)`
- `tabViewSidebarFooter(content:)`
- `AdaptableTabBarPlacement`
- `tabBarPlacement`
- `TabBarPlacement`
- `isTabBarShowingSections`
- `TabBarMinimizeBehavior`
- `TabViewBottomAccessoryPlacement`
