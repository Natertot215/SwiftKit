---
url: https://developer.apple.com/documentation/appkit/nsdraggingitem
framework: AppKit
category: Drag and drop
title: NSDraggingItem
kind: class
captured: 2026-05-02
---

# NSDraggingItem

A single dragged item within a dragging session.

## Declaration

```swift
class NSDraggingItem
```

### Overview

`NSDraggingItem` objects have extremely limited lifetimes. Don’t retain these items because changing outside of the prescribed lifetimes has no impact on the drag.

When you call the `NSDraggingSession` method `NSView/beginDraggingSession(with:event:source:)`, the system immediately consumes the dragging items that pass to the method, and doesn’t retain them. Any further changes to the dragging item associated with the returned `NSDraggingSession` must occur with the enumeration method `NSDraggingSession/enumerateDraggingItems(options:for:classes:searchOptions:using:)`. When enumerating, the system creates `NSDraggingItem` instances right before giving them to the enumeration block. After returning from the block, the dragging item is no longer valid.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.7

## Topics

### Initializing a dragging item

- `init(pasteboardWriter:)`

### Dragging frame

- `setDraggingFrame(_:contents:)`
- `draggingFrame`

### Drag image components

- `imageComponents`
- `imageComponentsProvider`
- `NSDraggingItem.ImageComponentKey`
- `item`

## See Also

- `NSDraggingSource`
- `NSDraggingSession`
- `NSDraggingImageComponent`
