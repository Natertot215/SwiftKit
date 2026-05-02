---
url: https://developer.apple.com/documentation/appkit/nscolorpanel
framework: AppKit
category: Windows, panels, and screens
title: NSColorPanel
kind: class
captured: 2026-05-01
---

# NSColorPanel

## Declaration

```swift
class NSColorPanel : NSPanel
```

## Abstract

A standard user interface for selecting color in an app.

## Overview

`NSColorPanel` provides a number of standard color selection modes and, with the `NSColorPickingDefault` and `NSColorPickingCustom` protocols, allows an app to add its own color selection modes. It also allows the user to save swatches containing frequently used colors.

## Topics

### Obtaining the shared color panel

- `shared` - Returns the shared `NSColorPanel` instance, creating it if necessary.
- `sharedColorPanelExists` - Returns a Boolean value indicating whether the `NSColorPanel` has been created already.

### Setting color picker modes

- `setPickerMode(_:)` - Specifies the color panel's initial picker.
- `mode` - The mode of the receiver; the mode is one of the modes allowed by the color mask.
- `Mode` - A type defined for the `enum` constants specifying color panel modes.
- `setPickerMask(_:)` - Determines which color selection modes are available in an application's `NSColorPanel`.
- `Options` - The color modes that are enabled for a color panel.

### Configuring the color panel

- `accessoryView` - The accessory view.
- `isContinuous` - A Boolean value indicating whether the receiver continuously sends the action message to the target.
- `setAction(_:)` - Sets the color panel's action message.
- `setTarget(_:)` - Sets the target of the receiver.
- `showsAlpha` - A Boolean value that indicates whether the receiver shows alpha values and an opacity slider.

### Managing color lists

- `attachColorList(_:)` - Adds the list of `NSColor` objects specified to all the color pickers in the receiver that display color lists.
- `detachColorList(_:)` - Removes the list of colors from all the color pickers in the receiver that display color lists.

### Setting color

- `dragColor(_:with:from:)` - Drags a color into a destination view from the specified source view.
- `color` - The color of the receiver.

### Supporting high dynamic range (HDR) colors

- `maximumLinearExposure` - The maximum linear exposure that can be set on a color picked in the color panel. Defaults to 1 and ignores any value less than 1.

### Getting transparency information

- `alpha` - The receiver's current alpha value based on its opacity slider.

### Responding to a color change

- `NSColorChanging` - Protocol for handling color changes.
- `colorDidChangeNotification` - Posted when the color of the `NSColorPanel` is set.

## Inheritance

Inherits from: `NSPanel`

## Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSAccessibilityElementProtocol`
- `NSAccessibilityProtocol`
- `NSAnimatablePropertyContainer`
- `NSAppearanceCustomization`
- `NSCoding`
- `NSMenuItemValidation`
- `NSObject`
- `NSStandardKeyBindingResponding`
- `NSTouchBarProvider`
- `NSUserActivityRestoring`
- `NSUserInterfaceItemIdentification`
- `NSUserInterfaceValidations`
- `Sendable`

## See Also

**Color Panels**

- `NSColorPickingCustom` - A set of methods that provides a way to add color pickers to an app's color panel.
- `NSColorPickingDefault` - A set of methods that provides basic behavior for a color picker.
- `NSColorPicker` - An abstract superclass that implements the default color picking protocol.

## Availability

- **macOS** 10.0+
