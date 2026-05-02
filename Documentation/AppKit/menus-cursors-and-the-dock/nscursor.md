---
url: https://developer.apple.com/documentation/appkit/nscursor
framework: AppKit
category: Menus, cursors, and the Dock
title: NSCursor
kind: class
captured: 2026-05-02
---

# NSCursor

A pointer (also called a cursor).

## Declaration

```swift
class NSCursor
```

### Overview

The following table shows and describes the system cursors, and indicates the class method for obtaining them:

[table — see source]

In macOS 10.3 and later, cursor size is no longer limited to 16 by 16 pixels.

#### Cursor rectangles

In Cocoa, you can change the currently displayed cursor based on the position of the mouse over one of your views. You might use this technique to provide visual feedback about what actions the user can take with the mouse. For example, you might display one of the resize cursors whenever the mouse moves over a portion of your view that acts as a custom resizing handle. To set this up, you associate a cursor object with one or more cursor rectangles in the view.

Cursor rectangles are a specialized type of tracking rectangles, which are used to monitor the mouse location in a view. Views implement cursor rectangles using tracking rectangles but provide methods for setting and refreshing cursor rectangles that are distinct from the generic tracking rectangle interface. For information on how to set up cursor rectangles, see `https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/EventOverview/MouseTrackingEvents/MouseTrackingEvents.html#//apple_ref/doc/uid/10000060i-CH11`.

#### Balancing cursor hiding and unhiding

Each call to `NSCursor/hide()` cursor must have a corresponding `NSCursor/unhide()` call. For example,

```objc
[NSCursor hide];
[NSCursor hide];
// ...
[NSCursor unhide];
```

Will result in the cursor still being hidden because the `hide` and `unhide` method invocations are not balanced. Instead you must balance the method calls, such as in the following example:

```objc
[NSCursor hide];
[NSCursor hide];
// ...
[NSCursor unhide];
[NSCursor unhide];
```

There are corresponding cursor `hide` and `unhide` calls, thus the cursor will become visible.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS 10.0

## Topics

### Initializing a new cursor

- `init(image:hotSpot:)`
- `init(coder:)`

### Setting cursor attributes

- `image`
- `hotSpot`
- `hide()`
- `unhide()`
- `setHiddenUntilMouseMoves(_:)`

### Controlling which cursor is current

- `pop()`
- `pop()`
- `push()`
- `set()`

### Retrieving cursor instances

- `current`
- `currentSystem`
- `arrow`
- `contextualMenu`
- `closedHand`
- `crosshair`
- `disappearingItem`
- `dragCopy`
- `dragLink`
- `iBeam`
- `iBeamCursorForVerticalLayout`
- `openHand`
- `operationNotAllowed`
- `pointingHand`
- `zoomIn`
- `zoomOut`
- `resizeDown`
- `resizeLeft`
- `resizeLeftRight`
- `resizeRight`
- `resizeUp`
- `resizeUpDown`
- `columnResize`
- `columnResize(directions:)`
- `rowResize`
- `rowResize(directions:)`
- `frameResize(position:directions:)`
- `NSCursor.FrameResizeDirection`

### Constants

- `AppKit Versions for NSCursor Bug Fixes`

### Deprecated

- `init(image:foregroundColorHint:backgroundColorHint:hotSpot:)`
- `mouseEntered(with:)`
- `setOnMouseEntered(_:)`
- `isSetOnMouseEntered`
- `mouseExited(with:)`
- `setOnMouseExited(_:)`
- `isSetOnMouseExited`

## See Also

- `NSTrackingArea`
