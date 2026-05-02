---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutboundarysupplementaryitem
framework: AppKit
category: Views and controls
title: NSCollectionLayoutBoundarySupplementaryItem
kind: class
captured: 2026-05-02
---

# NSCollectionLayoutBoundarySupplementaryItem

An object used to add headers or footers to a collection view.

## Declaration

```swift
class NSCollectionLayoutBoundarySupplementaryItem
```

### Overview

A boundary supplementary item is a specialized type of supplementary item (`NSCollectionLayoutSupplementaryItem`). You use boundary supplementary items to add headers or footers to a section of a collection view or the entire collection view.

Each type of supplementary item must have a unique element kind. Consider tracking these strings together in a way that makes it straightforward to identify each element, for example:

Add boundary supplementary items to a section by setting that section’s `NSCollectionViewCompositionalLayoutConfiguration/boundarySupplementaryItems` property:





## Relationships

**Inherits From**: `NSCollectionLayoutSupplementaryItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS 10.15

## Topics

### Creating a boundary supplementary item

- `init(layoutSize:elementKind:alignment:)`
- `init(layoutSize:elementKind:alignment:absoluteOffset:)`

### Specifying scrolling behavior

- `pinToVisibleBounds`

### Specifying position

- `offset`
- `alignment`
- `extendsBoundary`

## See Also

- `NSCollectionLayoutSupplementaryItem`
- `NSCollectionLayoutDecorationItem`
- `NSCollectionLayoutAnchor`
