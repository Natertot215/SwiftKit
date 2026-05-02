---
url: https://developer.apple.com/documentation/appkit/nsdraggingsource
framework: AppKit
category: Drag and drop
title: NSDraggingSource
kind: protocol
captured: 2026-05-02
---

# NSDraggingSource

A set of methods that are implemented by the source object in a dragging session.

## Declaration

```swift
protocol NSDraggingSource : NSObjectProtocol
```

### Overview

In macOS 10.7 and later `NSDraggingSource` is now a formal protocol and has an updated interface. The OS X v10.6 behavior has been retained, but will be dropped in a future version of the operating system. The methods that are to be deprecated are marked as such.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSCollectionView`, `NSOutlineView`, `NSTableView`, `NSTextView`

## Availability

- macOS ?

## Topics

### Dragging Session Operation

- `draggingSession(_:sourceOperationMaskFor:)`

### Dragging Session Locations

- `draggingSession(_:willBeginAt:)`
- `draggingSession(_:movedTo:)`
- `draggingSession(_:endedAt:operation:)`

### Dragging Session Modifier Keys

- `ignoreModifierKeys(for:)`

### Dragging Options

- `namesOfPromisedFilesDropped(atDestination:)`

## See Also

- `Drag and Drop`

- `NSDraggingItem`
- `NSDraggingSession`
- `NSDraggingImageComponent`
