---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutitem
framework: AppKit
category: Views and controls
title: NSCollectionLayoutItem
kind: class
captured: 2026-05-01
---

# NSCollectionLayoutItem

## Declaration

```swift
@MainActor class NSCollectionLayoutItem
```

## Abstract

The most basic component of a collection view's layout.

## Overview

An item is a blueprint for how to size, space, and arrange an individual piece of content in your collection view. An item represents a single view that's rendered onscreen. Generally, an item is a cell, but items can be supplementary views like headers, footers, and other decorations.

For example, in the Photos app, an item might represent a single photo. In the App Store app, an item might be a cell displaying information about an individual app in a list of featured apps, such as the app icon, app name, tagline, and download button.

Each item specifies its own size in terms of a width dimension and a height dimension. Items can express their dimensions relative to their container, as an absolute value, or as an estimated value that might change at runtime, like in response to a change in system font size.

You combine items into groups that determine how those items are arranged in relation to each other. For more information, see `NSCollectionLayoutGroup`.

## Topics

### Creating an Item
- `init(layoutSize:)` - Creates an item of the specified size.
- `init(layoutSize:supplementaryItems:)` - Creates an item of the specified size with an array of supplementary items to attach to the item.

### Getting an Item's Size
- `layoutSize` - The item's size expressed in width and height dimensions.

### Getting Supplementary Items
- `supplementaryItems` - An array of the supplementary items attached to the item.

### Configuring Spacing and Insets
- `edgeSpacing` - The amount of space added around the boundaries of the item between other items and this item's container.
- `contentInsets` - The amount of space added around the content of the item to adjust its final size after its position is computed.

## Inheritance

Inherits from: `NSObject`

Inherited by:
- `NSCollectionLayoutDecorationItem`
- `NSCollectionLayoutGroup`
- `NSCollectionLayoutSupplementaryItem`

## Conformances

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSCopying`
- `NSObject`
- `Sendable`

## Availability

- **macOS**: 10.15+

## See Also

### Components
- `NSCollectionLayoutGroup` - A container for a set of items that lays out the items along a path.
- `NSCollectionLayoutSection` - A container that combines a set of groups into distinct visual groupings.
