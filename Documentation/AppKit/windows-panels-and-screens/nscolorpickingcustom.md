---
url: https://developer.apple.com/documentation/appkit/nscolorpickingcustom
framework: AppKit
category: Windows, panels, and screens
title: NSColorPickingCustom
kind: protocol
captured: 2026-05-02
---

# NSColorPickingCustom

A set of methods that provides a way to add color pickers—custom user interfaces for color selection—to an app’s color panel.

## Declaration

```swift
protocol NSColorPickingCustom : NSColorPickingDefault
```

### Overview

`NSColorPickingCustom` works with the `NSColorPickingDefault` protocol—which provides basic behavior for a color picker—to enable custom color pickers.

> **NOTE:**  This protocol must be implemented by a custom picker, or an error will occur.





## Relationships

**Inherits From**: `NSColorPickingDefault`

## Availability

- macOS ?

## Topics

### Configuring Color Pickers

- `setColor(_:)`

### Getting Color Picker Information

- `currentMode()`
- `supportsMode(_:)`

### Displaying Color Pickers

- `provideNewView(_:)`

## See Also

- `NSColorPanel`
- `NSColorPickingDefault`
- `NSColorPicker`
