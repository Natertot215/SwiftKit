---
url: https://developer.apple.com/documentation/swiftui/windowdraggesture
framework: SwiftUI
category: Gestures
title: WindowDragGesture
kind: struct
captured: 2026-05-02
---

# WindowDragGesture

A gesture that recognizes the motion of and handles dragging a window.

## Declaration

```swift
struct WindowDragGesture
```

### Overview

To recognize a window drag gesture on a view, create and configure the gesture, and then add it to the view using the `View/gesture(_:isEnabled:)` modifier. Consider also letting the gesture `View/allowsWindowActivationEvents(_:)` so that dragging the containing window works even when it’s inactive.

To add a window drag gesture to a `Circle` and change its color while a user performs the window drag gesture:

```swift
struct MyView: View {
    @GestureState var isDraggingWindow = false

    var dragWindow: some Gesture {
        WindowDragGesture()
            .updating($isDraggingWindow) { _, state, _ in
                state = true
            }
    }

    var body: some View {
        Circle()
            .fill(isDraggingWindow ? Color.green : .blue)
            .frame(width: 50, height: 50)
            .gesture(dragWindow)
            .allowsWindowActivationEvents()
    }
}
```





## Relationships

**Conforms To**: `Gesture`

## Availability

- macOS 15.0

## Topics

### Structures

- `WindowDragGesture.Value`

### Initializers

- `init()`

## See Also

- `gesture(_:)`
- `gesture(_:isEnabled:)`
- `gesture(_:name:isEnabled:)`
- `gesture(_:including:)`
- `DragGesture`
- `MagnifyGesture`
- `RotateGesture`
- `RotateGesture3D`
- `GestureMask`
