---
url: https://developer.apple.com/documentation/appkit/nscollectionviewdelegate
framework: AppKit
category: Views and controls
title: NSCollectionViewDelegate
kind: protocol
captured: 2026-05-02
---

# NSCollectionViewDelegate

A set of methods that you use to manage the behavior of a collection view.

## Declaration

```swift
protocol NSCollectionViewDelegate : NSObjectProtocol
```

### Overview

You use the methods of this protocol to facilitate the user-initiated selection and highlighting of items, to track changes to the collection view’s visual elements, and to implement drag and drop support. The methods of this protocol are optional, but for some features, you must implement specific methods to support the feature.

Implement the methods of this protocol in an object that you use to manage your collection view. Typically, you implement delegate support in the view controller or window controller that manages the collection view itself, but you can implement these methods in another object if you prefer. Assign your delegate object to the collection view either programmatically (by setting the value of the collection view’s `NSCollectionView/delegate` property) or at design time in Interface Builder.

To implement drag and drop support in your collection view, implement the following methods:

- To support the dragging of content from the collection view, implement either the  `NSCollectionViewDelegate/collectionView(_:pasteboardWriterForItemAt:)-5eyyl` or `NSCollectionViewDelegate/collectionView(_:writeItemsAt:to:)-23ozm` method.
- To support the dropping of content into the collection view, implement the `NSCollectionViewDelegate/collectionView(_:validateDrop:proposedIndexPath:dropOperation:)` and `NSCollectionViewDelegate/collectionView(_:acceptDrop:indexPath:dropOperation:)` methods.
- To support multi-image drag and drop, you must implement the `NSCollectionViewDelegate/collectionView(_:pasteboardWriterForItemAt:)-5eyyl` and `NSCollectionViewDelegate/collectionView(_:updateDraggingItemsForDrag:)` methods.

For more information about handling drag and drop operations, see `https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/DragandDrop/DragandDrop.html#//apple_ref/doc/uid/10000069i`.

#### Legacy Support

Before OS X 10.11, collection views supported only a single section of items organized in a grid layout. The drag and drop methods of this protocol include variants that take a single index or an `NSIndexSet` as a parameter. Although you can use those methods to implement your drag and drop support, it is recommended that you use the newer methods that take `NSIndexPath` objects instead.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Inherited By**: `NSCollectionViewDelegateFlowLayout`

## Availability

- macOS ?

## Topics

### Managing the Selection

- `collectionView(_:shouldSelectItemsAt:)`
- `collectionView(_:didSelectItemsAt:)`
- `collectionView(_:shouldDeselectItemsAt:)`
- `collectionView(_:didDeselectItemsAt:)`

### Managing Item Highlighting

- `collectionView(_:shouldChangeItemsAt:to:)`
- `collectionView(_:didChangeItemsAt:to:)`

### Tracking the Addition and Removal of Items

- `collectionView(_:willDisplay:forRepresentedObjectAt:)`
- `collectionView(_:didEndDisplaying:forRepresentedObjectAt:)`
- `collectionView(_:willDisplaySupplementaryView:forElementKind:at:)`
- `collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:)`

### Handling Layout Changes

- `collectionView(_:transitionLayoutForOldLayout:newLayout:)`

### Drag and Drop Support

- `Supporting Collection View Drag and Drop Through File Promises`
- `collectionView(_:canDragItemsAt:with:)`
- `collectionView(_:pasteboardWriterForItemAt:)`
- `collectionView(_:writeItemsAt:to:)`
- `collectionView(_:namesOfPromisedFilesDroppedAtDestination:forDraggedItemsAt:)`
- `collectionView(_:draggingImageForItemsAt:with:offset:)`
- `collectionView(_:draggingSession:willBeginAt:forItemsAt:)`
- `collectionView(_:draggingSession:endedAt:dragOperation:)`
- `collectionView(_:updateDraggingItemsForDrag:)`
- `collectionView(_:validateDrop:proposedIndexPath:dropOperation:)`
- `collectionView(_:acceptDrop:indexPath:dropOperation:)`

### Legacy Collection View Support

- `collectionView(_:canDragItemsAt:with:)`
- `collectionView(_:pasteboardWriterForItemAt:)`
- `collectionView(_:writeItemsAt:to:)`
- `collectionView(_:namesOfPromisedFilesDroppedAtDestination:forDraggedItemsAt:)`
- `collectionView(_:draggingImageForItemsAt:with:offset:)`
- `collectionView(_:draggingSession:willBeginAt:forItemsAt:)`
- `collectionView(_:validateDrop:proposedIndex:dropOperation:)`
- `collectionView(_:acceptDrop:index:dropOperation:)`

## See Also

- `NSCollectionViewDataSource`
- `NSCollectionViewDiffableDataSource`
- `NSDiffableDataSourceSnapshot`
