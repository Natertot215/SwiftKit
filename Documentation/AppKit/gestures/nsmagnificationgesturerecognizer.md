---
url: https://developer.apple.com/documentation/appkit/nsmagnificationgesturerecognizer
framework: AppKit
category: Gestures
title: NSMagnificationGestureRecognizer
kind: class
captured: 2026-05-02
---

# NSMagnificationGestureRecognizer

A continuous gesture recognizer that tracks a pinch gesture that magnifies content.

## Declaration

```swift
class NSMagnificationGestureRecognizer
```

### Overview

This object tracks pinch gestures on a track pad or other input device and stores the resulting magnification value for you to use in your code.

This gesture recognizer automatically sets the value of the `NSGestureRecognizer/delaysMagnificationEvents` property to `true`.





## Relationships

**Inherits From**: `NSGestureRecognizer`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.10

## Topics

### Finding the Magnification Factor

- `magnification`

## See Also

- `NSClickGestureRecognizer`
- `NSPressGestureRecognizer`
- `NSPanGestureRecognizer`
- `NSRotationGestureRecognizer`
