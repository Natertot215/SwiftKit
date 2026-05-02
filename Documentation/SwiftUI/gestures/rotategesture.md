---
url: https://developer.apple.com/documentation/swiftui/rotategesture
framework: SwiftUI
category: Gestures
title: RotateGesture
kind: struct
captured: 2026-05-02
---

# RotateGesture

A gesture that recognizes a rotation motion and tracks the angle of the rotation.

## Declaration

```swift
struct RotateGesture
```

### Overview

A rotate gesture tracks how a rotation event sequence changes. To recognize a rotate gesture on a view, create and configure the gesture, and then add it to the view using the `View/gesture(_:including:)` modifier.

Add a rotate gesture to a `Rectangle` and apply a rotation effect:

```swift
struct RotateGestureView: View {
    @State private var angle = Angle(degrees: 0.0)

    var rotation: some Gesture {
        RotateGesture()
            .onChanged { value in
                angle = value.rotation
            }
    }

    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200, alignment: .center)
            .rotationEffect(angle)
            .gesture(rotation)
    }
}
```





## Relationships

**Conforms To**: `Gesture`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0

## Topics

### Creating the gesture

- `init(minimumAngleDelta:)`
- `minimumAngleDelta`

## See Also

- `gesture(_:)`
- `gesture(_:isEnabled:)`
- `gesture(_:name:isEnabled:)`
- `gesture(_:including:)`
- `DragGesture`
- `WindowDragGesture`
- `MagnifyGesture`
- `RotateGesture3D`
- `GestureMask`
