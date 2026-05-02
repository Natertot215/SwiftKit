---
url: https://developer.apple.com/documentation/swiftui/tapgesture
framework: SwiftUI
category: Gestures
title: TapGesture
kind: struct
captured: 2026-05-02
---

# TapGesture

A gesture that recognizes one or more taps.

## Declaration

```swift
struct TapGesture
```

### Overview

To recognize a tap gesture on a view, create and configure the gesture, and then add it to the view using the `View/gesture(_:including:)` modifier. The following code adds a tap gesture to a `Circle` that toggles the color of the circle:

```swift
struct TapGestureView: View {
    @State private var tapped = false

    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in self.tapped = !self.tapped }
    }

    var body: some View {
        Circle()
            .fill(self.tapped ? Color.blue : Color.red)
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(tap)
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
- tvOS 16.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a tap gesture

- `init(count:)`
- `count`

## See Also

- `onTapGesture(count:perform:)`
- `onTapGesture(count:coordinateSpace:perform:)`
- `SpatialTapGesture`
