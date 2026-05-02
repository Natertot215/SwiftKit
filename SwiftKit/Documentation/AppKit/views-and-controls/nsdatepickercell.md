---
url: https://developer.apple.com/documentation/appkit/nsdatepickercell
framework: AppKit
category: Views and controls
title: NSDatePickerCell
kind: class
captured: 2026-05-02
---

# NSDatePickerCell

An object that controls the behavior of a date picker, or of a single date picker cell in a matrix.

## Declaration

```swift
class NSDatePickerCell
```







## Relationships

**Inherits From**: `NSActionCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Configuring Appearance

- `backgroundColor`
- `drawsBackground`
- `textColor`
- `datePickerStyle`
- `datePickerElements`

### Range Mode

- `datePickerMode`

### Object Values

- `dateValue`
- `timeInterval`
- `calendar`
- `locale`
- `timeZone`

### Date Range Constraints

- `minDate`
- `maxDate`

### Getting and Setting the Delegate

- `delegate`

### Constants

- `NSDatePicker.Style`
- `NSDatePicker.Mode`
- `NSDatePicker.ElementFlags`

### Initializers

- `init(coder:)`
- `init(textCell:)`

## See Also

- `NSDatePickerCellDelegate`
