---
url: https://developer.apple.com/documentation/appkit/nspangesturerecognizer
framework: AppKit
category: Gestures
title: NSPanGestureRecognizer
kind: class
captured: 2026-05-02
---

# NSPanGestureRecognizer

A continuous gesture recognizer for panning gestures.

## Declaration

```swift
class NSPanGestureRecognizer
```

### Overview

The gesture is recognized when the user clicks all of specified buttons, drags the mouse, and releases one or more of the buttons. Use the pan gesture recognizer object to retrieve the distance traveled during the pan and the location of the mouse as it pans.

Upon creation, the gesture recognizer is configured to recognize pan gestures involving only the primary button. It also delays sending primary button events to the view by setting the `NSGestureRecognizer/delaysPrimaryMouseButtonEvents` property to `true`. To change the set of buttons to track, modify the `NSPanGestureRecognizer/buttonMask` property.

In this gesture recognizer, the `NSGestureRecognizer/location(in:)` method always reports the current mouse point, which changes as the user drags the mouse.





## Relationships

**Inherits From**: `NSGestureRecognizer`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.10

## Topics

### Configuring the Gesture Recognizer

- `buttonMask`
- `numberOfTouchesRequired`

### Tracking the Location and Velocity of the Gesture

- `translation(in:)`
- `setTranslation(_:in:)`
- `velocity(in:)`

## See Also

- `NSClickGestureRecognizer`
- `NSPressGestureRecognizer`
- `NSRotationGestureRecognizer`
- `NSMagnificationGestureRecognizer`
