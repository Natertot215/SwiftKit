---
url: https://developer.apple.com/documentation/swiftui/spatialtapgesture
framework: SwiftUI
category: Gestures
title: SpatialTapGesture
kind: struct
captured: 2026-05-02
---

# SpatialTapGesture

A gesture that recognizes one or more taps and reports their location.

## Declaration

```swift
struct SpatialTapGesture
```

### Overview

To recognize a tap gesture on a view, create and configure the gesture, and then add it to the view using the `View/gesture(_:including:)` modifier. The following code adds a tap gesture to a `Circle` that toggles the color of the circle based on the tap location:

```swift
struct TapGestureView: View {
    @State private var location: CGPoint = .zero

    var tap: some Gesture {
        SpatialTapGesture()
            .onEnded { event in
                self.location = event.location
             }
    }

    var body: some View {
        Circle()
            .fill(self.location.y > 50 ? Color.blue : Color.red)
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(tap)
    }
}
```





## Relationships

**Conforms To**: `Gesture`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating a spatial tap gesture

- `init(count:coordinateSpace:)`
- `coordinateSpace`
- `count`

### Getting the gesture’s value

- `SpatialTapGesture.Value`

### Deprecated initializers

- `init(count:coordinateSpace:)`

### Initializers

- `init(count:coordinateSpace3D:)`
- `init(count:coordinateSpace:)`

## See Also

- `onTapGesture(count:perform:)`
- `onTapGesture(count:coordinateSpace:perform:)`
- `TapGesture`
