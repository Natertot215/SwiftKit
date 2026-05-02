---
url: https://developer.apple.com/documentation/appkit/nsslider
framework: AppKit
category: Views and controls
title: NSSlider
kind: class
captured: 2026-05-02
---

# NSSlider

A display of a bar representing a continuous range of numerical values and a knob representing the currently selected value.

## Declaration

```swift
class NSSlider
```

### Overview

A slider is a UI element that displays a range of values in the app. Sliders can be vertical or horizontal bars or circular dials. An indicator, or knob, notes the current setting. The user can move the knob in the slider’s bar—or rotate the knob in a circular slider—to change the setting.

The `NSSlider` class uses the `NSSliderCell` class to implement its user interface.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAccessibilitySlider`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating sliders

- `init(target:action:)`
- `init(value:minValue:maxValue:target:action:)`

### Managing the slider’s appearance

- `sliderType`
- `NSSlider.SliderType`
- `altIncrementValue`
- `knobThickness`
- `isVertical`
- `trackFillColor`
- `tintProminence`
- `NSTintProminence`

### Asking about the value limits

- `maxValue`
- `minValue`

### Handling mouse-down events

- `acceptsFirstMouse(for:)`

### Managing tick marks

- `allowsTickMarkValuesOnly`
- `closestTickMarkValue(toValue:)`
- `indexOfTickMark(at:)`
- `numberOfTickMarks`
- `rectOfTickMark(at:)`
- `tickMarkPosition`
- `NSSlider.TickMarkPosition`
- `tickMarkValue(at:)`

### Instance Properties

- `neutralValue`
