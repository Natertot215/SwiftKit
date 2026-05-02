---
url: https://developer.apple.com/documentation/appkit/nsgrouptouchbaritem
framework: AppKit
category: Touch Bar
title: NSGroupTouchBarItem
kind: class
captured: 2026-05-02
---

# NSGroupTouchBarItem

A bar item that provides a bar to contain other items.

## Declaration

```swift
class NSGroupTouchBarItem
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

### Creating a group

- `init(identifier:items:)`
- `init(identifier:items:allowedCompressionOptions:)`
- `init(alertStyleWithIdentifier:)`

### Configuring groups

- `groupTouchBar`
- `groupUserInterfaceLayoutDirection`

### Configuring item width

- `prefersEqualWidths`
- `preferredItemWidth`

### Configuring item compression

- `effectiveCompressionOptions`
- `prioritizedCompressionOptions`

### Configuring bar customization

- `customizationLabel`

## See Also

- `NSTouchBarItem`
- `NSCandidateListTouchBarItem`
- `NSColorPickerTouchBarItem`
- `NSCustomTouchBarItem`
- `NSPopoverTouchBarItem`
- `NSSharingServicePickerTouchBarItem`
- `NSSliderTouchBarItem`
- `NSStepperTouchBarItem`
- `NSUserInterfaceCompressionOptions`
- `NSButtonTouchBarItem`
- `NSPickerTouchBarItem`
- `NSPickerTouchBarItem.ControlRepresentation`
- `NSPickerTouchBarItem.SelectionMode`
