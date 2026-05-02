---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutspacing
framework: AppKit
category: Views and controls
title: NSCollectionLayoutSpacing
kind: class
captured: 2026-05-02
---

# NSCollectionLayoutSpacing

An object that defines the space between or around items in a collection view.

## Declaration

```swift
@MainActor class NSCollectionLayoutSpacing
```

### Overview

In a collection view layout, you use a spacing object to specify both the amount of space and the way in which it’s calculated.

You can express spacing using fixed or flexible spacing.

Use *fixed spacing*fixed spacing to provide an exact amount of space. For example, the following code creates exactly 200 points of space between the items in the group.

Use *flexible spacing*flexible spacing to provide a minimum amount of space that can grow as more space becomes available. For example, the following code creates at least 200 points of space between the items in the group. As more space becomes available, items are respaced evenly in the additional space.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.15

## Topics

### Creating spacing

- `fixed(_:)`
- `flexible(_:)`

### Getting the spacing value

- `spacing`

### Getting the spacing type

- `isFixed`
- `isFlexible`

## See Also

- `NSCollectionLayoutDimension`
- `NSCollectionLayoutSize`
- `NSCollectionLayoutEdgeSpacing`
- `NSCollectionLayoutContainer`
