---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/tabbarplacement
framework: SwiftUI
category: Environment values
title: tabBarPlacement
kind: property
captured: 2026-05-02
---

# tabBarPlacement

The current placement of the tab bar.

## Declaration

```swift
var tabBarPlacement: TabBarPlacement? { get }
```

### Discussion

Note that this value is only set within the content views of a `TabView`.

A `nil` value corresponds to an undefined placement.







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `defaultAdaptableTabBarPlacement(_:)`
- `tabViewSidebarHeader(content:)`
- `tabViewSidebarFooter(content:)`
- `tabViewSidebarBottomBar(content:)`
- `AdaptableTabBarPlacement`
- `TabBarPlacement`
- `isTabBarShowingSections`
- `TabBarMinimizeBehavior`
- `TabViewBottomAccessoryPlacement`
