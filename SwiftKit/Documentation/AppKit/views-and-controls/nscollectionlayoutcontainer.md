---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutcontainer
framework: AppKit
category: Views and controls
title: NSCollectionLayoutContainer
kind: protocol
captured: 2026-05-02
---

# NSCollectionLayoutContainer

A protocol used to provide information about the size and content insets of a layout’s container.

## Declaration

```swift
@MainActor protocol NSCollectionLayoutContainer : NSObjectProtocol
```

### Overview

In a section provider, you use the `NSCollectionLayoutEnvironment/container` property of the layout environment (`NSCollectionLayoutEnvironment`) to get information about the container of the layout, such as its size and content insets. Knowing about the container’s size while rendering the layout’s sections helps you make decisions about how to display the layout.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS 10.15

## Topics

### Getting content size

- `contentSize`
- `effectiveContentSize`

### Getting content insets

- `contentInsets`
- `effectiveContentInsets`

## See Also

- `NSCollectionLayoutDimension`
- `NSCollectionLayoutSize`
- `NSCollectionLayoutSpacing`
- `NSCollectionLayoutEdgeSpacing`
