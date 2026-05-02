---
url: https://developer.apple.com/documentation/appkit/nscontrol
framework: AppKit
category: Views and controls
title: NSControl
kind: class
captured: 2026-05-01
---

# NSControl

## Declaration

```swift
class NSControl : NSView
```

## Abstract

A specialized view, such as a button or text field, that notifies your app of relevant events using the target-action design pattern.

## Overview

The `NSControl` class is abstract and must be subclassed to be used. Although you can subclass it yourself, more often you use one of the subclasses already defined by AppKit. A control draws content on the screen, automatically handles user interactions with that content, and calls the action method of its target object for any significant user interactions.

### About Delegate Methods

The `NSControl` class provides several delegate methods for its subclasses that allow text editing, such as `NSTextField` and `NSMatrix`. These include: `controlTextDidBeginEditing:`, `controlTextDidChange:`, and `controlTextDidEndEditing:`.

Note that although `NSControl` defines delegate methods, it doesn't itself have a delegate. Any subclass that uses these methods must have a delegate and the methods to get and set it. In addition, a formal delegate protocol `NSControlTextEditingDelegate` also defines delegate methods used by control delegates.

### Responding to Mouse Events

When the mouse button is pressed while the cursor is within the bounds of the receiver, the system calls `mouseDown(with:)`. This method highlights the receiver's cell and sends it a `trackMouse(with:in:of:untilMouseUp:)` message. Whenever the cell finishes tracking the mouse (for example, because the cursor has left the cell's bounds), the cell is unhighlighted. If the mouse button is still down and the cursor reenters the bounds, the cell is again highlighted and a new `trackMouse(with:in:of:untilMouseUp:)` message is sent. This behavior repeats until the mouse button goes up. If it goes up with the cursor in the control, the state of the control is changed, and the action message is sent to the target. If the mouse button goes up when the cursor is outside the control, no action message is sent.

## Inheritance

Inherits from: `NSView`

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
- `NSDraggingDestination`
- `NSObjectProtocol`
- `NSStandardKeyBindingResponding`
- `NSTouchBarProvider`
- `NSUserActivityRestoring`
- `NSUserInterfaceItemIdentification`
- `Sendable`

## Inherited By

NSBrowser, NSButton, NSColorWell, NSComboButton, NSDatePicker, NSImageView, NSLevelIndicator, NSMatrix, NSPathControl, NSRuleEditor, NSScroller, NSSegmentedControl, NSSlider, NSStepper, NSSwitch, NSTableView, NSTextField

## See Also

- `NSView` – The infrastructure for drawing, printing, and handling events in an app
- `NSCell` – A mechanism for displaying text or images in a view object without the overhead of a full NSView subclass
- `NSActionCell` – An active area inside a control
