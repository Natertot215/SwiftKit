---
url: https://developer.apple.com/documentation/appkit/nsdrawer
framework: AppKit
category: Deprecated symbols
title: NSDrawer
kind: class
captured: 2026-05-02
---

# NSDrawer

A user interface element that contains and displays text, scroll, and browser views, in addition to other view subclasses.

## Declaration

```swift
class NSDrawer
```

### Overview

A drawer is associated with a window, called its parent, and can appear only while its parent is visible onscreen. A drawer cannot be moved or ordered independently of a window, but is instead attached to one edge of its parent and moves along with it.





## Relationships

**Inherits From**: `NSResponder`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.0 (deprecated 10.13)

## Topics

### Creating Drawers

- `init(contentSize:preferredEdge:)`
- `delegate`

### Opening and Closing Drawers

- `close()`
- `close(_:)`
- `open()`
- `open(_:)`
- `open(on:)`
- `toggle(_:)`
- `state`

### Managing Drawer Size

- `contentSize`
- `leadingOffset`
- `maxContentSize`
- `minContentSize`
- `trailingOffset`

### Managing Drawer Edges

- `edge`
- `preferredEdge`

### Managing Drawer Views

- `contentView`
- `parentWindow`

### Constants

- `NSDrawer.State`

### Notifications

- `didCloseNotification`
- `didOpenNotification`
- `willCloseNotification`
- `willOpenNotification`

## See Also

- `NSOpenGLView`
- `NSOpenGLContext`
- `NSOpenGLLayer`
- `NSOpenGLPixelFormat`
- `NSForm`
- `NSFormCell`
- `NSMenuItemCell`
