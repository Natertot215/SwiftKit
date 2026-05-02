---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutgroup
framework: AppKit
category: Views and controls
title: NSCollectionLayoutGroup
kind: class
captured: 2026-05-01
---

# NSCollectionLayoutGroup

## Declaration

```swift
class NSCollectionLayoutGroup
```

## Abstract

A container for a set of items that lays out the items along a path.

## Overview

Groups determine how the items in a collection view lay out in relation to each other. A group might lay out its items in a horizontal row, a vertical column, or a custom arrangement. A group determines the rules for how items are rendered in relation to each other, but in itself doesn't render any content.

For example, in the Photos app, a group of items is a row of photos. In the App Store app, a group might be a single column of cells (items) arranged in a vertical column.

Each group specifies its own size in terms of a width dimension and a height dimension. Groups can express their dimensions relative to their container, as an absolute value, or as an estimated value that might change at runtime, like in response to a change in system font size. For more information, see `NSCollectionLayoutDimension`.

Because a group is a subclass of `NSCollectionLayoutItem`, it behaves like an item. You can combine a group with other items and groups into more complex layouts.

After you configure a group, you must initialize a section (`NSCollectionLayoutSection`) of your collection view layout with that group.

## Availability

- **macOS** 10.15+

## Inheritance

Inherits from: `NSCollectionLayoutItem`

## Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSCopying`
- `NSObject`
- `Sendable`

## Topics

### Creating a Horizontal Group
- `horizontal(layoutSize:subitems:)` - Creates a group with items arranged in a horizontal line
- `horizontal(layoutSize:subitem:count:)` - Creates a group with equally sized items arranged horizontally

### Creating a Vertical Group
- `vertical(layoutSize:subitems:)` - Creates a group with items arranged in a vertical line
- `vertical(layoutSize:subitem:count:)` - Creates a group with equally sized items arranged vertically

### Creating a Custom Group
- `custom(layoutSize:itemProvider:)` - Creates a group with a custom arrangement

### Getting the Group's Items
- `subitems` - An array of the items contained in the group
- `supplementaryItems` - An array of supplementary items anchored to the group

### Configuring Group Spacing
- `interItemSpacing` - The amount of space between items in the group

### Debugging Group Layout
- `visualDescription()` - Returns a string with an ASCII representation of the group

## See Also

- `NSCollectionLayoutItem` - The most basic component of a collection view's layout
- `NSCollectionLayoutSection` - A container that combines groups into distinct visual groupings
