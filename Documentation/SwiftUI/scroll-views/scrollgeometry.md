---
url: https://developer.apple.com/documentation/swiftui/scrollgeometry
framework: SwiftUI
category: Scroll views
title: ScrollGeometry
kind: struct
captured: 2026-05-02
---

# ScrollGeometry

A type that defines the geometry of a scroll view.

## Declaration

```swift
struct ScrollGeometry
```

### Overview

SwiftUI provides you values of this type when using modifiers like `View/onScrollGeometryChange(_:action:)` or `View/onScrollPhaseChange(_:)`.





## Relationships

**Conforms To**: `Copyable`, `CustomDebugStringConvertible`, `Equatable`, `Escapable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Initializers

- `init(contentOffset:contentSize:contentInsets:containerSize:)`

### Instance Properties

- `bounds`
- `containerSize`
- `contentInsets`
- `contentOffset`
- `contentSize`
- `visibleRect`

## See Also

- `onScrollGeometryChange(for:of:action:)`
- `onScrollTargetVisibilityChange(idType:threshold:_:)`
- `onScrollVisibilityChange(threshold:_:)`
- `onScrollPhaseChange(_:)`
- `ScrollPhase`
- `ScrollPhaseChangeContext`
