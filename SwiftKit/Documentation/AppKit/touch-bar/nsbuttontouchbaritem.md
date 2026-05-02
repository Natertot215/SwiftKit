---
url: https://developer.apple.com/documentation/appkit/nsbuttontouchbaritem
framework: AppKit
category: Touch Bar
title: NSButtonTouchBarItem
kind: class
captured: 2026-05-02
---

# NSButtonTouchBarItem

A bar item that provides a button.

## Declaration

```swift
class NSButtonTouchBarItem
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

### Creating a button item

- `init(identifier:image:target:action:)`
- `init(identifier:title:image:target:action:)`
- `init(identifier:title:target:action:)`

### Configuring button appearance

- `title`
- `image`
- `bezelColor`

### Configuring button state

- `isEnabled`

### Handling button interaction

- `target`
- `action`

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
- `NSPickerTouchBarItem`
- `NSPickerTouchBarItem.ControlRepresentation`
- `NSPickerTouchBarItem.SelectionMode`
