---
url: https://developer.apple.com/documentation/appkit/nsswitch
framework: AppKit
category: Views and controls
title: NSSwitch
kind: class
captured: 2026-05-02
---

# NSSwitch

A control that offers a binary choice.

## Declaration

```swift
class NSSwitch
```

### Overview

The `NSSwitch` class provides a simple interface for displaying and toggling a Boolean state, such as on/off. A switch toggles its `NSSwitch/state` and sends its `NSControl/action` when clicked, activated through the keyboard, or tapped in the Touch Bar. `NSSwitch` also allows dragging between states, and if `NSControl/isContinuous` is `true`, the switch sends its `NSControl/action` for each change in position during the drag.

`NSSwitch` doesn’t use an instance of `NSCell` to provide its functionality. The `NSControl/cellClass` class property and `NSControl/cell` instance property both return `nil-227m0`, and they ignore attempts to set a non-`nil-227m0` value.

For design guidance, see Human Interface Guidelines > `doc://com.apple.documentation/design/Human-Interface-Guidelines/toggles`.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityButton`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAccessibilitySwitch`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.15

## Topics

### Managing Switch State

- `state`

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
