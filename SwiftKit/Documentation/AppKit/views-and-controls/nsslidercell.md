---
url: https://developer.apple.com/documentation/appkit/nsslidercell
framework: AppKit
category: Views and controls
title: NSSliderCell
kind: class
captured: 2026-05-02
---

# NSSliderCell

The appearance and behavior of an `NSSlider` object.

## Declaration

```swift
class NSSliderCell
```

### Overview

You can customize an `NSSliderCell` to a certain degree, using its properties. If this doesn’t give you sufficient flexibility, you can create a subclass. In that subclass, you can override any of the following methods: `NSSliderCell/knobRect(flipped:)`, `NSSliderCell/drawBar(inside:flipped:)`, `NSSliderCell/drawKnob(_:)`, and `NSSliderCell/prefersTrackingUntilMouseUp`.





## Relationships

**Inherits From**: `NSActionCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Managing Cell Behavior

- `altIncrementValue`
- `prefersTrackingUntilMouseUp`
- `trackRect`

### Managing the Slider Type

- `sliderType`

### Displaying the Cell

- `barRect(flipped:)`
- `drawTickMarks()`
- `knobRect(flipped:)`
- `drawBar(inside:flipped:)`
- `drawKnob()`
- `drawKnob(_:)`

### Managing Cell Appearance

- `knobThickness`
- `isVertical`

### Managing Value Limits

- `maxValue`
- `minValue`

### Managing Tick Marks

- `allowsTickMarkValuesOnly`
- `closestTickMarkValue(toValue:)`
- `indexOfTickMark(at:)`
- `numberOfTickMarks`
- `rectOfTickMark(at:)`
- `tickMarkPosition`
- `tickMarkValue(at:)`

### Constants

- `NSSlider.TickMarkPosition`
- `NSSlider.SliderType`
