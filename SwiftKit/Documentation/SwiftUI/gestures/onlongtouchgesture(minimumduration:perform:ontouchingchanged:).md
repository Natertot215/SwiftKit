---
url: https://developer.apple.com/documentation/swiftui/view/onlongtouchgesture(minimumduration:perform:ontouchingchanged:)
framework: SwiftUI
category: Gestures
title: onLongTouchGesture(minimumDuration:perform:onTouchingChanged:)
kind: method
captured: 2026-05-02
---

# onLongTouchGesture(minimumDuration:perform:onTouchingChanged:)

Adds an action to perform when this view recognizes a remote long touch gesture. A long touch gesture is when the finger is on the remote touch surface without actually pressing.

## Declaration

```swift
nonisolated func onLongTouchGesture(minimumDuration: Double = 0.5, perform action: @escaping () -> Void, onTouchingChanged: ((Bool) -> Void)? = nil) -> some View

```



## Parameters

- **minimumDuration**: The minimum duration of the long touch that must elapse before the gesture succeeds.
- **action**: The action to perform when a long touch is recognized
- **onTouchingChanged**: A closure to run when the touching state of the gesture changes, passing the current state as a parameter.





## Availability

- tvOS 16.0



## See Also

- `onLongPressGesture(minimumDuration:maximumDistance:perform:onPressingChanged:)`
- `onLongPressGesture(minimumDuration:perform:onPressingChanged:)`
- `LongPressGesture`
