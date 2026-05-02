---
url: https://developer.apple.com/documentation/appkit/nsdraggingsession
framework: AppKit
category: Drag and drop
title: NSDraggingSession
kind: class
captured: 2026-05-02
---

# NSDraggingSession

The encapsulation of a drag-and-drop action that supports modification of the drag while in progress.

## Declaration

```swift
class NSDraggingSession
```

### Overview

You start a new dragging session by calling the `NSView` method `NSView/beginDraggingSession(with:event:source:)` method. This method immediately returns and you can further modify the properties of the dragging session. The actual drag begins at the next turn of the run loop.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.7

## Topics

### Dragging Pasteboard

- `draggingPasteboard`

### Dragging Visual Representation

- `animatesToStartingPositionsOnCancelOrFail`
- `draggingFormation`

### Identifying the Dragging Session

- `draggingSequenceNumber`

### Enumerating Dragging Items

- `enumerateDraggingItems(options:for:classes:searchOptions:using:)`

### Dragging Session Location

- `draggingLocation`

### Dragging Item Location

- `draggingLeaderIndex`

## See Also

- `NSDraggingSource`
- `NSDraggingItem`
- `NSDraggingImageComponent`
