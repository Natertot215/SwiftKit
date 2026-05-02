---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutsize
framework: AppKit
category: Views and controls
title: NSCollectionLayoutSize
kind: class
captured: 2026-05-02
---

# NSCollectionLayoutSize

The width and the height of an item in a collection view.

## Declaration

```swift
@MainActor class NSCollectionLayoutSize
```

### Overview

A size is a pair of dimensions (`NSCollectionLayoutDimension`): a width dimension and a height dimension. Every component of a collection view layout has an explicit size.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.15

## Topics

### Creating a layout size

- `init(widthDimension:heightDimension:)`

### Getting the width and height

- `widthDimension`
- `heightDimension`

## See Also

- `NSCollectionLayoutDimension`
- `NSCollectionLayoutSpacing`
- `NSCollectionLayoutEdgeSpacing`
- `NSCollectionLayoutContainer`
