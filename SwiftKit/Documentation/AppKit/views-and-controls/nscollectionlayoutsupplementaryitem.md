---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutsupplementaryitem
framework: AppKit
category: Views and controls
title: NSCollectionLayoutSupplementaryItem
kind: class
captured: 2026-05-02
---

# NSCollectionLayoutSupplementaryItem

An object used to add an extra visual decoration to an item in a collection view.

## Declaration

```swift
class NSCollectionLayoutSupplementaryItem
```

### Overview

You use supplementary items to attach additional views to your content. For example, you might attach a badge to an item or a frame around a group. A supplementary item follows the index path of the item it’s attached to.

If you want to create a header or footer for your layout or its sections, use a boundary supplementary item (<````NSCollectionLayoutBoundarySupplementaryItem``>) instead.

Each type of supplementary item must have a unique element kind. Consider tracking these strings together in a way that makes it straightforward to identify each element, for example:

Add supplementary items to an item by passing in an array of supplementary items when you construct the item:





## Relationships

**Inherits From**: `NSCollectionLayoutItem`

**Inherited By**: `NSCollectionLayoutBoundarySupplementaryItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS 10.15

## Topics

### Creating a supplementary item

- `init(layoutSize:elementKind:containerAnchor:)`
- `init(layoutSize:elementKind:containerAnchor:itemAnchor:)`

### Getting the anchors

- `itemAnchor`
- `containerAnchor`

### Getting the element kind

- `elementKind`

### Specifying stacking order

- `zIndex`

## See Also

- `NSCollectionLayoutBoundarySupplementaryItem`
- `NSCollectionLayoutDecorationItem`
- `NSCollectionLayoutAnchor`
