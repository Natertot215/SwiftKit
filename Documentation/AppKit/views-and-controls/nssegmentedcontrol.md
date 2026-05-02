---
url: https://developer.apple.com/documentation/appkit/nssegmentedcontrol
framework: AppKit
category: Views and controls
title: NSSegmentedControl
kind: class
captured: 2026-05-02
---

# NSSegmentedControl

Display one or more buttons in a single horizontal group.

## Declaration

```swift
class NSSegmentedControl
```

### Overview

The `NSSegmentedControl` class uses an `NSSegmentedCell` class to implement much of the control’s functionality. Most methods in `NSSegmentedControl` are simply cover methods that call the corresponding method in `NSSegmentedCell`. The methods of `NSSegmentedCell` that do not have covers relate to accessing and setting values for tags and tooltips, programatically setting the key segment, and establishing the mode of the control.

The features of a segmented control include the following:

- A segment can have an image, text (label), menu, tooltip, and tag.
- A segmented control can contain images or text, but not both.
- Either the control or individual segments can be enabled or disabled.
- Segmented controls have four tracking modes, described in `NSSegmentedControl/SwitchTracking`. You use these modes with the `NSSegmentedControl/trackingMode` property.
- Each segment can be either a fixed width or autosized to fit the contents.
- If a segment has text and is marked as autosizing, then the text may be truncated so that the control completely fits.
- If an image is too large to fit in a segment, it is clipped.
- If Full Keyboard Access is enabled in System Preferences > Keyboard, the keyboard may be used to move between and select segments.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceCompression`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating a segmented control

- `init(images:trackingMode:target:action:)`
- `init(labels:trackingMode:target:action:)`

### Configuring the cell

- `NSSegmentedCell`

### Specifying the segment behavior

- `trackingMode`
- `NSSegmentedControl.SwitchTracking`
- `segmentStyle`
- `NSSegmentedControl.Style`

### Specifying number of segments

- `segmentCount`

### Configuring the segment text

- `label(forSegment:)`
- `setLabel(_:forSegment:)`
- `setAlignment(_:forSegment:)`
- `alignment(forSegment:)`

### Configuring a segment image

- `setImage(_:forSegment:)`
- `image(forSegment:)`
- `setImageScaling(_:forSegment:)`
- `imageScaling(forSegment:)`

### Configuring a segment menu

- `setMenu(_:forSegment:)`
- `menu(forSegment:)`
- `setShowsMenuIndicator(_:forSegment:)`
- `showsMenuIndicator(forSegment:)`
- `isSpringLoaded`

### Managing the selected segment

- `selectedSegment`
- `indexOfSelectedItem`
- `selectSegment(withTag:)`
- `setSelected(_:forSegment:)`
- `isSelected(forSegment:)`
- `selectedSegmentBezelColor`
- `doubleValueForSelectedSegment`

### Adjusting the segment spacing

- `setWidth(_:forSegment:)`
- `width(forSegment:)`
- `segmentDistribution`
- `NSSegmentedControl.Distribution`
- `activeCompressionOptions`
- `compress(withPrioritizedCompressionOptions:)`
- `minimumSize(withPrioritizedCompressionOptions:)`

### Specifying the border shape

- `borderShape`
- `NSControl.BorderShape`

### Enabling and disabling segments

- `setEnabled(_:forSegment:)`
- `isEnabled(forSegment:)`

### Managing tags and tooltips

- `tag(forSegment:)`
- `setTag(_:forSegment:)`
- `setToolTip(_:forSegment:)`
- `toolTip(forSegment:)`

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
- `NSProgressIndicator`
- `NSRuleEditor`
- `NSPredicateEditor`
- `Search Field`
- `Slider`
