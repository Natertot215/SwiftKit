---
url: https://developer.apple.com/documentation/appkit/nsstepper
framework: AppKit
category: Views and controls
title: NSStepper
kind: class
captured: 2026-05-02
---

# NSStepper

An interface with up and down arrow buttons for incrementing or decrementing a value.

## Declaration

```swift
class NSStepper
```

### Overview

A stepper consists of two small arrows that can increment and decrement a value that appears beside it, such as a date or time. The illustration below shows a stepper to the right of a text field, which would show the stepper’s value.

The `NSStepper` class uses the `NSStepperCell` class to implement its user interface.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAccessibilityStepper`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Configuring the Cell

- `NSStepperCell`

### Specifying value range

- `maxValue`
- `minValue`
- `increment`

### Specifying how the stepper responds

- `autorepeat`
- `valueWraps`

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
- `NSPopUpButton`
- `NSProgressIndicator`
- `NSRuleEditor`
- `NSPredicateEditor`
- `Search Field`
- `NSSegmentedControl`
