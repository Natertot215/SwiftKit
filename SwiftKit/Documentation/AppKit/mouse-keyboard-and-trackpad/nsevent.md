---
url: https://developer.apple.com/documentation/appkit/nsevent
framework: AppKit
category: Mouse, keyboard, and trackpad
title: NSEvent
kind: class
captured: 2026-05-02
---

# NSEvent

An object that contains information about an input action, such as a mouse click or a key press.

## Declaration

```swift
class NSEvent
```

### Overview

AppKit reports events that occur in a window to the app that created the window. Events include mouse clicks, key presses, and other types of input to the system. An `NSEvent` object contains pertinent information about each event, such as the event type and when the event occurred. The event type defines what other information is available in the event object. For example, a keyboard event contains information about the pressed keys.

Although you can create `NSEvent` objects directly, you typically don’t. The system generates them automatically in response to input from the mouse, keyboard, trackpad, or other peripherals such as connected tablets. It enqueues those events in its event queue, and dequeues them when it’s ready to process them. The system delivers events to the most relevant `NSResponder` object, which might be the first responder or the object where the event occurred. For example, the system delivers mouse-click events to the view that contains the event location.

To handle events, add support to your app’s `NSResponder` objects. You can also use gesture recognizers to handle some events for you and execute your app’s code at appropriate times. For more information, see the `NSResponder` reference.

You can also monitor the events your app receives and modify or cancel some events as needed. Install a local monitor using the `NSEvent/addLocalMonitorForEvents(matching:handler:)` method to detect specific types of events and take action when your app receives them. Install a global monitor using the `NSEvent/addGlobalMonitorForEvents(matching:handler:)` method to monitor events systemwide, although without the ability to modify them.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Creating an event object

- `keyEvent(with:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:)`
- `mouseEvent(with:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:)`
- `enterExitEvent(with:location:modifierFlags:timestamp:windowNumber:context:eventNumber:trackingNumber:userData:)`
- `otherEvent(with:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:)`
- `init(eventRef:)`
- `init(cgEvent:)`

### Getting the event type

- `type`
- `NSEvent.EventType`
- `NSEvent.EventTypeMask`
- `subtype`
- `NSEvent.EventSubtype`

### Getting general event information

- `locationInWindow`
- `timestamp`
- `window`
- `windowNumber`
- `eventRef`
- `cgEvent`
- `foreverDuration`

### Getting modifier flags

- `modifierFlags`
- `NSEvent.ModifierFlags`
- `modifierFlags`

### Getting key event information

- `characters`
- `charactersIgnoringModifiers`
- `keyCode`
- `characters(byApplyingModifiers:)`
- `keyRepeatDelay`
- `keyRepeatInterval`
- `specialKey`
- `Function-Key Unicode Values`
- `NSEvent.SpecialKey`
- `isARepeat`

### Getting mouse event information

- `pressedMouseButtons`
- `doubleClickInterval`
- `mouseLocation`
- `buttonNumber`
- `clickCount`
- `associatedEventsMask`

### Getting scroll wheel and flick events

- `deltaX`
- `deltaY`
- `deltaZ`
- `hasPreciseScrollingDeltas`
- `scrollingDeltaX`
- `scrollingDeltaY`
- `momentumPhase`
- `isDirectionInvertedFromDevice`

### Configuring swipe event behaviors

- `isSwipeTrackingFromScrollEventsEnabled`
- `trackSwipeEvent(options:dampenAmountThresholdMin:max:usingHandler:)`
- `NSEvent.SwipeTrackingOptions`

### Getting gesture and touch information

- `phase`
- `NSEvent.Phase`
- `magnification`
- `touches(matching:in:)`
- `allTouches()`
- `touches(for:)`
- `coalescedTouches(for:)`
- `isMouseCoalescingEnabled`
- `NSEvent.GestureAxis`

### Getting pressure information

- `pressure`
- `stage`
- `stageTransition`
- `pressureBehavior`
- `NSEvent.PressureBehavior`

### Getting tablet proximity information

- `capabilityMask`
- `deviceID`
- `isEnteringProximity`
- `pointingDeviceID`
- `pointingDeviceSerialNumber`
- `pointingDeviceType`
- `NSEvent.PointingDeviceType`
- `systemTabletID`
- `tabletID`
- `uniqueID`
- `vendorID`
- `vendorPointingDeviceType`

### Getting tablet pointing information

- `absoluteX`
- `absoluteY`
- `absoluteZ`
- `buttonMask`
- `NSEvent.ButtonMask`
- `rotation`
- `tangentialPressure`
- `tilt`
- `vendorDefined`

### Getting tracking area information

- `eventNumber`
- `trackingNumber`
- `trackingArea`
- `userData`

### Getting custom event information

- `data1`
- `data2`

### Requesting and stopping periodic events

- `startPeriodicEvents(afterDelay:withPeriod:)`
- `stopPeriodicEvents()`

### Monitoring app events

- `addGlobalMonitorForEvents(matching:handler:)`
- `addLocalMonitorForEvents(matching:handler:)`
- `removeMonitor(_:)`

### Converting a mouse event’s position into a SpriteKit node’s coordinate space

- `location(in:)`

### Deprecated

- `context`

### Initializers

- `init(CGEvent:)`
- `init(coder:)`

## See Also

- `NSTouch`
