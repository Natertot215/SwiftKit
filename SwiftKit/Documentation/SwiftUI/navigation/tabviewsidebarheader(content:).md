---
url: https://developer.apple.com/documentation/swiftui/view/tabviewsidebarheader(content:)
framework: SwiftUI
category: Navigation
title: tabViewSidebarHeader(content:)
kind: method
captured: 2026-05-02
---

# tabViewSidebarHeader(content:)

Adds a custom header to the sidebar of a tab view.

## Declaration

```swift
nonisolated func tabViewSidebarHeader<Content>(@ViewBuilder content: () -> Content) -> some View where Content : View

```

### Discussion

The header appears at the top of the sidebar before any tab labels and can scroll with the content. The header is only visible when the `TabView` is displaying the sidebar.

The following example adds a welcome message to the top of the sidebar:

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
.tabViewSidebarHeader {
    WelcomeHeaderView()
}
```

> **NOTE:** To have a sidebar, a`TabView` needs the `TabViewStyle/sidebarAdaptable` style.







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- visionOS 2.0



## See Also

- `defaultAdaptableTabBarPlacement(_:)`
- `tabViewSidebarFooter(content:)`
- `tabViewSidebarBottomBar(content:)`
- `AdaptableTabBarPlacement`
- `tabBarPlacement`
- `TabBarPlacement`
- `isTabBarShowingSections`
- `TabBarMinimizeBehavior`
- `TabViewBottomAccessoryPlacement`
