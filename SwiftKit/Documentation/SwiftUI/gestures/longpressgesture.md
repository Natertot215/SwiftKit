---
url: https://developer.apple.com/documentation/swiftui/longpressgesture
framework: SwiftUI
category: Gestures
title: LongPressGesture
kind: struct
captured: 2026-05-02
---

# LongPressGesture

A gesture that succeeds when the user performs a long press.

## Declaration

```swift
struct LongPressGesture
```

### Overview

To recognize a long-press gesture on a view, create and configure the gesture, then add it to the view using the `View/gesture(_:including:)` modifier.

Add a long-press gesture to a `Circle` to animate its color from blue to red, and then change it to green when the gesture ends:

```swift
struct LongPressGestureView: View {
    @GestureState private var isDetectingLongPress = false
    @State private var completedLongPress = false

    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 3)
            .updating($isDetectingLongPress) { currentState, gestureState,
                    transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 2.0)
            }
            .onEnded { finished in
                self.completedLongPress = finished
            }
    }

    var body: some View {
        Circle()
            .fill(self.isDetectingLongPress ?
                Color.red :
                (self.completedLongPress ? Color.green : Color.blue))
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(longPress)
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
- tvOS 14.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a long press gesture

- `init(minimumDuration:)`
- `init(minimumDuration:maximumDistance:)`
- `minimumDuration`
- `maximumDistance`

## See Also

- `onLongPressGesture(minimumDuration:maximumDistance:perform:onPressingChanged:)`
- `onLongPressGesture(minimumDuration:perform:onPressingChanged:)`
- `onLongTouchGesture(minimumDuration:perform:onTouchingChanged:)`
