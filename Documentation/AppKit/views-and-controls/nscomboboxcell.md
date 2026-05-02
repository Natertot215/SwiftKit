---
url: https://developer.apple.com/documentation/appkit/nscomboboxcell
framework: AppKit
category: Views and controls
title: NSComboBoxCell
kind: class
captured: 2026-05-02
---

# NSComboBoxCell

The user interface of a combo box.

## Declaration

```swift
class NSComboBoxCell
```

### Overview

`NSComboBoxCell` is a subclass of `NSTextFieldCell` used to implement the user interface of “combo boxes” (see `NSComboBox` for information on how combo boxes look and work). The `NSComboBox` subclass of `NSTextField` uses a single `NSComboBoxCell`, and essentially all of the `NSComboBox` class’s methods simply invoke the corresponding `NSComboBoxCell` method.

Also see the `NSComboBoxCellDataSource` protocol, which declares the methods that an `NSComboBoxCell` object uses to access the contents of its data source object.





## Relationships

**Inherits From**: `NSTextFieldCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Setting Display Attributes

- `hasVerticalScroller`
- `isButtonBordered`
- `intercellSpacing`
- `itemHeight`
- `numberOfVisibleItems`

### Accessing a Data Source

- `dataSource`
- `usesDataSource`

### Working with an Internal List

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

- `completedString(_:)`
- `completes`

## See Also

- `NSComboBoxCellDataSource`
