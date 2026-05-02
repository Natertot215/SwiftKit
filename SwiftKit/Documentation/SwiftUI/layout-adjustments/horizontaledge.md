---
url: https://developer.apple.com/documentation/swiftui/horizontaledge
framework: SwiftUI
category: Layout adjustments
title: HorizontalEdge
kind: enum
captured: 2026-05-02
---

# HorizontalEdge

An edge on the horizontal axis.

## Declaration

```swift
@frozen enum HorizontalEdge
```

### Overview

Use a horizontal edge for tasks like setting a swipe action with the `View/swipeActions(edge:allowsFullSwipe:content:)` view modifier. The positions of the leading and trailing edges depend on the locale chosen by the user.





## Relationships

**Conforms To**: `BitwiseCopyable`, `CaseIterable`, `Copyable`, `Decodable`, `Encodable`, `Equatable`, `Escapable`, `Hashable`, `RawRepresentable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Getting the edges

- `HorizontalEdge.leading`
- `HorizontalEdge.trailing`

### Accessing sets of edges

- `HorizontalEdge.Set`

## See Also

- `Edge`
- `Edge3D`
- `VerticalEdge`
- `EdgeInsets`
- `EdgeInsets3D`
