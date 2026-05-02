---
url: https://developer.apple.com/documentation/swiftui/rotategesture3d
framework: SwiftUI
category: Gestures
title: RotateGesture3D
kind: struct
captured: 2026-05-02
---

# RotateGesture3D

A gesture that recognizes 3D rotation motion and tracks the angle and axis of the rotation.

## Declaration

```swift
struct RotateGesture3D
```

### Overview

You can constrain this gesture to recognize rotation about a specific 3D axis. For example, `RotateGesture3D(constrainedToAxis: .x)` creates a gesture that recognizes rotation only around the global X axis. The axis you provide will be normalized.

A rotation gesture tracks how a rotation event sequence changes. To recognize a rotation gesture on a view, create and configure the gesture, and then add it to the view using the `View/gesture(_:including:)` modifier.





## Relationships

**Conforms To**: `Gesture`

## Availability

- visionOS 1.0

## Topics

### Creating the gesture

- `init(constrainedToAxis:minimumAngleDelta:)`
- `minimumAngleDelta`
- `constrainedAxis`

## See Also

- `gesture(_:)`
- `gesture(_:isEnabled:)`
- `gesture(_:name:isEnabled:)`
- `gesture(_:including:)`
- `DragGesture`
- `WindowDragGesture`
- `MagnifyGesture`
- `RotateGesture`
- `GestureMask`
