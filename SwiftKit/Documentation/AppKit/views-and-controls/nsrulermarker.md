---
url: https://developer.apple.com/documentation/appkit/nsrulermarker
framework: AppKit
category: Views and controls
title: NSRulerMarker
kind: class
captured: 2026-05-02
---

# NSRulerMarker

A symbol on a ruler view, indicating a location for the graphics element it represents in the client of the ruler view.

## Declaration

```swift
class NSRulerMarker
```

### Overview

An example of a marker is the representation of a margin or tab setting, or the edges of a graphic on the page.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Creating instances

- `init(rulerView:markerLocation:image:imageOrigin:)`

### Getting the ruler view

- `ruler`

### Setting the image

- `image`
- `imageOrigin`
- `imageRectInRuler`
- `thicknessRequiredInRuler`

### Setting movability

- `isMovable`
- `isRemovable`

### Setting the location

- `markerLocation`

### Setting the represented object

- `representedObject`

### Drawing and event handling

- `draw(_:)`
- `isDragging`
- `trackMouse(with:adding:)`

### Initializers

- `init(coder:)`

## See Also

- `NSRulerView`
