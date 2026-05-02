---
url: https://developer.apple.com/documentation/swiftui/proposedviewsize
framework: SwiftUI
category: Custom layout
title: ProposedViewSize
kind: struct
captured: 2026-05-02
---

# ProposedViewSize

A proposal for the size of a view.

## Declaration

```swift
@frozen struct ProposedViewSize
```

### Overview

During layout in SwiftUI, views choose their own size, but they do that in response to a size proposal from their parent view. When you create a custom layout using the `Layout` protocol, your layout container participates in this process using `ProposedViewSize` instances. The layout protocol’s methods take a proposed size input that you can take into account when arranging views and calculating the size of the composite container. Similarly, your layout proposes a size to each of its own subviews when it measures and places them.

Layout containers typically measure their subviews by proposing several sizes and looking at the responses. The container can use this information to decide how to allocate space among its subviews. A layout might try the following special proposals:

- The `ProposedViewSize/zero` proposal; the view responds with its minimum size.
- The `ProposedViewSize/infinity` proposal; the view responds with its maximum size.
- The `ProposedViewSize/unspecified` proposal; the view responds with its ideal size.

A layout might also try special cases for one dimension at a time. For example, an `HStack` might measure the flexibility of its subviews’ widths, while using a fixed value for the height.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting standard proposals

- `zero`
- `infinity`
- `unspecified`

### Creating a custom size proposal

- `init(_:)`
- `init(width:height:)`

### Getting the proposal’s dimensions

- `height`
- `width`

### Modifying a proposal

- `replacingUnspecifiedDimensions(by:)`

## See Also

- `LayoutProperties`
- `ViewSpacing`
