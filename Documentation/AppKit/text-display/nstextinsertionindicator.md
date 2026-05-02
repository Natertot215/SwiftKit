---
url: https://developer.apple.com/documentation/appkit/nstextinsertionindicator
framework: AppKit
category: Text display
title: NSTextInsertionIndicator
kind: class
captured: 2026-05-02
---

# NSTextInsertionIndicator

A view that represents the insertion indicator in text.

## Declaration

```swift
class NSTextInsertionIndicator
```

### Overview

`NSTextView` and `NSTextField` both use `NSTextInsertionIndicator` to display the insertion indicator. You can use this indicator if you have your own text engine or need to display an indicator elsewhere.

To use the indicator, instantiate an `NSTextInsertionIndicator`, then add the view to your view hierarchy. Set the indicator view’s frame to where you want to display a text insertion indicator. The indicator has the same height as the indicator view’s frame, and centers horizontally within the indicator view’s frame.

The `NSTextInsertionIndicator/DisplayMode-swift.enum` specifies whether the indicator hides, remains visible, or blinks (automatic).

When set to `NSTextInsertionIndicator/DisplayMode-swift.enum/automatic`, the indicator stops blinking when you set the frame. The indicator starts blinking when the frame doesn’t change for a period of time. When the user dictates, the indicator displays a trailing glow when it is moved.

Set the `NSTextInsertionIndicator/DisplayMode-swift.enum` to `NSTextInsertionIndicator/DisplayMode-swift.enum/automatic` when your custom view becomes the first responder. When your custom view resigns first responder, set the `NSTextInsertionIndicator/displayMode-swift.property` to `NSTextInsertionIndicator/DisplayMode-swift.enum/hidden` to indicate that key events aren’t sent to your view.

By default the indicator’s color is `NSColor/textInsertionPointColor`. You can set a different color.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 14.0

## Topics

### Configuring indicators

- `color`
- `effectsViewInserter`

### Setting the display mode

- `displayMode`
- `automaticModeOptions`
- `NSTextInsertionIndicator.AutomaticModeOptions`
- `NSTextInsertionIndicator.DisplayMode`

## See Also

- `Adopting the system text cursor in custom text views`
- `NSTextInputContext`
- `NSTextInputClient`
- `NSTextAlternatives`
- `NSTextContent`
- `NSTextInsertionIndicator.DisplayMode`
- `NSTextInsertionIndicator.AutomaticModeOptions`
