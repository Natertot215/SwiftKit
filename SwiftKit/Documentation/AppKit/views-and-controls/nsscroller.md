---
url: https://developer.apple.com/documentation/appkit/nsscroller
framework: AppKit
category: Views and controls
title: NSScroller
kind: class
captured: 2026-05-02
---

# NSScroller

An object that controls scrolling of a document view within a scroll view or other type of container view.

## Declaration

```swift
class NSScroller
```

### Overview

A scroller displays a slot containing a knob that the user can drag directly to the desired location. The knob indicates both the position within the document view and—by varying in size within the slot—the amount visible relative to the size of the document view.

Typically, you don’t need to program with scrollers; instead, you configure them with an `NSScrollView` object in a `https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/NibFile.html#//apple_ref/doc/uid/TP40008195-CH34`.

Don’t use an scroller when a slider would be more appropriate. An `NSSlider` object represents a range of values for something in the application and lets the user choose a setting. A scroller represents the relative position of the visible portion of a view and lets the user choose which portion to view.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Determining Scroller Size

- `scrollerWidth(for:scrollerStyle:)`
- `controlSize`

### Laying out a Scroller

- `arrowsPosition`

### Setting the Knob Position

- `knobProportion`

### Calculating Layout

- `rect(for:)`
- `testPart(_:)`
- `checkSpaceForParts()`
- `usableParts`

### Drawing Scroller Parts

- `drawArrow(_:highlight:)`
- `drawKnobSlot(in:highlight:)`
- `drawKnob()`
- `highlight(_:)`

### Event Handling

- `hitPart`
- `trackKnob(with:)`
- `trackScrollButtons(with:)`

### Setting Control Tint

- `controlTint`

### Managing Presentation Style

- `preferredScrollerStyle`
- `scrollerStyle`
- `knobStyle`

### Constants

- `NSScroller.Style`
- `NSScroller.KnobStyle`
- `NSScroller.Part`
- `NSScroller.Arrow`
- `NSScroller.ArrowPosition`
- `NSScroller.UsableParts`

### Notifications

- `preferredScrollerStyleDidChangeNotification`

### Instance Properties

- `knobProportion`

### Type Properties

- `isCompatibleWithOverlayScrollers`

## See Also

- `NSScrollView`
- `NSClipView`
