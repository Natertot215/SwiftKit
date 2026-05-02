---
url: https://developer.apple.com/documentation/appkit/nscontroltexteditingdelegate
framework: AppKit
category: Views and controls
title: NSControlTextEditingDelegate
kind: protocol
captured: 2026-05-02
---

# NSControlTextEditingDelegate

A set of optional methods implemented by delegates of `NSControl` subclasses to respond to editing actions.

## Declaration

```swift
protocol NSControlTextEditingDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

**Inherited By**: `NSComboBoxDelegate`, `NSMatrixDelegate`, `NSOutlineViewDelegate`, `NSSearchFieldDelegate`, `NSTableViewDelegate`, `NSTextFieldDelegate`, `NSTokenFieldDelegate`

## Availability

- macOS ?

## Topics

### Validating a Control’s Value

- `control(_:isValidObject:)`
- `control(_:didFailToValidatePartialString:errorDescription:)`

### Responding to Text Formatting

- `control(_:didFailToFormatString:errorDescription:)`

### Responding to Text Editing

- `control(_:textShouldBeginEditing:)`
- `control(_:textShouldEndEditing:)`

### Working with Text Completion

- `control(_:textView:completions:forPartialWordRange:indexOfSelectedItem:)`

### Working with Key Bindings

- `control(_:textView:doCommandBy:)`

### Instance Methods

- `controlTextDidBeginEditing(_:)`
- `controlTextDidChange(_:)`
- `controlTextDidEndEditing(_:)`

## See Also

- `NSTextFieldDelegate`
