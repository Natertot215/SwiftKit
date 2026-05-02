---
url: https://developer.apple.com/documentation/appkit/nscolorwell
framework: AppKit
category: Views and controls
title: NSColorWell
kind: class
captured: 2026-05-02
---

# NSColorWell

A control that displays a color value and lets the user change that color value.

## Declaration

```swift
class NSColorWell
```

### Overview

An `NSColorWell` object lets people select colors from your interface. Incorporate this type of control if your app supports custom color selection. For example, a drawing app might include a color well to let someone choose the color to use when drawing. A color well control displays the currently selected color, and interactions with the color well display interfaces for selecting new colors.

When you create a color well programmatically or in Interface Builder, specify the appearance and interaction style you want. The color well supports color selection using a color picker popover or the system `NSColorPanel` object. When someone selects a new color in one of these interfaces, the color well updates its selected color to match. You can also provide your own color selection process using a custom action and update the color yourself.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating a color well

- `init(style:)`

### Managing the selected color

- `color`
- `takeColorFrom(_:)`
- `supportsAlpha`

### Supporting high dynamic range (HDR) colors

- `maximumLinearExposure`

### Configuring the appearance

- `colorWellStyle`
- `NSColorWell.Style`
- `image`
- `isBordered`

### Activating and deactivating color wells

- `activate(_:)`
- `isActive`
- `deactivate()`

### Drawing color wells

- `drawWell(inside:)`

### Customizing the color selection behavior

- `pulldownAction`
- `pulldownTarget`

## See Also

- `NSColorPicker`
- `NSColorPickerTouchBarItem`
