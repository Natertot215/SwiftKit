---
url: https://developer.apple.com/documentation/appkit/nsclickgesturerecognizer
framework: AppKit
category: Gestures
title: NSClickGestureRecognizer
kind: class
captured: 2026-05-02
---

# NSClickGestureRecognizer

A discrete gesture recognizer that tracks a specified number of mouse clicks.

## Declaration

```swift
class NSClickGestureRecognizer
```

### Overview

When configuring this gesture recognizer, you can specify which mouse buttons must be clicked and how many clicks must occur before the action method is called. The user must click the specified mouse button the required number of times without dragging the mouse for the gesture to be recognized.

The gesture recognizer automatically sets the values of the `NSGestureRecognizer/delaysPrimaryMouseButtonEvents`, `NSGestureRecognizer/delaysSecondaryMouseButtonEvents`, and `NSGestureRecognizer/delaysOtherMouseButtonEvents` properties to `true` for each button in the `NSClickGestureRecognizer/buttonMask` property.





## Relationships

**Inherits From**: `NSGestureRecognizer`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.10

## Topics

### Configuring the Gesture

- `buttonMask`
- `numberOfClicksRequired`
- `numberOfTouchesRequired`

## See Also

- `NSPressGestureRecognizer`
- `NSPanGestureRecognizer`
- `NSRotationGestureRecognizer`
- `NSMagnificationGestureRecognizer`
