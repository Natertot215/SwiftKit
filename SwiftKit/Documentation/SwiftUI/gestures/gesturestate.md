---
url: https://developer.apple.com/documentation/swiftui/gesturestate
framework: SwiftUI
category: Gestures
title: GestureState
kind: struct
captured: 2026-05-02
---

# GestureState

A property wrapper type that updates a property while the user performs a gesture and resets the property back to its initial state when the gesture ends.

## Declaration

```swift
@propertyWrapper @frozen struct GestureState<Value>
```

### Overview

Declare a property as `@GestureState`, pass as a binding to it as a parameter to a gesture’s `Gesture/updating(_:body:)` callback, and receive updates to it. A property that’s declared as `@GestureState` implicitly resets when the gesture becomes inactive, making it suitable for tracking transient state.

Add a long-press gesture to a `Circle`, and update the interface during the gesture by declaring a property as `@GestureState`:

```swift
struct SimpleLongPressGestureView: View {
    @GestureState private var isDetectingLongPress = false

    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 3)
            .updating($isDetectingLongPress) { currentState, gestureState, transaction in
                gestureState = currentState
            }
    }

    var body: some View {
        Circle()
            .fill(self.isDetectingLongPress ? Color.red : Color.green)
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(longPress)
    }
}
```





## Relationships

**Conforms To**: `DynamicProperty`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a gesture state

- `init(initialValue:)`
- `init(initialValue:reset:)`
- `init(initialValue:resetTransaction:)`
- `init(reset:)`
- `init(resetTransaction:)`
- `init(wrappedValue:)`
- `init(wrappedValue:reset:)`
- `init(wrappedValue:resetTransaction:)`

### Getting the state

- `wrappedValue`
- `projectedValue`

## See Also

- `GestureStateGesture`
