---
url: https://developer.apple.com/documentation/appkit/nsstatusbar
framework: AppKit
category: Menus, cursors, and the Dock
title: NSStatusBar
kind: class
captured: 2026-05-02
---

# NSStatusBar

An object that manages a collection of status items displayed within the system-wide menu bar.

## Declaration

```swift
class NSStatusBar
```

### Overview

A status item (an instance of `NSStatusItem`) can be displayed with text or an icon, can provide a menu and a target-action message when clicked, or can be a fully customized view that you create. Use status items sparingly and only if the alternatives (such as a Dock menu, preference pane, or status window) are not suitable. Because there is limited space in which to display status items, status items are not guaranteed to be available at all times. For this reason, do not rely on them being available and always provide a user preference for hiding your application’s status items to free up space in the menu bar.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Getting the System-Wide Instance

- `system`

### Managing Status items

- `statusItem(withLength:)`
- `removeStatusItem(_:)`

### Getting Status-Bar Attributes

- `isVertical`
- `thickness`

### Constants

- `Status Bar Item Length`

## See Also

- `NSStatusItem`
- `NSStatusBarButton`
