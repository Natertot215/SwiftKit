---
url: https://developer.apple.com/documentation/appkit/nscolorpickingdefault
framework: AppKit
category: Windows, panels, and screens
title: NSColorPickingDefault
kind: protocol
captured: 2026-05-02
---

# NSColorPickingDefault

A set of methods that provides basic behavior for a color picker.

## Declaration

```swift
protocol NSColorPickingDefault
```

### Overview

The `NSColorPickingDefault` protocol, together with the `NSColorPickingCustom` protocol (which provides implementation-specific behavior), provides an interface for adding color pickers to an app’s color panel.





## Relationships

**Inherited By**: `NSColorPickingCustom`

**Conforming Types**: `NSColorPicker`

## Availability

- macOS ?

## Topics

### Creating Color Pickers

- `init(pickerMask:colorPanel:)`

### Configuring Color Pickers

- `setMode(_:)`
- `insertNewButtonImage(_:in:)`
- `provideNewButtonImage()`
- `minContentSize()`
- `buttonToolTip()`

### Handling Events

- `alphaControlAddedOrRemoved(_:)`
- `viewSizeChanged(_:)`

### Managing Color Lists

- `attachColorList(_:)`
- `detachColorList(_:)`

## See Also

- `NSColorPanel`
- `NSColorPickingCustom`
- `NSColorPicker`
