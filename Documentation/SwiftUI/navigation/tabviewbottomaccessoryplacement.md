---
url: https://developer.apple.com/documentation/swiftui/tabviewbottomaccessoryplacement
framework: SwiftUI
category: Navigation
title: TabViewBottomAccessoryPlacement
kind: enum
captured: 2026-05-02
---

# TabViewBottomAccessoryPlacement

A placement of the bottom accessory in a tab view. You can use this to adjust the content of the accessory view based on the placement.

## Declaration

```swift
enum TabViewBottomAccessoryPlacement
```

### Overview

The following example shows playback controls when the view is inline, and an expanded slider player view when the view is expanded.

```swift
struct MusicPlaybackView: View {
    @Environment(\.tabViewBottomAccessoryPlacement) var placement

    var body: some View {
        switch placement {
        case .inline:
            ControlsPlaybackView()
        case .expanded:
            SliderPlaybackView()
    }
}
```

You can set the `TabView` bottom accessory using `View/tabViewBottomAccessory(content:)`

```swift
TabView {
    Tab("Home", systemImage: "house") {
        HomeView()
    }

    Tab("Alerts", systemImage: "bell") {
        AlertsView()
    }

    TabSection("Categories") {
        Tab("Climate", systemImage: "fan") {
            ClimateView()
        }

        Tab("Lights", systemImage: "lightbulb") {
            LightsView()
        }
    }
}
.tabViewBottomAccessory {
    HomeStatusView()
}
```





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- visionOS 26.0
- watchOS 26.0

## Topics

### Enumeration Cases

- `TabViewBottomAccessoryPlacement.expanded`
- `TabViewBottomAccessoryPlacement.inline`

## See Also

- `defaultAdaptableTabBarPlacement(_:)`
- `tabViewSidebarHeader(content:)`
- `tabViewSidebarFooter(content:)`
- `tabViewSidebarBottomBar(content:)`
- `AdaptableTabBarPlacement`
- `tabBarPlacement`
- `TabBarPlacement`
- `isTabBarShowingSections`
- `TabBarMinimizeBehavior`
