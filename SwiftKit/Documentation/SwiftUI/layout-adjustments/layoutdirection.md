---
url: https://developer.apple.com/documentation/swiftui/layoutdirection
framework: SwiftUI
category: Layout adjustments
title: LayoutDirection
kind: enum
captured: 2026-05-02
---

# LayoutDirection

A direction in which SwiftUI can lay out content.

## Declaration

```swift
enum LayoutDirection
```

### Overview

SwiftUI supports both left-to-right and right-to-left directions for laying out content to support different languages and locales. The system sets the value based on the user’s locale, but you can also use the `View/environment(_:_:)` modifier to override the direction for a view and its child views:

```swift
MyView()
    .environment(\.layoutDirection, .rightToLeft)
```

You can also read the `EnvironmentValues/layoutDirection` environment value to find out which direction applies to a particular environment. However, in many cases, you don’t need to take any action based on this value. SwiftUI horizontally flips the x position of each view within its parent, so layout calculations automatically produce the desired effect for both modes without any changes.





## Relationships

**Conforms To**: `CaseIterable`, `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting layout directions

- `LayoutDirection.leftToRight`
- `LayoutDirection.rightToLeft`

### Creating a layout direction

- `init(_:)`

## See Also

- `layoutDirectionBehavior(_:)`
- `LayoutDirectionBehavior`
- `layoutDirection`
- `LayoutRotationUnaryLayout`
