---
url: https://developer.apple.com/documentation/swiftui/view/rotationeffect(_:anchor:)
framework: SwiftUI
category: Drawing and graphics
title: rotationEffect(_:anchor:)
kind: method
captured: 2026-05-02
---

# rotationEffect(_:anchor:)

Rotates a view’s rendered output in two dimensions around the specified point.

## Declaration

```swift
nonisolated func rotationEffect(_ angle: Angle, anchor: UnitPoint = .center) -> some View

```

### Return Value

A view with rotated content.

### Discussion

This modifier rotates the view’s content around the axis that points out of the xy-plane. It has no effect on the view’s frame. The following code rotates text by 22˚ and then draws a border around the modified view to show that the frame remains unchanged by the rotation modifier:

```swift
Text("Rotation by passing an angle in degrees")
    .rotationEffect(.degrees(22))
    .border(Color.gray)
```

## Parameters

- **angle**: The angle by which to rotate the view.
- **anchor**: A unit point within the view about which to perform the rotation. The default value is `UnitPoint/center`.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `scaledToFill()`
- `scaledToFit()`
- `scaleEffect(_:anchor:)`
- `scaleEffect(_:anchor:)`
- `scaleEffect(x:y:anchor:)`
- `scaleEffect(x:y:z:anchor:)`
- `aspectRatio(_:contentMode:)`
- `rotation3DEffect(_:axis:anchor:anchorZ:perspective:)`
- `perspectiveRotationEffect(_:axis:anchor:anchorZ:perspective:)`
- `rotation3DEffect(_:anchor:)`
- `rotation3DEffect(_:axis:anchor:)`
- `transformEffect(_:)`
- `transform3DEffect(_:)`
- `projectionEffect(_:)`
- `ProjectionTransform`
