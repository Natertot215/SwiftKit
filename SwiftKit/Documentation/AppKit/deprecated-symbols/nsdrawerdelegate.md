---
url: https://developer.apple.com/documentation/appkit/nsdrawerdelegate
framework: AppKit
category: Deprecated symbols
title: NSDrawerDelegate
kind: protocol
captured: 2026-05-02
---

# NSDrawerDelegate

A set of methods that drawer delegates implement to open, close, and resize the drawer.

## Declaration

```swift
protocol NSDrawerDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Opening and Closing Drawers

- `drawerShouldOpen(_:)`
- `drawerWillOpen(_:)`
- `drawerDidOpen(_:)`
- `drawerShouldClose(_:)`
- `drawerWillClose(_:)`
- `drawerDidClose(_:)`

### Managing Drawer Size

- `drawerWillResizeContents(_:to:)`

## See Also

- `NSAccessibility`
- `NSEditorRegistration`
- `NSInputServiceProvider`
- `NSInputServerMouseTracker`
