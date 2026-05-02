---
url: https://developer.apple.com/documentation/swiftui/viewspacing
framework: SwiftUI
category: Custom layout
title: ViewSpacing
kind: struct
captured: 2026-05-02
---

# ViewSpacing

A collection of the geometric spacing preferences of a view.

## Declaration

```swift
struct ViewSpacing
```

### Overview

This type represents how much space a view prefers to have between it and the next view in a layout. The type stores independent values for each of the top, bottom, leading, and trailing edges, and can also record different values for different kinds of adjacent views. For example, it might contain one value for the spacing to the next text view along the top and bottom edges, other values for the spacing to text views on other edges, and yet other values for other kinds of views. Spacing preferences can also vary by platform.

Your `Layout` type doesn’t have to take preferred spacing into account, but if it does, you can use the `LayoutSubview/spacing` preferences of the subviews in your layout container to:

- Add space between subviews when you implement the `Layout/placeSubviews(in:proposal:subviews:cache:)` method.
- Create a spacing preferences instance for the container view by implementing the `Layout/spacing(subviews:cache:)` method.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating spacing instances

- `init()`
- `zero`

### Measuring spacing distance

- `distance(to:along:)`

### Merging spacing instances

- `formUnion(_:edges:)`
- `union(_:edges:)`

## See Also

- `LayoutProperties`
- `ProposedViewSize`
