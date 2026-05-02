---
url: https://developer.apple.com/documentation/swiftui/view/rotation3deffect(_:anchor:)
framework: SwiftUI
category: Drawing and graphics
title: rotation3DEffect(_:anchor:)
kind: method
captured: 2026-05-02
---

# rotation3DEffect(_:anchor:)

Rotates the view’s content by the specified 3D rotation value.

## Declaration

```swift
nonisolated func rotation3DEffect(_ rotation: Rotation3D, anchor: UnitPoint3D = .center) -> some View

```

### Return Value

A view with rotated content.

### Discussion

This modifier rotates the view’s content without changing the view’s frame. The following code displays a 3D model with a rotation of 45° about the y-axis using the default anchor point at the center of the view:

```swift
Model3D(named: "robot")
    .rotation3DEffect(Rotation3D(angle: .degrees(45), axis: .y))
```

During an animation, this modifier uses spherical linear interpolation, which produces more natural animations, but doesn’t support rotations over 360 degrees. To specify angles over 360 degrees, consider using `View/rotation3DEffect(_:axis:anchor:)-4enag`.

## Parameters

- **rotation**: A rotation to apply to the view’s content.
- **anchor**: The unit point within the view about which to perform the rotation. The default value is `UnitPoint3D/center`.





## Availability

- visionOS 1.0



## See Also

- `scaledToFill()`
- `scaledToFit()`
- `scaleEffect(_:anchor:)`
- `scaleEffect(_:anchor:)`
- `scaleEffect(x:y:anchor:)`
- `scaleEffect(x:y:z:anchor:)`
- `aspectRatio(_:contentMode:)`
- `rotationEffect(_:anchor:)`
- `rotation3DEffect(_:axis:anchor:anchorZ:perspective:)`
- `perspectiveRotationEffect(_:axis:anchor:anchorZ:perspective:)`
- `rotation3DEffect(_:axis:anchor:)`
- `transformEffect(_:)`
- `transform3DEffect(_:)`
- `projectionEffect(_:)`
- `ProjectionTransform`
