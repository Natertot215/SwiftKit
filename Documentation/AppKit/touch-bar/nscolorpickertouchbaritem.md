---
url: https://developer.apple.com/documentation/appkit/nscolorpickertouchbaritem
framework: AppKit
category: Touch Bar
title: NSColorPickerTouchBarItem
kind: class
captured: 2026-05-02
---

# NSColorPickerTouchBarItem

A bar item that provides a system-defined color picker.

## Declaration

```swift
class NSColorPickerTouchBarItem
```

### Overview

For design guidance, see `https://developer.apple.com/design/human-interface-guidelines/macos/touch-bar/touch-bar-controls-and-views/#color-pickers`.





## Relationships

**Inherits From**: `NSTouchBarItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS 10.12.2

## Topics

### Creating a color picker item

- `colorPicker(withIdentifier:)`
- `textColorPicker(withIdentifier:)`
- `strokeColorPicker(withIdentifier:)`
- `colorPicker(withIdentifier:buttonImage:)`

### Configuring the color picker

- `colorList`
- `allowedColorSpaces`
- `showsAlpha`
- `isEnabled`

### Obtaining the selected color

- `color`
- `target`
- `action`

### Configuring bar customization

- `customizationLabel`

## See Also

- `NSColorPicker`
- `NSColorWell`
