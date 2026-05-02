---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutgroupcustomitem
framework: AppKit
category: Views and controls
title: NSCollectionLayoutGroupCustomItem
kind: class
captured: 2026-05-02
---

# NSCollectionLayoutGroupCustomItem

An item used in a group with a custom layout arrangement.

## Declaration

```swift
@MainActor class NSCollectionLayoutGroupCustomItem
```

### Overview

You use a custom item if you want to specify a layout with a custom arrangement, like a radial or diagonal layout. You use custom items within a group that’s created with `NSCollectionLayoutGroup/custom(layoutSize:itemProvider:)`.

Instead of providing a layout size for the custom item, like you do when you create an `NSCollectionLayoutItem`, you provide a frame instead.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.15

## Topics

### Creating a custom item

- `init(frame:)`
- `init(frame:zIndex:)`

### Getting the frame

- `frame`

### Specifying stacking order

- `zIndex`

## See Also

- `NSCollectionLayoutGroupCustomItemProvider`
