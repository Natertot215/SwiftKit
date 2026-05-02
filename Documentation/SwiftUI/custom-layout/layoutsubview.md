---
url: https://developer.apple.com/documentation/swiftui/layoutsubview
framework: SwiftUI
category: Custom layout
title: LayoutSubview
kind: struct
captured: 2026-05-02
---

# LayoutSubview

A proxy that represents one subview of a layout.

## Declaration

```swift
struct LayoutSubview
```

### Overview

This type acts as a proxy for a view that your custom layout container places in the user interface. `Layout` protocol methods receive a `LayoutSubviews` collection that contains exactly one proxy for each of the subviews arranged by your container.

Use a proxy to get information about the associated subview, like its dimensions, layout priority, or custom layout values. You also use the proxy to tell its corresponding subview where to appear by calling the proxy’s `LayoutSubview/place(at:anchor:proposal:)` method. Do this once for each subview from your implementation of the layout’s `Layout/placeSubviews(in:proposal:subviews:cache:)` method.

You can read custom layout values associated with a subview by using the property’s key as an index on the subview. For more information about defining, setting, and reading custom values, see `LayoutValueKey`.





## Relationships

**Conforms To**: `Equatable`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Placing the subview

- `place(at:anchor:proposal:)`

### Getting subview characteristics

- `dimensions(in:)`
- `sizeThatFits(_:)`
- `spacing`
- `priority`

### Getting custom values

- `subscript(_:)`

### Instance Properties

- `containerValues`

## See Also

- `Composing custom layouts with SwiftUI`
- `Layout`
- `LayoutSubviews`
