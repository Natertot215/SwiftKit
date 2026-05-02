---
url: https://developer.apple.com/documentation/appkit/nstoolbaritem
framework: AppKit
category: Views and controls
title: NSToolbarItem
kind: class
captured: 2026-05-02
---

# NSToolbarItem

A single item that appears in a window’s toolbar.

## Declaration

```swift
@MainActor class NSToolbarItem
```

### Overview

An `NSToolbarItem` object displays an image and text string in the toolbar area of a window. You can also create toolbar items that display custom views you provide. Toolbar items provide fast access to common commands or features in the window. For example, the Finder window uses toolbar items to help someone navigate the file system.

You typically create toolbar items at the same time you create your window’s toolbar. The system provides some standard items like spacers you can include in your toolbar. It also provides items that display standard interfaces like the color panel or font panel. For any custom toolbar items you create, provide an action method to call when someone clicks the item.

You can display your toolbar item’s content using a custom view if you prefer, rather than an image and text label. If you specify an `NSSearchField` object for the view, the system automatically adjusts the minimum and maximum size of the search field to the system-standard values.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSMenuToolbarItem`, `NSSearchToolbarItem`, `NSSharingServicePickerToolbarItem`, `NSToolbarItemGroup`, `NSTrackingSeparatorToolbarItem`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCopying`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSValidatedUserInterfaceItem`, `Sendable`, `UIPopoverPresentationControllerSourceItem`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS ?

## Topics

### Creating a toolbar item

- `init(itemIdentifier:)`
- `init(itemIdentifier:barButtonItem:)`

### Getting the toolbar item’s identity

- `itemIdentifier`
- `NSToolbarItem.Identifier`

### Describing the item

- `possibleLabels`
- `label`
- `paletteLabel`
- `title`
- `toolTip`

### Getting the item’s visual appearance

- `image`
- `backgroundTintColor`
- `view`

### Performing the item’s action

- `target`
- `action`

### Configuring the item’s menu

- `menuFormRepresentation`
- `itemMenuFormRepresentation`

### Getting the item’s configuration

- `isVisible`
- `isHidden`
- `isBordered`
- `isNavigational`
- `isEnabled`
- `badge`
- `NSItemBadge`
- `style`
- `NSToolbarItem.Style`
- `visibilityPriority`
- `NSToolbarItem.VisibilityPriority`
- `tag`

### Getting the parent toolbar

- `toolbar`

### Validating the item

- `autovalidates`
- `validate()`

### Deprecated

- `allowsDuplicatesInToolbar`
- `minSize`
- `maxSize`

## See Also

- `NSToolbarItemGroup`
- `NSToolbarItemGroup.ControlRepresentation`
- `NSToolbarItemGroup.SelectionMode`
- `NSMenuToolbarItem`
- `NSSearchToolbarItem`
- `NSTrackingSeparatorToolbarItem`
