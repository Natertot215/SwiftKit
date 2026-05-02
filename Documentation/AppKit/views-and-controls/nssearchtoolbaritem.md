---
url: https://developer.apple.com/documentation/appkit/nssearchtoolbaritem
framework: AppKit
category: Views and controls
title: NSSearchToolbarItem
kind: class
captured: 2026-05-02
---

# NSSearchToolbarItem

A toolbar item that contains a search field optimized for performing text-based searches.

## Declaration

```swift
class NSSearchToolbarItem
```

### Overview

`NSSearchToolbarItem` automatically resizes to accommodate typing when the focus switches to the toolbar item. When the toolbar is low on space, the system may collapse the search item into a button representation, which then expands to a full search field when the user clicks on it.





## Relationships

**Inherits From**: `NSToolbarItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSValidatedUserInterfaceItem`, `Sendable`, `SendableMetatype`

## Availability

- macOS 11.0

## Topics

### Configuring a search item

- `preferredWidthForSearchField`
- `resignsFirstResponderWithCancel`
- `searchField`

### Controlling search interactions

- `beginSearchInteraction()`
- `endSearchInteraction()`

## See Also

- `NSToolbarItem`
- `NSToolbarItemGroup`
- `NSToolbarItemGroup.ControlRepresentation`
- `NSToolbarItemGroup.SelectionMode`
- `NSMenuToolbarItem`
- `NSTrackingSeparatorToolbarItem`
