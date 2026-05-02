---
url: https://developer.apple.com/documentation/appkit/nswindowtabgroup
framework: AppKit
category: Windows, panels, and screens
title: NSWindowTabGroup
kind: class
captured: 2026-05-02
---

# NSWindowTabGroup

A group of windows that display together as a single tabbed window.

## Declaration

```swift
class NSWindowTabGroup
```

### Overview

AppKit automatically creates instances of `NSWindowTabGroup` to reflect the tabbing state of your windows. You can access a window’s current tab group using the `NSWindow/tabGroup` property.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.13

## Topics

### Checking the Group Identifier

- `identifier`

### Configuring the Tab User Interface

- `isOverviewVisible`
- `isTabBarVisible`

### Managing Tabbed Windows

- `windows`
- `selectedWindow`
- `addWindow(_:)`
- `insertWindow(_:at:)`
- `removeWindow(_:)`

## See Also

- `tabGroup`

- `NSWindow`
- `NSPanel`
- `NSWindowDelegate`
- `NSWindowTab`
