---
url: https://developer.apple.com/documentation/appkit/nspickertouchbaritem
framework: AppKit
category: Touch Bar
title: NSPickerTouchBarItem
kind: class
captured: 2026-05-02
---

# NSPickerTouchBarItem

A bar item that provides a picker control with multiple options.

## Declaration

```swift
class NSPickerTouchBarItem
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

### Creating a picker item

- `init(identifier:images:selectionMode:target:action:)`
- `init(identifier:labels:selectionMode:target:action:)`

### Configuring picker appearance

- `numberOfOptions`
- `setLabel(_:at:)`
- `label(at:)`
- `setImage(_:at:)`
- `image(at:)`
- `collapsedRepresentationImage`
- `collapsedRepresentationLabel`
- `controlRepresentation`
- `NSPickerTouchBarItem.ControlRepresentation`

### Configuring picker state

- `isEnabled`
- `isEnabled(at:)`
- `setEnabled(_:at:)`

### Handling selection

- `selectedIndex`
- `selectionColor`
- `selectionMode`
- `NSPickerTouchBarItem.SelectionMode`

### Handling picker interaction

- `action`
- `target`

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
- `NSStepperTouchBarItem`
- `NSUserInterfaceCompressionOptions`
- `NSButtonTouchBarItem`
- `NSPickerTouchBarItem.ControlRepresentation`
- `NSPickerTouchBarItem.SelectionMode`
