---
url: https://developer.apple.com/documentation/appkit/nscomboboxdelegate
framework: AppKit
category: Views and controls
title: NSComboBoxDelegate
kind: protocol
captured: 2026-05-02
---

# NSComboBoxDelegate

A set of optional methods implemented by delegates of combo box objects.

## Declaration

```swift
protocol NSComboBoxDelegate : NSTextFieldDelegate
```







## Relationships

**Inherits From**: `NSControlTextEditingDelegate`, `NSObjectProtocol`, `NSTextFieldDelegate`

## Availability

- macOS ?

## Topics

### Manipulating the selection

- `comboBoxSelectionDidChange(_:)`
- `comboBoxSelectionIsChanging(_:)`
- `comboBoxWillDismiss(_:)`
- `comboBoxWillPopUp(_:)`

## See Also

- `NSComboBoxDataSource`
