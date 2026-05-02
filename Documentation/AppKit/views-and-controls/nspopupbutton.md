---
url: https://developer.apple.com/documentation/appkit/nspopupbutton
framework: AppKit
category: Views and controls
title: NSPopUpButton
kind: class
captured: 2026-05-02
---

# NSPopUpButton

A control for selecting an item from a list.

## Declaration

```swift
class NSPopUpButton
```

### Overview

An `NSPopUpButton` object uses an `NSPopUpButtonCell` object to implement its user interface.

Note that while a menu is tracking user input, programmatic changes to the menu, such as adding, removing, or changing items on the menu, is not reflected.

> **IMPORTANT:** Setting a pop up button’s `NSCell/image` property has no effect. The image displayed in a pop up button is taken from the selected menu item (in the case of a pop up menu) or from the first menu item (in the case of a pull-down menu).





## Relationships

**Inherits From**: `NSButton`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityButton`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceCompression`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Initializing an NSPopUpButton

- `init(frame:pullsDown:)`

### Configuring the Cell

- `NSPopUpButtonCell`

### Setting the type of menu

- `pullsDown`
- `autoenablesItems`

### Inserting and deleting items

- `addItem(withTitle:)`
- `addItems(withTitles:)`
- `insertItem(withTitle:at:)`
- `removeAllItems()`
- `removeItem(withTitle:)`
- `removeItem(at:)`

### Getting the user’s selection

- `selectedItem`
- `titleOfSelectedItem`
- `indexOfSelectedItem`

### Setting the current selection

- `select(_:)`
- `selectItem(at:)`
- `selectItem(withTag:)`
- `selectItem(withTitle:)`

### Getting menu items

- `menu`
- `numberOfItems`
- `itemArray`
- `item(at:)`
- `itemTitle(at:)`
- `itemTitles`
- `item(withTitle:)`
- `lastItem`

### Getting the indices of menu items

- `index(of:)`
- `indexOfItem(withTag:)`
- `indexOfItem(withTitle:)`
- `indexOfItem(withRepresentedObject:)`
- `indexOfItem(withTarget:andAction:)`

### Setting the cell edge to pop out in restricted situations

- `preferredEdge`

### Setting the title

- `setTitle(_:)`

### Setting the state

- `synchronizeTitleAndSelectedItem()`

### Notifications

- `willPopUpNotification`

### Instance Methods

- `selectedTag()`

### Initializers

- `init(image:pullDownMenu:)`
- `init(popUpMenu:target:action:)`
- `init(title:image:pullDownMenu:)`

### Instance Properties

- `altersStateOfSelectedItem`
- `usesItemFromMenu`

## See Also

- `Responding to control-based events using target-action`
- `NSButton`
- `NSColorWell`
- `Combo Box`
- `NSComboButton`
- `Date Picker`
- `NSImageView`
- `NSLevelIndicator`
- `Path Control`
- `NSProgressIndicator`
- `NSRuleEditor`
- `NSPredicateEditor`
- `Search Field`
- `NSSegmentedControl`
- `Slider`
