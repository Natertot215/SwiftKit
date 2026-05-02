---
url: https://developer.apple.com/documentation/swiftui/scrollanchorrole
framework: SwiftUI
category: Scroll views
title: ScrollAnchorRole
kind: struct
captured: 2026-05-02
---

# ScrollAnchorRole

A type defining the role of a scroll anchor.

## Declaration

```swift
struct ScrollAnchorRole
```

### Overview

You can associate a `UnitPoint` to a `ScrollView` using the `View/defaultScrollAnchor(_:)` modifier. By default, the system uses this point for different kinds of behaviors including:

- Where the scroll view should initially be scrolled
- How the scroll view should handle content size or container size changes
- How the scroll view should align content smaller than its container size

You can further customize this behavior by assigning different unit points for these different roles.





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Type Properties

- `alignment`
- `initialOffset`
- `sizeChanges`

## See Also

- `scrollPosition(_:anchor:)`
- `scrollPosition(id:anchor:)`
- `defaultScrollAnchor(_:)`
- `defaultScrollAnchor(_:for:)`
- `ScrollPosition`
