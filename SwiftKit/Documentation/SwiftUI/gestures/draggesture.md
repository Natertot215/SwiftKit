---
url: https://developer.apple.com/documentation/swiftui/draggesture
framework: SwiftUI
category: Gestures
title: DragGesture
kind: struct
captured: 2026-05-02
---

# DragGesture

A dragging motion that invokes an action as the drag-event sequence changes.

## Declaration

```swift
struct DragGesture
```

### Overview

To recognize a drag gesture on a view, create and configure the gesture, and then add it to the view using the `View/gesture(_:including:)` modifier.

Add a drag gesture to a `Circle` and change its color while the user performs the drag gesture:

```swift
struct DragGestureView: View {
    @State private var isDragging = false

    var drag: some Gesture {
        DragGesture()
            .onChanged { _ in self.isDragging = true }
            .onEnded { _ in self.isDragging = false }
    }

    var body: some View {
        Circle()
            .fill(self.isDragging ? Color.red : Color.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(drag)
    }
}
```





## Relationships

**Conforms To**: `Gesture`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a drag gesture

- `init(minimumDistance:coordinateSpace:)`
- `minimumDistance`
- `coordinateSpace`

### Deprecated initializers

- `init(minimumDistance:coordinateSpace:)`

### Structures

- `DragGesture.Value`

### Initializers

- `init(minimumDistance:coordinateSpace3D:)`
- `init(minimumDistance:coordinateSpace:)`

## See Also

- `gesture(_:)`
- `gesture(_:isEnabled:)`
- `gesture(_:name:isEnabled:)`
- `gesture(_:including:)`
- `WindowDragGesture`
- `MagnifyGesture`
- `RotateGesture`
- `RotateGesture3D`
- `GestureMask`
