---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutedgespacing
framework: AppKit
category: Views and controls
title: NSCollectionLayoutEdgeSpacing
kind: class
captured: 2026-05-02
---

# NSCollectionLayoutEdgeSpacing

An object that defines the space around the edges of items in a collection view.

## Declaration

```swift
@MainActor class NSCollectionLayoutEdgeSpacing
```

### Overview

You use edge spacing to create additional spacing around the edges of an item to adjust the position of the item in relation to its container and other items.

The leading and trailing spaces within edge spacing differ in left-to-right versus right-to-left environments. In a left-to-right environment, the leading space is on the left, and the trailing space is on the right. In a right-to-left environment, the leading space is on the right, and the trailing space is on the left. This difference ensures that your collection view layout is built with support for right-to-left languages.

The following diagram shows the difference between adding 2 points of trailing edge spacing in a left-to-right versus a right-to-left environment.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.15

## Topics

### Creating edge spacing

- `init(leading:top:trailing:bottom:)`

### Getting the edge spacing

- `leading`
- `top`
- `trailing`
- `bottom`

### Initializers

- `init(forLeading:top:trailing:bottom:)`

## See Also

- `NSCollectionLayoutDimension`
- `NSCollectionLayoutSize`
- `NSCollectionLayoutSpacing`
- `NSCollectionLayoutContainer`
