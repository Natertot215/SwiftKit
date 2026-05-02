---
url: https://developer.apple.com/documentation/appkit/nssteppertouchbaritem
framework: AppKit
category: Touch Bar
title: NSStepperTouchBarItem
kind: class
captured: 2026-05-02
---

# NSStepperTouchBarItem

A bar item that provides a stepper control for incrementing or decrementing a value.

## Declaration

```swift
class NSStepperTouchBarItem
```







## Relationships

**Inherits From**: `NSTouchBarItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS 10.15

## Topics

### Creating a stepper item

- `init(identifier:drawingHandler:)`
- `init(identifier:formatter:)`

### Handling stepper interaction

- `target`
- `action`

### Managing the stepper’s value

- `value`
- `maxValue`
- `minValue`
- `increment`

### Configuring bar customization

- `customizationLabel`

## See Also

- `NSTouchBarItem`
- `NSCandidateListTouchBarItem`
- `NSColorPickerTouchBarItem`
- `NSCustomTouchBarItem`
- `NSGroupTouchBarItem`
- `NSPopoverTouchBarItem`
- `NSSharingServicePickerTouchBarItem`
- `NSSliderTouchBarItem`
- `NSUserInterfaceCompressionOptions`
- `NSButtonTouchBarItem`
- `NSPickerTouchBarItem`
- `NSPickerTouchBarItem.ControlRepresentation`
- `NSPickerTouchBarItem.SelectionMode`
