---
url: https://developer.apple.com/documentation/swiftui/tabviewstyle
framework: SwiftUI
category: View styles
title: TabViewStyle
kind: protocol
captured: 2026-05-02
---

# TabViewStyle

A specification for the appearance and interaction of a tab view.

## Declaration

```swift
@MainActor @preconcurrency protocol TabViewStyle
```

### Overview

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Conforming Types**: `CarouselTabViewStyle`, `DefaultTabViewStyle`, `GroupedTabViewStyle`, `PageTabViewStyle`, `SidebarAdaptableTabViewStyle`, `TabBarOnlyTabViewStyle`, `VerticalPageTabViewStyle`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Getting built-in tab view styles

- `automatic`
- `sidebarAdaptable`
- `tabBarOnly`
- `grouped`
- `page`
- `page(indexDisplayMode:)`
- `verticalPage`
- `verticalPage(transitionStyle:)`
- `carousel`

### Supporting types

- `DefaultTabViewStyle`
- `SidebarAdaptableTabViewStyle`
- `TabBarOnlyTabViewStyle`
- `GroupedTabViewStyle`
- `PageTabViewStyle`
- `VerticalPageTabViewStyle`
- `CarouselTabViewStyle`

## See Also

- `navigationSplitViewStyle(_:)`
- `NavigationSplitViewStyle`
- `tabViewStyle(_:)`
