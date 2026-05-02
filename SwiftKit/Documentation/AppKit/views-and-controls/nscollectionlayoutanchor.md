---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutanchor
framework: AppKit
category: Views and controls
title: NSCollectionLayoutAnchor
kind: class
captured: 2026-05-02
---

# NSCollectionLayoutAnchor

An object that defines how to attach a supplementary item to an item in a collection view.

## Declaration

```swift
@MainActor class NSCollectionLayoutAnchor
```

### Overview

You use an anchor to attach a supplementary item to a specific item. An anchor contains information about where on the item your supplementary item is attached, including:

- An edge or set of edges. You can attach a supplementary item to a single edge, or to a corner by specifying two adjacent edges.
- An offset from the item. By default, the supplementary item is anchored within the specified edges of the item it’s attached to. You can change this location by providing a custom offset when you create an anchor.

#### Edges

The leading and trailing edges for anchors differ in left-to-right versus right-to-left environments. In a left-to-right environment, the leading edge is on the left, and the trailing edge is on the right. In a right-to-left environment, the leading edge is on the right, and the trailing edge is on the left. This difference ensures that your collection view layout is built with support for right-to-left languages.

The following diagram shows anchor placement for the specified edges in a left-to-right environment.

#### Offset

You can express anchor offset in these ways:

- Absolute value. The offset is calculated as a point value. For example, an absolute x offset of `30.0` means that the origin of the supplementary item is offset by 30 points in the positive x direction.
- Fractional value. The offset is calculated as a fraction of the supplementary item’s dimensions. For example, a fractional x offset of `0.3` means that the origin of the supplementary item is offset by 30% of the supplementary item’s width in the positive x direction.

The following code creates a basic badge and attaches it to an item’s top trailing corner.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.15

## Topics

### Creating an anchor

- `init(edges:)`
- `init(edges:absoluteOffset:)`
- `init(edges:fractionalOffset:)`

### Getting the edges

- `edges`

### Getting the offset

- `offset`
- `isAbsoluteOffset`
- `isFractionalOffset`

## See Also

- `NSCollectionLayoutBoundarySupplementaryItem`
- `NSCollectionLayoutSupplementaryItem`
- `NSCollectionLayoutDecorationItem`
