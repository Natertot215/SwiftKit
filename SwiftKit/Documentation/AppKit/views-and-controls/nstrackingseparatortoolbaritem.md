---
url: https://developer.apple.com/documentation/appkit/nstrackingseparatortoolbaritem
framework: AppKit
category: Views and controls
title: NSTrackingSeparatorToolbarItem
kind: class
captured: 2026-05-02
---

# NSTrackingSeparatorToolbarItem

A toolbar separator that aligns with the vertical split view in the same window.

## Declaration

```swift
class NSTrackingSeparatorToolbarItem
```

### Overview

Use a `NSTrackingSeparatorToolbarItem` to divide an `NSToolbar` into sections that visually align with the views on either side of the divider of the `NSTrackingSeparatorToolbarItem/splitView`. This keeps `NSToolbarItem`s above the content that’s the `NSToolbarItem/target` for the item’s `NSToolbarItem/target`.

The `splitView` must be in the same window as the toolbar containing this item before showing the toolbar.





## Relationships

**Inherits From**: `NSToolbarItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSValidatedUserInterfaceItem`, `Sendable`, `SendableMetatype`

## Availability

- macOS 11.0

## Topics

### Creating a tracking separator

- `init(identifier:splitView:dividerIndex:)`

### configuring a tracking separator

- `dividerIndex`
- `splitView`

## See Also

- `NSToolbarItem`
- `NSToolbarItemGroup`
- `NSToolbarItemGroup.ControlRepresentation`
- `NSToolbarItemGroup.SelectionMode`
- `NSMenuToolbarItem`
- `NSSearchToolbarItem`
