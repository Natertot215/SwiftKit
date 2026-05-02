---
url: https://developer.apple.com/documentation/appkit/nsrotationgesturerecognizer
framework: AppKit
category: Gestures
title: NSRotationGestureRecognizer
kind: class
captured: 2026-05-02
---

# NSRotationGestureRecognizer

A continuous gesture recognizer that tracks two trackpad touches moving opposite each other in a circular motion.

## Declaration

```swift
class NSRotationGestureRecognizer
```

### Overview

This rotation gesture implies that the underlying view should rotate in a matching direction. The gesture is recognized when the trackpad touches end.

Upon creation, the gesture recognizer sets the value of the `NSGestureRecognizer/delaysRotationEvents` property to `true`.





## Relationships

**Inherits From**: `NSGestureRecognizer`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.10

## Topics

### Interpreting the Gesture

- `rotation`
- `rotationInDegrees`

## See Also

- `NSClickGestureRecognizer`
- `NSPressGestureRecognizer`
- `NSPanGestureRecognizer`
- `NSMagnificationGestureRecognizer`
