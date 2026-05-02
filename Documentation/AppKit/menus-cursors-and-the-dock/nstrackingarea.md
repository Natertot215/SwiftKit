---
url: https://developer.apple.com/documentation/appkit/nstrackingarea
framework: AppKit
category: Menus, cursors, and the Dock
title: NSTrackingArea
kind: class
captured: 2026-05-02
---

# NSTrackingArea

A region of a view that generates mouse-tracking and cursor-update events when the pointer is over that region.

## Declaration

```swift
class NSTrackingArea
```

### Overview

When creating a tracking-area object, you specify a rectangle (in the view’s coordinate system), an owning object, and one or more options, along with (optionally) a dictionary of data. After it’s created, you add the tracking-area object to a view using the `NSView/addTrackingArea(_:)` method. Depending on the options specified, the owner of the tracking area receives `NSResponder/mouseEntered(with:)`, `NSResponder/mouseExited(with:)`, `NSResponder/mouseMoved(with:)`, and `NSResponder/cursorUpdate(with:)` messages when the mouse cursor enters, moves within, and leaves the tracking area. Currently the tracking area is restricted to rectangles.

An `NSTrackingArea` object belongs to its view rather than to its window. Consequently, you can add and remove tracking rectangles without needing to worry if the view has been added to a window. In addition, this design makes it possible for the AppKit to compute the geometry of tracking areas automatically when a view moves and, in some cases, when a view changes size.

Using `NSTrackingArea`, you can configure the scope of activity for mouse tracking. There are four options:

- The tracking area is active only when the view is first responder.
- The tracking area is active when the view is in the key window.
- The tracking area is active when the application is active.
- The tracking area is active always (even when the application is inactive).

Other options for `NSTrackingArea` objects include specifying that the tracking area should be synchronized with the visible rectangle of the view (`NSView/visibleRect`) and for generating `mouseEntered:` and `mouseExited`: events when the mouse is dragged.

Other `NSView` methods related to `NSTrackingArea` objects (in addition to `NSView/addTrackingArea(_:)`) include `NSView/removeTrackingArea(_:)` and `NSView/updateTrackingAreas()`. Views can override the latter method to recompute and replace their `NSTrackingArea` objects in certain situations, such as a change in the size of the `visibleRect`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS 10.5

## Topics

### Initializing the Tracking-Area Object

- `init(rect:options:owner:userInfo:)`

### Getting Object Attributes

- `options`
- `owner`
- `rect`
- `userInfo`

### Constants

- `NSTrackingArea.Options`

### Initializers

- `init(coder:)`

## See Also

- `NSCursor`
