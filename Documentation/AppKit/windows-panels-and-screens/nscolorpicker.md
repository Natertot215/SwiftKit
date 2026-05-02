---
url: https://developer.apple.com/documentation/appkit/nscolorpicker
framework: AppKit
category: Windows, panels, and screens
title: NSColorPicker
kind: class
captured: 2026-05-02
---

# NSColorPicker

An abstract superclass that implements the default color picking protocol.

## Declaration

```swift
class NSColorPicker
```

### Overview

The `NSColorPickingDefault` and `NSColorPickingCustom` protocols define a way to add color pickers (custom user interfaces for color selection) to the color panel.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSColorPickingDefault`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Initializing the Color Picker Object

- `init(pickerMask:colorPanel:)`

### Getting the Color Panel

- `colorPanel`

### Adding Button Images

- `insertNewButtonImage(_:in:)`
- `provideNewButtonImage`

### Setting the Mode

- `setMode(_:)`

### Managing Color Lists

- `attachColorList(_:)`
- `detachColorList(_:)`

### Responding to View Changes

- `viewSizeChanged(_:)`

### Customizing the Color Picker

- `buttonToolTip`
- `minContentSize`

## See Also

- `NSColorWell`
- `NSColorPickerTouchBarItem`
