---
url: https://developer.apple.com/documentation/appkit/nsprogressindicator
framework: AppKit
category: Views and controls
title: NSProgressIndicator
kind: class
captured: 2026-05-02
---

# NSProgressIndicator

An interface that provides visual feedback to the user about the status of an ongoing task.

## Declaration

```swift
class NSProgressIndicator
```

### Overview

Progress indicators can be determinate or indeterminate. A determinate indicator displays the completion percentage of a task. An indeterminate indicator shows that the app is busy without providing a visual indication of how long the task will take.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityGroup`, `NSAccessibilityProgressIndicator`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Animating the progress indicator

- `startAnimation(_:)`
- `stopAnimation(_:)`
- `usesThreadedAnimation`

### Advancing the progress bar

- `increment(by:)`
- `doubleValue`
- `minValue`
- `maxValue`

### Observing the progress bar

- `observedProgress`

### Setting the appearance

- `controlSize`
- `controlTint`
- `isBezeled`
- `isIndeterminate`
- `style`
- `sizeToFit()`
- `isDisplayedWhenStopped`

### Constants

- `NSProgressIndicator.Style`

## See Also

- `Responding to control-based events using target-action`
- `NSButton`
- `NSColorWell`
- `Combo Box`
- `NSComboButton`
- `Date Picker`
- `NSImageView`
- `NSLevelIndicator`
- `Path Control`
- `NSPopUpButton`
- `NSRuleEditor`
- `NSPredicateEditor`
- `Search Field`
- `NSSegmentedControl`
- `Slider`
