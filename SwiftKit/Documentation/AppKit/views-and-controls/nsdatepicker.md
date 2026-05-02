---
url: https://developer.apple.com/documentation/appkit/nsdatepicker
framework: AppKit
category: Views and controls
title: NSDatePicker
kind: class
captured: 2026-05-02
---

# NSDatePicker

A display of a calendar date with controls for editing the date value.

## Declaration

```swift
class NSDatePicker
```

### Overview

`NSDatePicker` uses an `NSDatePickerCell` to implement much of the control’s functionality. `NSDatePicker` provides cover methods for most of `NSDatePickerCell` methods, which invoke the corresponding cell method.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Configuring Date Pickers

- `isBezeled`
- `isBordered`
- `backgroundColor`
- `drawsBackground`
- `textColor`
- `datePickerStyle`
- `presentsCalendarOverlay`
- `delegate`
- `datePickerElements`
- `NSDatePicker.ElementFlags`
- `NSDatePicker.Style`

### Controlling Date Picker Range and Mode

- `calendar`
- `locale`
- `datePickerMode`
- `timeZone`
- `NSDatePicker.Mode`

### Accessing Object Values

- `dateValue`
- `timeInterval`

### Constraining the Displayable/Selectable Range

- `minDate`
- `maxDate`
