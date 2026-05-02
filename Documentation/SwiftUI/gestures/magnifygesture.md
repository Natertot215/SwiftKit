---
url: https://developer.apple.com/documentation/swiftui/magnifygesture
framework: SwiftUI
category: Gestures
title: MagnifyGesture
kind: struct
captured: 2026-05-02
---

# MagnifyGesture

A gesture that recognizes a magnification motion and tracks the amount of magnification.

## Declaration

```swift
struct MagnifyGesture
```

### Overview

A magnify gesture tracks how a magnification event sequence changes. To recognize a magnify gesture on a view, create and configure the gesture, and then add it to the view using the `View/gesture(_:including:)` modifier.

Add a magnify gesture to a `Circle` that changes its size while the user performs the gesture:

```swift
struct MagnifyGestureView: View {
    @GestureState private var magnifyBy = 1.0

    var magnification: some Gesture {
        MagnifyGesture()
            .updating($magnifyBy) { value, gestureState, transaction in
                gestureState = value.magnification
            }
    }

    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .scaleEffect(magnifyBy)
            .gesture(magnification)
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

- `init(minimumScaleDelta:)`
- `minimumScaleDelta`

## See Also

- `gesture(_:)`
- `gesture(_:isEnabled:)`
- `gesture(_:name:isEnabled:)`
- `gesture(_:including:)`
- `DragGesture`
- `WindowDragGesture`
- `RotateGesture`
- `RotateGesture3D`
- `GestureMask`
