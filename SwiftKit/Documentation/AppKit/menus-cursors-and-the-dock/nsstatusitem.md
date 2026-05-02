---
url: https://developer.apple.com/documentation/appkit/nsstatusitem
framework: AppKit
category: Menus, cursors, and the Dock
title: NSStatusItem
kind: class
captured: 2026-05-02
---

# NSStatusItem

An individual element displayed in the system menu bar.

## Declaration

```swift
class NSStatusItem
```

### Overview

The `NSStatusBar` method `NSStatusBar/statusItem(withLength:)` creates instances of this class and automatically adds them to the menu bar. Use the `NSStatusItem/button` property to customize the appearance and behavior of the status item.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Getting the Item’s Status Bar

- `statusBar`

### Managing the Status Item’s Behavior

- `behavior`
- `NSStatusItem.Behavior`
- `button`
- `menu`

### Configuring the Status Item’s Appearance

- `isVisible`
- `length`
- `squareLength`
- `variableLength`

### Setting the Autosave Name

- `autosaveName`
- `NSStatusItem.AutosaveName`

### Deprecated

- `isEnabled`
- `target`
- `action`
- `doubleAction`
- `sendAction(on:)`
- `popUpMenu(_:)`
- `title`
- `attributedTitle`
- `image`
- `alternateImage`
- `highlightMode`
- `toolTip`
- `view`
- `drawStatusBarBackground(in:withHighlight:)`

## See Also

- `NSStatusBar`
- `NSStatusBarButton`
