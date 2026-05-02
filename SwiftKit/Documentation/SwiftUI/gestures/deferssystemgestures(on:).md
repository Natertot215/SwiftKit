---
url: https://developer.apple.com/documentation/swiftui/view/deferssystemgestures(on:)
framework: SwiftUI
category: Gestures
title: defersSystemGestures(on:)
kind: method
captured: 2026-05-02
---

# defersSystemGestures(on:)

Sets the screen edge from which you want your gesture to take precedence over the system gesture.

## Declaration

```swift
nonisolated func defersSystemGestures(on edges: Edge.Set) -> some View

```

### Discussion

The following code defers the vertical screen edges system gestures of a given canvas.

```swift
struct DeferredView: View {
    var body: some View {
        Canvas()
            .defersSystemGestures(on: .vertical)
    }
}
```

## Parameters

- **edges**: A value that indicates the screen edge from which you want your gesture to take precedence over the system gesture.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0



## See Also

- `highPriorityGesture(_:including:)`
- `highPriorityGesture(_:isEnabled:)`
- `highPriorityGesture(_:name:isEnabled:)`
- `handGestureShortcut(_:isEnabled:)`
- `Gesture`
- `AnyGesture`
- `HandActivationBehavior`
- `HandGestureShortcut`
