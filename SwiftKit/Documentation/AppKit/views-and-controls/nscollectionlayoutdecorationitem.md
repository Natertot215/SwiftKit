---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutdecorationitem
framework: AppKit
category: Views and controls
title: NSCollectionLayoutDecorationItem
kind: class
captured: 2026-05-02
---

# NSCollectionLayoutDecorationItem

An object used to add a background to a section of a collection view.

## Declaration

```swift
class NSCollectionLayoutDecorationItem
```

### Overview

Each type of decoration item must have a unique element kind. Consider tracking these strings together in a way that makes it straightforward to identify each element, for example:

Add a background to a section by setting that section’s `NSCollectionLayoutSection/decorationItems` property:





## Relationships

**Inherits From**: `NSCollectionLayoutItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.15

## Topics

### Creating a background

- `background(elementKind:)`

### Getting the element kind

- `elementKind`

### Specifying stacking order

- `zIndex`

## See Also

- `NSCollectionLayoutBoundarySupplementaryItem`
- `NSCollectionLayoutSupplementaryItem`
- `NSCollectionLayoutAnchor`
