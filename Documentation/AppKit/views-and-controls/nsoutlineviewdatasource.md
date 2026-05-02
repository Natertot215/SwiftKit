---
url: https://developer.apple.com/documentation/appkit/nsoutlineviewdatasource
framework: AppKit
category: Views and controls
title: NSOutlineViewDataSource
kind: protocol
captured: 2026-05-02
---

# NSOutlineViewDataSource

A set of methods that an outline view calls to retrieve data and information about it from the data source delegate, and—optionally—to update data values.

## Declaration

```swift
protocol NSOutlineViewDataSource : NSObjectProtocol
```

### Overview

`NSOutlineView` objects support a data source delegate in addition to the regular delegate object.

All the methods in the `NSOutlineViewDataSource` protocol are marked as `@optional`. While this is true, there are cases were you must implement some methods to achieve required functionality, specifically when working with conventional data sources rather than data that is provided by Cocoa bindings.

#### Required and Optional Methods Using Programmatic Conventions and Cocoa Bindings

If you are using conventional data sources for content you must implement the basic methods that provide the outline view with data: `NSOutlineViewDataSource/outlineView(_:child:ofItem:)`, `NSOutlineViewDataSource/outlineView(_:isItemExpandable:)`, `NSOutlineViewDataSource/outlineView(_:numberOfChildrenOfItem:)`, and `NSOutlineViewDataSource/outlineView(_:objectValueFor:byItem:)`. Applications that acquire their data using Cocoa bindings do not need to implement these methods.

Similarly, when using conventional data sources , if you want to allow the user to edit values, you must implement `NSOutlineViewDataSource/outlineView(_:setObjectValue:for:byItem:)`. When these methods are invoked by the outline view, `nil` as the `item` refers to the “root” item. `NSOutlineView` requires that each item in the outline view be unique. In order for the collapsed state of an outline view to remain consistent between reloads you must always return the same object for an item. When using Cocoa bindings to provide outline view content, there is no requirement to implement this method.

> **NOTE:**  Some of the methods in this `protocol`, such as `NSOutlineViewDataSource/outlineView(_:child:ofItem:)` and `NSOutlineViewDataSource/outlineView(_:numberOfChildrenOfItem:)` along with other methods that return data, are called very frequently, so they must be efficient.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Instance Methods

- `outlineView(_:acceptDrop:item:childIndex:)`
- `outlineView(_:child:ofItem:)`
- `outlineView(_:draggingSession:endedAt:operation:)`
- `outlineView(_:draggingSession:willBeginAt:forItems:)`
- `outlineView(_:isItemExpandable:)`
- `outlineView(_:itemForPersistentObject:)`
- `outlineView(_:namesOfPromisedFilesDroppedAtDestination:forDraggedItems:)`
- `outlineView(_:numberOfChildrenOfItem:)`
- `outlineView(_:objectValueFor:byItem:)`
- `outlineView(_:pasteboardWriterForItem:)`
- `outlineView(_:persistentObjectForItem:)`
- `outlineView(_:setObjectValue:for:byItem:)`
- `outlineView(_:sortDescriptorsDidChange:)`
- `outlineView(_:updateDraggingItemsForDrag:)`
- `outlineView(_:validateDrop:proposedItem:proposedChildIndex:)`
- `outlineView(_:writeItems:to:)`

## See Also

- `NSOutlineViewDelegate`
