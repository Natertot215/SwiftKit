---
url: https://developer.apple.com/documentation/swiftui/navigationsplitviewstyle
framework: SwiftUI
category: View styles
title: NavigationSplitViewStyle
kind: protocol
captured: 2026-05-02
---

# NavigationSplitViewStyle

A type that specifies the appearance and interaction of navigation split views within a view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol NavigationSplitViewStyle
```

### Overview

To configure the navigation split view style for a view hierarchy, use the `View/navigationSplitViewStyle(_:)` modifier.

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

**Conforming Types**: `AutomaticNavigationSplitViewStyle`, `BalancedNavigationSplitViewStyle`, `ProminentDetailNavigationSplitViewStyle`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating built-in styles

- `automatic`
- `balanced`
- `prominentDetail`

### Creating custom styles

- `makeBody(configuration:)`
- `NavigationSplitViewStyle.Configuration`
- `Body`

### Supporting types

- `AutomaticNavigationSplitViewStyle`
- `BalancedNavigationSplitViewStyle`
- `ProminentDetailNavigationSplitViewStyle`
- `NavigationSplitViewStyleConfiguration`

## See Also

- `navigationSplitViewStyle(_:)`
- `tabViewStyle(_:)`
- `TabViewStyle`
