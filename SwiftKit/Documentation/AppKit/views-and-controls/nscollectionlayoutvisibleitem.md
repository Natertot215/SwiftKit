---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutvisibleitem
framework: AppKit
category: Views and controls
title: NSCollectionLayoutVisibleItem
kind: protocol
captured: 2026-05-02
---

# NSCollectionLayoutVisibleItem

An item that’s currently visible within the bounds of a section.

## Declaration

```swift
@MainActor protocol NSCollectionLayoutVisibleItem : NSObjectProtocol
```

### Overview

A visible item represents an item in a collection view that’s currently visible onscreen, such as a cell, supplementary view, or decoration. You access a specific section’s visible items in its visible item invalidation handler (`NSCollectionLayoutSectionVisibleItemsInvalidationHandler`), stored in the `NSCollectionLayoutSection/visibleItemsInvalidationHandler` property. The handler is called before each layout cycle, any time an animation occurs in that section due to changes such as adding or removing items, scrolling the section, or rotating the device.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS 10.15

## Topics

### Identifying the item

- `name`
- `representedElementKind`
- `representedElementCategory`

### Getting the index path

- `indexPath`

### Configuring appearance

- `alpha`
- `isHidden`

### Configuring position

- `frame`
- `bounds`
- `center`

### Specifying stacking order

- `zIndex`

## See Also

- `NSCollectionLayoutSectionVisibleItemsInvalidationHandler`
