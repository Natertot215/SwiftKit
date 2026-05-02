---
url: https://developer.apple.com/documentation/swiftui/layoutsubviews
framework: SwiftUI
category: Custom layout
title: LayoutSubviews
kind: struct
captured: 2026-05-02
---

# LayoutSubviews

A collection of proxy values that represent the subviews of a layout view.

## Declaration

```swift
struct LayoutSubviews
```

### Overview

You receive a `LayoutSubviews` input to your implementations of `Layout` protocol methods, like `Layout/placeSubviews(in:proposal:subviews:cache:)` and `Layout/sizeThatFits(proposal:subviews:cache:)`. The `subviews` parameter (which the protocol aliases to the `Layout/Subviews` type) is a collection that contains proxies for the layout’s subviews (of type `LayoutSubview`). The proxies appear in the collection in the same order that they appear in the `ViewBuilder` input to the layout container. Use the proxies to perform layout operations.

Access the proxies in the collection as you would the contents of any Swift random-access collection. For example, you can enumerate all of the subviews and their indices to inspect or operate on them:

```swift
for (index, subview) in subviews.enumerated() {
    // ...
}
```





## Relationships

**Conforms To**: `BidirectionalCollection`, `Collection`, `Equatable`, `RandomAccessCollection`, `Sendable`, `SendableMetatype`, `Sequence`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting the layout direction

- `layoutDirection`

### Accessing subviews

- `subscript(_:)`
- `startIndex`
- `endIndex`
- `LayoutSubviews.Element`
- `LayoutSubviews.Index`
- `LayoutSubviews.SubSequence`

## See Also

- `Composing custom layouts with SwiftUI`
- `Layout`
- `LayoutSubview`
