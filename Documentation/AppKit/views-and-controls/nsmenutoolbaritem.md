---
url: https://developer.apple.com/documentation/appkit/nsmenutoolbaritem
framework: AppKit
category: Views and controls
title: NSMenuToolbarItem
kind: class
captured: 2026-05-02
---

# NSMenuToolbarItem

A control that presents a menu in a window’s toolbar.

## Declaration

```swift
class NSMenuToolbarItem
```

### Overview

If you set an action on an `NSMenuToolbarItem` control item, the user invokes the action when clicking on the item through pressing and holding to display the menu. If you set an action on the item and `NSMenuToolbarItem/showsIndicator` to `true`, the system displays the indicator as a separate segment so the user can invoke the menu with a click on that segment.

If you don’t set an action on the `NSMenuToolbarItem`, a simple click invokes the menu, and the indicator is purely decorative.





## Relationships

**Inherits From**: `NSToolbarItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSValidatedUserInterfaceItem`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS 10.15

## Topics

### Configuring a menu toolbar item

- `showsIndicator`
- `menu`
- `itemMenu`

## See Also

- `NSToolbarItem`
- `NSToolbarItemGroup`
- `NSToolbarItemGroup.ControlRepresentation`
- `NSToolbarItemGroup.SelectionMode`
- `NSSearchToolbarItem`
- `NSTrackingSeparatorToolbarItem`
