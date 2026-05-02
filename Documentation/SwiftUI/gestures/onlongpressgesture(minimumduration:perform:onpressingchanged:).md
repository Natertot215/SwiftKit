---
url: https://developer.apple.com/documentation/swiftui/view/onlongpressgesture(minimumduration:perform:onpressingchanged:)
framework: SwiftUI
category: Gestures
title: onLongPressGesture(minimumDuration:perform:onPressingChanged:)
kind: method
captured: 2026-05-02
---

# onLongPressGesture(minimumDuration:perform:onPressingChanged:)

Adds an action to perform when this view recognizes a long press gesture.

## Declaration

```swift
nonisolated func onLongPressGesture(minimumDuration: Double = 0.5, perform action: @escaping () -> Void, onPressingChanged: ((Bool) -> Void)? = nil) -> some View

```



## Parameters

- **minimumDuration**: The minimum duration of the long press that must elapse before the gesture succeeds.
- **action**: The action to perform when a long press is recognized.
- **onPressingChanged**: A closure to run when the pressing state of the gesture changes, passing the current state as a parameter.





## Availability

- tvOS 14.0



## See Also

- `onLongPressGesture(minimumDuration:maximumDistance:perform:onPressingChanged:)`
- `onLongTouchGesture(minimumDuration:perform:onTouchingChanged:)`
- `LongPressGesture`
