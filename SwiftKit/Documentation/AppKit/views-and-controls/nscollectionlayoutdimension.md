---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutdimension
framework: AppKit
category: Views and controls
title: NSCollectionLayoutDimension
kind: class
captured: 2026-05-02
---

# NSCollectionLayoutDimension

An individual dimension representing an item’s width or height in a collection view.

## Declaration

```swift
@MainActor class NSCollectionLayoutDimension
```

### Overview

Each item in a collection view has an explicit width dimension and height dimension, which combine to define the item’s size (`NSCollectionLayoutSize`).

You can express an item’s dimensions using an absolute, estimated, or fractional value.

Use an *absolute value*absolute value to specify exact dimensions, like a 44 x 44 point square:

Use an *estimated value*estimated value if the size of your content might change at runtime, such as when data is loaded or in response to a change in system font size. You provide an initial estimated size and the system computes the actual value later.

Use a *fractional value*fractional value to define a value that’s relative to a dimension of the item’s container. This option simplifies specifying aspect ratios. For example, the following item has a width and a height that are both equal to 20% of its container’s width, creating a square that grows and shrinks as the size of its container changes.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.15

## Topics

### Creating a dimension

- `absolute(_:)`
- `estimated(_:)`
- `fractionalHeight(_:)`
- `fractionalWidth(_:)`

### Getting the dimension value

- `dimension`

### Getting the dimension type

- `isAbsolute`
- `isEstimated`
- `isFractionalHeight`
- `isFractionalWidth`

## See Also

- `NSCollectionLayoutSize`
- `NSCollectionLayoutSpacing`
- `NSCollectionLayoutEdgeSpacing`
- `NSCollectionLayoutContainer`
