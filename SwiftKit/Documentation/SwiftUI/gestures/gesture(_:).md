---
url: https://developer.apple.com/documentation/swiftui/view/gesture(_:)
framework: SwiftUI
category: Gestures
title: gesture(_:)
kind: method
captured: 2026-05-02
---

# gesture(_:)

Attaches an `NSGestureRecognizerRepresentable` to the view.

## Declaration

```swift
nonisolated func gesture(_ representable: some NSGestureRecognizerRepresentable) -> some View

```

### Return Value

A view with an `NSGestureRecognizerRepresentable` attached.

## Parameters

- **representable**: The `NSGestureRecognizerRepresentable` that creates and manages a gesture recognizer.





## Availability

- macOS 26.0



## See Also

- `gesture(_:isEnabled:)`
- `gesture(_:name:isEnabled:)`
- `gesture(_:including:)`
- `DragGesture`
- `WindowDragGesture`
- `MagnifyGesture`
- `RotateGesture`
- `RotateGesture3D`
- `GestureMask`
