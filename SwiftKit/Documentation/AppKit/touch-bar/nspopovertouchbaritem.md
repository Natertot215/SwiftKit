---
url: https://developer.apple.com/documentation/appkit/nspopovertouchbaritem
framework: AppKit
category: Touch Bar
title: NSPopoverTouchBarItem
kind: class
captured: 2026-05-02
---

# NSPopoverTouchBarItem

A bar item that provides a two-state control that can expand into its second state, showing the contents of a bar that it owns.

## Declaration

```swift
class NSPopoverTouchBarItem
```







## Relationships

**Inherits From**: `NSTouchBarItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS 10.12.2

## Topics

### Configuring the collapsed popover

- `collapsedRepresentation`
- `collapsedRepresentationImage`
- `collapsedRepresentationLabel`

### Configuring the expanded popover

- `popoverTouchBar`
- `showsCloseButton`
- `pressAndHoldTouchBar`

### Expanding and collapsing a popover

- `showPopover(_:)`
- `dismissPopover(_:)`
- `makeStandardActivatePopoverGestureRecognizer()`

### Configuring bar customization

- `customizationLabel`

## See Also

- `NSTouchBarItem`
- `NSCandidateListTouchBarItem`
- `NSColorPickerTouchBarItem`
- `NSCustomTouchBarItem`
- `NSGroupTouchBarItem`
- `NSSharingServicePickerTouchBarItem`
- `NSSliderTouchBarItem`
- `NSStepperTouchBarItem`
- `NSUserInterfaceCompressionOptions`
- `NSButtonTouchBarItem`
- `NSPickerTouchBarItem`
- `NSPickerTouchBarItem.ControlRepresentation`
- `NSPickerTouchBarItem.SelectionMode`
