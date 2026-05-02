---
url: https://developer.apple.com/documentation/appkit/nstextviewportlayoutcontroller
framework: AppKit
category: TextKit
title: NSTextViewportLayoutController
kind: class
captured: 2026-05-02
---

# NSTextViewportLayoutController

Manages the layout process inside the viewport interacting with its delegate.

## Declaration

```swift
class NSTextViewportLayoutController
```

### Overview

A viewport is a rectangular area within a flipped coordinate system expanding along the y-axis. With text contents, lines advance expanding the view in the current writing direction. The viewport defines the active area where the framework lays out text fragments. In most cases, the area corresponds to the user visible area with an additional over-scroll region.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 12.0

## Topics

### Creating a viewport layout controller

- `init(textLayoutManager:)`

### Accessing the layout manager

- `textLayoutManager`

### Responding to changes in viewport layout

- `delegate`
- `NSTextViewportLayoutControllerDelegate`

### Accessing the viewport characteristics

- `viewportBounds`
- `viewportRange`
- `adjustViewport(byVerticalOffset:)`
- `layoutViewport()`
- `relocateViewport(to:)`

## See Also

- `Using TextKit 2 to interact with text`
- `NSTextLayoutManager`
- `NSTextContainer`
- `NSTextLayoutFragment`
- `NSTextLineFragment`
- `NSTextLayoutOrientationProvider`
