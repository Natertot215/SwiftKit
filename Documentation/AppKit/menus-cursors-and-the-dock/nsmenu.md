---
url: https://developer.apple.com/documentation/appkit/nsmenu
framework: AppKit
category: Menus, cursors, and the Dock
title: NSMenu
kind: class
captured: 2026-05-02
---

# NSMenu

An object that manages an app’s menus.

## Declaration

```swift
class NSMenu
```







## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAppearanceCustomization`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`

## Availability

- macOS ?

## Topics

### Managing the Menu Bar

- `menuBarVisible()`
- `setMenuBarVisible(_:)`
- `menuBarHeight`

### Creating an NSMenu Object

- `init(title:)`
- `init(coder:)`

### Adding and Removing Menu Items

- `insertItem(_:at:)`
- `insertItem(withTitle:action:keyEquivalent:at:)`
- `addItem(_:)`
- `addItem(withTitle:action:keyEquivalent:)`
- `removeItem(_:)`
- `removeItem(at:)`
- `itemChanged(_:)`
- `removeAllItems()`

### Finding Menu Items

- `item(withTag:)`
- `item(withTitle:)`
- `item(at:)`
- `numberOfItems`
- `items`

### Finding Indices of Menu Items

- `index(of:)`
- `indexOfItem(withTitle:)`
- `indexOfItem(withTag:)`
- `indexOfItem(withTarget:andAction:)`
- `indexOfItem(withRepresentedObject:)`
- `indexOfItem(withSubmenu:)`

### Managing Submenus

- `setSubmenu(_:for:)`
- `submenuAction(_:)`
- `supermenu`
- `isTornOff`

### Enabling and Disabling Menu Items

- `autoenablesItems`
- `update()`

### Getting and Setting the Menu Font

- `font`

### Handling Keyboard Equivalents

- `performKeyEquivalent(with:)`

### Simulating Mouse Clicks

- `performActionForItem(at:)`

### Managing the Title

- `title`

### Selecting Items

- `selectedItems`
- `selectionMode`
- `NSMenu.SelectionMode`

### Configuring Menu Size

- `minimumWidth`
- `size`

### Getting Menu Properties

- `propertiesToUpdate`

### Managing Presentation Styles

- `presentationStyle`
- `NSMenu.PresentationStyle`

### Working with Palettes

- `palette(colors:titles:template:onSelectionChange:)`

### Managing Menu Change Notifications

- `menuChangedMessagesEnabled`

### Displaying Contextual Menus

- `allowsContextMenuPlugIns`

### Displaying Context-Sensitive Help

- `popUpContextMenu(_:with:for:)`
- `popUpContextMenu(_:with:for:with:)`
- `helpRequested(with:)`
- `popUp(positioning:at:in:)`

### Managing Display of the State Column

- `showsStateColumn`

### Controlling Allocation Zones

- `menuZone()`

### Handling Highlighting

- `highlightedItem`

### Managing the User Interface

- `userInterfaceLayoutDirection`

### Managing the Delegate

- `delegate`

### Handling Tracking

- `cancelTracking()`
- `cancelTrackingWithoutAnimation()`

### Constants

- `NSMenu.Properties`

### Notifications

- `didAddItemNotification`
- `didChangeItemNotification`
- `didBeginTrackingNotification`
- `didEndTrackingNotification`
- `didRemoveItemNotification`
- `didSendActionNotification`
- `willSendActionNotification`

### Instance Properties

- `automaticallyInsertsWritingToolsItems`

## See Also

- `NSMenuItem`
- `NSMenuItemBadge`
- `NSMenuDelegate`
