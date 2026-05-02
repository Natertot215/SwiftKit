---
url: https://developer.apple.com/documentation/appkit/nspressgesturerecognizer
framework: AppKit
category: Gestures
title: NSPressGestureRecognizer
kind: class
captured: 2026-05-02
---

# NSPressGestureRecognizer

A discrete gesture recognizer that tracks whether the user holds down a mouse button for a minimum amount of time before releasing it.

## Declaration

```swift
class NSPressGestureRecognizer
```

### Overview

Use a press gesture recognizer to configure which button the user must hold and the length of time they must hold it. You can also specify how far the mouse can move for a valid gesture.

Upon creation, the gesture recognizer recognizes press gestures involving only the primary button. It also delays sending primary button events to the view by setting the `NSGestureRecognizer/delaysPrimaryMouseButtonEvents` property to `true`. To change the set of buttons to track, modify the `NSPressGestureRecognizer/buttonMask` property.





## Relationships

**Inherits From**: `NSGestureRecognizer`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.10

## Topics

### Configuring the Gesture Recognizer

- `allowableMovement`
- `buttonMask`
- `minimumPressDuration`
- `numberOfTouchesRequired`

## See Also

- `NSClickGestureRecognizer`
- `NSPanGestureRecognizer`
- `NSRotationGestureRecognizer`
- `NSMagnificationGestureRecognizer`
