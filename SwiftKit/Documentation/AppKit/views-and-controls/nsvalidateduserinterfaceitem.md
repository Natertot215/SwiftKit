---
url: https://developer.apple.com/documentation/appkit/nsvalidateduserinterfaceitem
framework: AppKit
category: Views and controls
title: NSValidatedUserInterfaceItem
kind: protocol
captured: 2026-05-02
---

# NSValidatedUserInterfaceItem

A protocol that a custom class can adopt to manage the automatic enablement of a UI control.

## Declaration

```swift
protocol NSValidatedUserInterfaceItem
```

### Overview

The `NSValidatedUserInterfaceItem` protocol works with the `NSUserInterfaceValidations` protocol to enable or disable a control automatically, depending on whether any responder in the responder chain can handle the control’s action method. The `NSMenuItem` and `NSToolbarItem` classes implement this protocol.

By conforming to this protocol, your control can participate in this validation mechanism. To validate a control, the application calls `NSUserInterfaceValidations/validateUserInterfaceItem(_:)` for each item in the responder chain, starting with the first responder. If no responder returns `true`, the item is disabled. For example, a menu item that sends the `copy:` action message would disable itself if no responder in the responder chain can be copied.





## Relationships

**Conforming Types**: `NSMenuItem`, `NSMenuToolbarItem`, `NSSearchToolbarItem`, `NSSharingServicePickerToolbarItem`, `NSToolbarItem`, `NSToolbarItemGroup`, `NSTrackingSeparatorToolbarItem`

## Availability

- macOS ?

## Topics

### Getting information about a user interface item

- `action`
- `tag`

## See Also

- `NSUserInterfaceValidations`
