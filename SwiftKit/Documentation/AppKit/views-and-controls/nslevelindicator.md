---
url: https://developer.apple.com/documentation/appkit/nslevelindicator
framework: AppKit
category: Views and controls
title: NSLevelIndicator
kind: class
captured: 2026-05-02
---

# NSLevelIndicator

A visual representation of a level or quantity, using discrete values.

## Declaration

```swift
class NSLevelIndicator
```

### Overview

A level indicator is similar to an `NSSlider` object, but provides a more customized visual feedback to the user. Unlike sliders, level indicators do not have a “knob” indicating the current setting, and they do not allow the user to adjust the current setting. You set the value of the level indicator programmatically. The supported indicator styles include:

- A capacity style level indicator. The continuous mode for this style is often used to indicate conditions such as how much data is on hard disk. The discrete mode is similar to audio level indicators in audio playback applications. You can specify both a warning value and a critical value that provides additional visual feedback to the user.
- A ranking style level indicator. This is similar to the star ranking displays provided in iTunes and iPhoto. You can also specify your own ranking image.
- A relevancy style level indicator. This style is used to display the relevancy of a search result, for example in Mail.

`NSLevelIndicator` uses an `NSLevelIndicatorCell` to implement much of the control’s functionality. `NSLevelIndicator` provides cover methods for most of the `NSLevelIndicatorCell` methods, which call the corresponding cell method.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Configuring the Cell

- `NSLevelIndicatorCell`

### Configuring the Range of Values

- `minValue`
- `maxValue`
- `warningValue`
- `criticalValue`

### Managing Tick Marks and Style

- `tickMarkPosition`
- `numberOfTickMarks`
- `numberOfMajorTickMarks`
- `tickMarkValue(at:)`
- `rectOfTickMark(at:)`
- `levelIndicatorStyle`
- `NSLevelIndicator.Style`

### Configuring the Drawing Attributes

- `ratingImage`
- `drawsTieredCapacityLevels`
- `fillColor`
- `warningFillColor`
- `criticalFillColor`

### Managing Placeholder Information

- `ratingPlaceholderImage`
- `placeholderVisibility`
- `NSLevelIndicator.PlaceholderVisibility`

### Controlling the Edit Behavior

- `isEditable`

## See Also

- `Responding to control-based events using target-action`
- `NSButton`
- `NSColorWell`
- `Combo Box`
- `NSComboButton`
- `Date Picker`
- `NSImageView`
- `Path Control`
- `NSPopUpButton`
- `NSProgressIndicator`
- `NSRuleEditor`
- `NSPredicateEditor`
- `Search Field`
- `NSSegmentedControl`
- `Slider`
