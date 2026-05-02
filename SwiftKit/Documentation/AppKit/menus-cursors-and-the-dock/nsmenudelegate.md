---
url: https://developer.apple.com/documentation/appkit/nsmenudelegate
framework: AppKit
category: Menus, cursors, and the Dock
title: NSMenuDelegate
kind: protocol
captured: 2026-05-02
---

# NSMenuDelegate

The optional methods implemented by delegates of `NSMenu` objects to manage menu display and handle some events.

## Declaration

```swift
protocol NSMenuDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Handling Keyboard Equivalents

- `menuHasKeyEquivalent(_:for:target:action:)`

### Updating Menu Layout

- `menu(_:update:at:shouldCancel:)`
- `confinementRect(for:on:)`

### Handling Highlighting

- `menu(_:willHighlight:)`

### Handling Open and Close Events

- `menuWillOpen(_:)`
- `menuDidClose(_:)`

### Handling Tracking

- `numberOfItems(in:)`
- `menuNeedsUpdate(_:)`

## See Also

- `NSMenu`
- `NSMenuItem`
- `NSMenuItemBadge`
