---
url: https://developer.apple.com/documentation/appkit/nscollectionviewlayoutinvalidationcontext
framework: AppKit
category: Views and controls
title: NSCollectionViewLayoutInvalidationContext
kind: class
captured: 2026-05-02
---

# NSCollectionViewLayoutInvalidationContext

An object that identifies the portions of your layout that need to be updated.

## Declaration

```swift
@MainActor class NSCollectionViewLayoutInvalidationContext
```

### Overview

Invalidation contexts are a way to improve the efficiency of layout operations and must be supported explicitly by the layout object. Instead of invalidating the entire layout, you can create an invalidation layout object that specifies only the portions of the layout that changed. You then pass that invalidation context to the `NSCollectionViewLayout/invalidateLayout(with:)` method of the layout object.

Typically, you ask the layout object to create an invalidation context for you. The `NSCollectionViewLayout` class defines methods for creating a supported invalidation context. If you define a custom layout, you can define additional methods for creating invalidation contexts with custom information. Layout objects may also create invalidation contexts in response to specific changes. For example, layout objects automatically create invalidation contexts when you change the collection view’s data source, when you insert or delete items, and when you reload the collection view’s data.

#### Subclassing Notes

If you define a custom layout object, you can also subclass `NSCollectionViewLayoutInvalidationContext` and add properties that are specific to your layout object. Creating a custom invalidation context is not required and should only be done when your layout object has additional ways to optimize the layout process.

Fore more information about how to support custom invalidation contexts in your layout objects, see `NSCollectionViewLayout`.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSCollectionViewFlowLayoutInvalidationContext`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.11

## Topics

### Invalidating the Collection View Data

- `invalidateEverything`
- `invalidateDataSourceCounts`

### Invalidating the Content Area

- `contentOffsetAdjustment`
- `contentSizeAdjustment`

### Invalidating Specific Items

- `invalidateItems(at:)`
- `invalidateSupplementaryElements(ofKind:at:)`
- `invalidateDecorationElements(ofKind:at:)`
- `invalidatedItemIndexPaths`
- `invalidatedSupplementaryIndexPaths`
- `invalidatedDecorationIndexPaths`

## See Also

- `NSCollectionViewUpdateItem`
- `NSCollectionViewFlowLayoutInvalidationContext`
