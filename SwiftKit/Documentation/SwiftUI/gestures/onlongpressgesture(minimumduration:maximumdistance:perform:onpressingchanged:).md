---
url: https://developer.apple.com/documentation/swiftui/view/onlongpressgesture(minimumduration:maximumdistance:perform:onpressingchanged:)
framework: SwiftUI
category: Gestures
title: onLongPressGesture(minimumDuration:maximumDistance:perform:onPressingChanged:)
kind: method
captured: 2026-05-02
---

# onLongPressGesture(minimumDuration:maximumDistance:perform:onPressingChanged:)

Adds an action to perform when this view recognizes a long press gesture.

## Declaration

```swift
nonisolated func onLongPressGesture(minimumDuration: Double = 0.5, maximumDistance: CGFloat = 10, perform action: @escaping () -> Void, onPressingChanged: ((Bool) -> Void)? = nil) -> some View

```



## Parameters

- **minimumDuration**: The minimum duration of the long press that must elapse before the gesture succeeds.
- **maximumDistance**: The maximum distance that the fingers or cursor performing the long press can move before the gesture fails.
- **action**: The action to perform when a long press is recognized.
- **onPressingChanged**: A closure to run when the pressing state of the gesture changes, passing the current state as a parameter.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- visionOS 1.0
- watchOS 6.0



## See Also

- `onLongPressGesture(minimumDuration:perform:onPressingChanged:)`
- `onLongTouchGesture(minimumDuration:perform:onTouchingChanged:)`
- `LongPressGesture`
