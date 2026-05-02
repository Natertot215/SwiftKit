---
url: https://developer.apple.com/documentation/appkit/nstextfielddelegate
framework: AppKit
category: Views and controls
title: NSTextFieldDelegate
kind: protocol
captured: 2026-05-02
---

# NSTextFieldDelegate

A protocol that a text field delegate can use to control its field editor action menu.

## Declaration

```swift
protocol NSTextFieldDelegate : NSControlTextEditingDelegate
```







## Relationships

**Inherits From**: `NSControlTextEditingDelegate`, `NSObjectProtocol`

**Inherited By**: `NSComboBoxDelegate`, `NSSearchFieldDelegate`, `NSTokenFieldDelegate`

## Availability

- macOS ?

## Topics

### Controlling Editing Behavior

- `textField(_:textView:candidates:forSelectedRange:)`
- `textField(_:textView:candidatesForSelectedRange:)`
- `textField(_:textView:shouldSelectCandidateAt:)`

## See Also

- `NSTextField`
- `NSTextView`
- `NSTextViewDelegate`
- `NSTextDelegate`
- `NSText`
