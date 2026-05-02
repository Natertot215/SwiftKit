---
url: https://developer.apple.com/documentation/appkit/nscollectionviewflowlayoutinvalidationcontext
framework: AppKit
category: Views and controls
title: NSCollectionViewFlowLayoutInvalidationContext
kind: class
captured: 2026-05-02
---

# NSCollectionViewFlowLayoutInvalidationContext

An object that identifies the portions of a flow layout object that need to be updated.

## Declaration

```swift
class NSCollectionViewFlowLayoutInvalidationContext
```

### Overview

Layout objects use invalidation contexts to optimize the layout process and avoid unnecessary work. You use this class to specify whether the `NSCollectionViewFlowLayout` object should fetch new size information from its delegate. You can also prevent the flow layout object from updating its layout information altogether.

When you want to invalidate your flow layout object, call the `NSCollectionViewLayout/invalidationContextClass` method of your layout object and instantiate the resulting class. (The implementation of that method in `NSCollectionViewFlowLayout` returns this class.) After instantiating this class, set the properties to appropriate values and pass the object to the `NSCollectionViewLayout/invalidateLayout(with:)` method of the layout object.





## Relationships

**Inherits From**: `NSCollectionViewLayoutInvalidationContext`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.11

## Topics

### Invalidating the Flow Layout

- `invalidateFlowLayoutAttributes`
- `invalidateFlowLayoutDelegateMetrics`

## See Also

- `NSCollectionViewUpdateItem`
- `NSCollectionViewLayoutInvalidationContext`
