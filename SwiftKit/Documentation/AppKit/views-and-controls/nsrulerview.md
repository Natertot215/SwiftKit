---
url: https://developer.apple.com/documentation/appkit/nsrulerview
framework: AppKit
category: Views and controls
title: NSRulerView
kind: class
captured: 2026-05-02
---

# NSRulerView

A ruler and the markers above or to the side of a scroll view’s document view.

## Declaration

```swift
class NSRulerView
```

### Overview

Views within the scroll view can become clients of the ruler view, having it display markers for their elements, and receiving messages from the ruler view when the user manipulates the markers.

#### Principal Attributes

- Displays markers that represent elements of the client view.
- Displays in arbitrary units.
- Provides for an accessory view containing extra controls.

#### Creation

- `NSScrollView/hasHorizontalRuler` (`NSScrollView`)
- `NSScrollView/hasVerticalRuler` (`NSScrollView`)
- `NSRulerView/init(scrollView:orientation:)` Designated initializer.

#### Commonly Used Methods

**`NSRulerView/clientView`**: Changes the ruler’s client view.

**`NSRulerView/markers`**: Sets the markers displayed by the ruler view.

**`NSRulerView/accessoryView`**: Sets the accessory view.

**`NSRulerView/trackMarker(_:withMouseEvent:)`**: Allows the user to add a new marker.

#### Overview

See NSRulerMarkerClientViewDelegation for delegate methods that may be of interest.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating a Ruler View

- `init(scrollView:orientation:)`
- `init(coder:)`

### Altering measurement units

- `registerUnit(withName:abbreviation:unitToPointsConversionFactor:stepUpCycle:stepDownCycle:)`
- `measurementUnits`
- `NSRulerView.UnitName`

### Setting the client view

- `clientView`

### Setting an accessory view

- `accessoryView`

### Setting the zero mark position

- `originOffset`

### Adding and removing markers

- `markers`
- `addMarker(_:)`
- `removeMarker(_:)`
- `trackMarker(_:withMouseEvent:)`

### Drawing temporary ruler lines

- `moveRulerline(fromLocation:toLocation:)`

### Drawing

- `drawHashMarksAndLabels(in:)`
- `drawMarkers(in:)`
- `invalidateHashMarks()`

### Ruler layout

- `scrollView`
- `orientation`
- `NSRulerView.Orientation`
- `reservedThicknessForAccessoryView`
- `reservedThicknessForMarkers`
- `ruleThickness`
- `requiredThickness`
- `baselineLocation`
- `isFlipped`

## See Also

- `NSRulerMarker`
