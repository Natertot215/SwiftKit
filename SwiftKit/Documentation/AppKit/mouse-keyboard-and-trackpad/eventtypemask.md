---
url: https://developer.apple.com/documentation/appkit/nsevent/eventtypemask
framework: AppKit
category: Mouse, keyboard, and trackpad
title: NSEvent.EventTypeMask
kind: struct
captured: 2026-05-02
---

# NSEvent.EventTypeMask

Constants that you use to filter out specific event types from the stream of incoming events.

## Declaration

```swift
struct EventTypeMask
```

### Overview

Pass these constants to the `NSCell` method `NSCell/sendAction(on:)` to specify when an `NSCell` object should send its action message.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Equatable`, `ExpressibleByArrayLiteral`, `OptionSet`, `RawRepresentable`, `Sendable`, `SendableMetatype`, `SetAlgebra`

## Availability

- macOS ?

## Topics

### Getting Any Event

- `any`

### Getting Mouse-Related Events

- `leftMouseDown`
- `leftMouseDragged`
- `leftMouseUp`
- `rightMouseDown`
- `rightMouseDragged`
- `rightMouseUp`
- `otherMouseDown`
- `otherMouseDragged`
- `otherMouseUp`
- `mouseEntered`
- `mouseMoved`
- `mouseExited`

### Getting Keyboard Events

- `keyDown`
- `keyUp`

### Getting Touch Events

- `beginGesture`
- `endGesture`
- `magnify`
- `smartMagnify`
- `swipe`
- `rotate`
- `gesture`
- `directTouch`
- `tabletPoint`
- `tabletProximity`
- `pressure`

### Getting Input Events

- `scrollWheel`
- `changeMode`

### Getting System Events

- `appKitDefined`
- `applicationDefined`
- `cursorUpdate`
- `flagsChanged`
- `periodic`
- `systemDefined`

### Creating an Event Mask

- `init(rawValue:)`
- `init(type:)`

### Type Properties

- `mouseCancelled`

## See Also

- `NSEvent.ButtonMask`
- `NSEvent.ModifierFlags`
- `NSEvent.Phase`
- `NSEvent.SwipeTrackingOptions`
- `init(type:)`
