---
url: https://developer.apple.com/documentation/appkit/nscombobox
framework: AppKit
category: Views and controls
title: NSComboBox
kind: class
captured: 2026-05-02
---

# NSComboBox

A view that displays a list of values in a pop-up menu where the user selects a value or types in a custom value.

## Declaration

```swift
class NSComboBox
```

### Overview

A combo box combines the behavior of an `NSTextField` object with an `NSPopUpButton` object. A combo box displays a list of values from a pop-up list, but also provides a means for users to type in custom values. For example, here’s a combo box in its initial state.

Clicking in the text portion of the control allows the user to edit the current value. When the user clicks the down arrow at the right side of the text field, the pop-up list appears.

The `NSComboBox` class uses `NSComboBoxCell` to implement its user interface.

Also see the `NSComboBoxDataSource` protocol, which declares the methods that `NSComboBox` uses to access the contents of its data source object.





## Relationships

**Inherits From**: `NSTextField`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityNavigableStaticText`, `NSAccessibilityProtocol`, `NSAccessibilityStaticText`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTextContent`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Setting Display Attributes

- `hasVerticalScroller`
- `intercellSpacing`
- `isButtonBordered`
- `itemHeight`
- `numberOfVisibleItems`

### Setting a Data Source

- `dataSource`
- `usesDataSource`

### Configuring the Combo Box Items

- `addItems(withObjectValues:)`
- `addItem(withObjectValue:)`
- `insertItem(withObjectValue:at:)`
- `objectValues`
- `removeAllItems()`
- `removeItem(at:)`
- `removeItem(withObjectValue:)`
- `numberOfItems`

### Manipulating the Displayed List

- `indexOfItem(withObjectValue:)`
- `itemObjectValue(at:)`
- `noteNumberOfItemsChanged()`
- `reloadData()`
- `scrollItemAtIndexToTop(_:)`
- `scrollItemAtIndexToVisible(_:)`

### Manipulating the Selection

- `deselectItem(at:)`
- `indexOfSelectedItem`
- `objectValueOfSelectedItem`
- `selectItem(at:)`
- `selectItem(withObjectValue:)`

### Completing the Text Field

- `completes`

### Accessing the Delegate

- `delegate`

### Notifications

- `selectionDidChangeNotification`
- `selectionIsChangingNotification`
- `willDismissNotification`
- `willPopUpNotification`
