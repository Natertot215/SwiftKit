---
url: https://developer.apple.com/documentation/appkit/nsdragginginfo
framework: AppKit
category: Drag and drop
title: NSDraggingInfo
kind: protocol
captured: 2026-05-02
---

# NSDraggingInfo

A set of methods that supply information about a dragging session.

## Declaration

```swift
protocol NSDraggingInfo : NSObjectProtocol
```

### Overview

You invoke the `NSDraggingInfo` protocol methods from within a class’s implementation of `NSDraggingDestination` methods. AppKit automatically passes an object that conforms to the `NSDraggingInfo` protocol as the argument to each of the methods that `NSDraggingDestination` defines. Send `NSDraggingInfo` messages to this object. You never need to create a class that implements the `NSDraggingInfo` protocol.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Obtaining information about the dragging session

- `draggingPasteboard`
- `draggingSequenceNumber`
- `draggingSource`
- `draggingSourceOperationMask`
- `draggingLocation`
- `draggingDestinationWindow`
- `numberOfValidItemsForDrop`
- `namesOfPromisedFilesDropped(atDestination:)`

### Getting image information

- `draggedImageLocation`
- `draggedImage`

### Sliding the image

- `slideDraggedImage(to:)`
- `animatesToDestination`
- `draggingFormation`

### Enumerate dragged items

- `enumerateDraggingItems(options:for:classes:searchOptions:using:)`

### Implementing spring-loading support

- `springLoadingHighlight`
- `resetSpringLoading()`

### Constants

- `NSDragOperation`
- `NSDraggingItemEnumerationOptions`
- `NSSpringLoadingHighlight`
- `NSDraggingFormation`
- `NSDraggingContext`

## See Also

- `NSDraggingDestination`
- `NSSpringLoadingDestination`
