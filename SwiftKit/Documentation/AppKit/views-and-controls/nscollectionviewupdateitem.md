---
url: https://developer.apple.com/documentation/appkit/nscollectionviewupdateitem
framework: AppKit
category: Views and controls
title: NSCollectionViewUpdateItem
kind: class
captured: 2026-05-02
---

# NSCollectionViewUpdateItem

A description of a single change to make to an item in a collection view.

## Declaration

```swift
@MainActor class NSCollectionViewUpdateItem
```

### Overview

You do not create instances of this class directly. When updating its content, the collection view object creates them and passes them to the layout object’s `NSCollectionViewLayout/prepare(forCollectionViewUpdates:)` method, which can use them to prepare for the upcoming changes.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.11

## Topics

### Accessing the Item Changes

- `indexPathBeforeUpdate`
- `indexPathAfterUpdate`
- `updateAction`
- `NSCollectionView.UpdateAction`
- `NSCollectionView.ScrollDirection`

### Constants

- `NSCollectionView.UpdateAction`

## See Also

- `NSCollectionViewLayoutInvalidationContext`
- `NSCollectionViewFlowLayoutInvalidationContext`
