---
url: https://developer.apple.com/documentation/appkit/nsdraggingimagecomponent
framework: AppKit
category: Drag and drop
title: NSDraggingImageComponent
kind: class
captured: 2026-05-02
---

# NSDraggingImageComponent

A single object in a dragging item.

## Declaration

```swift
class NSDraggingImageComponent
```

### Overview

An array of `NSDraggingImageComponent` instances are composited together to create the dragging image for an `NSDraggingItem`. `NSDraggingImageComponent` instances can simply be considered as named images with a location used by an `NSDraggingItem` instance.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.7

## Topics

### Creating a Dragging Image Component

- `init(key:)`

### Dragging Image Component

- `key`

### Dragging Image Contents

- `contents`
- `frame`

### Constants

- `NSDragImage Component Keys`

## See Also

- `NSDraggingSource`
- `NSDraggingItem`
- `NSDraggingSession`
