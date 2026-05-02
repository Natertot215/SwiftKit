---
url: https://developer.apple.com/documentation/appkit/nsspringloadingdestination
framework: AppKit
category: Drag and drop
title: NSSpringLoadingDestination
kind: protocol
captured: 2026-05-02
---

# NSSpringLoadingDestination

A set of methods that the destination object (or recipient) of a dragged object can implement to support spring-loading.

## Declaration

```swift
protocol NSSpringLoadingDestination : NSObjectProtocol
```

### Overview

Spring-loading is the act of dragging an object onto a destination object and hovering or force-clicking to activate the destination object A view can be configured as a drag-and-drop destination, a spring-loading destination, or both. If a view implements both drag-and-drop and spring-loading, then it will receive messages for both operations.

Note that the view beneath the cursor during a drag receives priority. For example, if a parent view implements drag-and-drop and a subview implements spring-loading, then the parent view will not receive drag-and-drop messages while the cursor is over the subview.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Respond to Spring-loading Events

- `springLoadingActivated(_:draggingInfo:)`
- `springLoadingHighlightChanged(_:)`
- `springLoadingEntered(_:)`
- `springLoadingUpdated(_:)`
- `springLoadingExited(_:)`
- `draggingEnded(_:)`

### Constants

- `NSSpringLoadingOptions`

## See Also

- `NSDraggingDestination`
- `NSDraggingInfo`
