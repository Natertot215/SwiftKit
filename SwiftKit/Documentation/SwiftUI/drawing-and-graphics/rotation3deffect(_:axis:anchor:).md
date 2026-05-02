---
url: https://developer.apple.com/documentation/swiftui/view/rotation3deffect(_:axis:anchor:)
framework: SwiftUI
category: Drawing and graphics
title: rotation3DEffect(_:axis:anchor:)
kind: method
captured: 2026-05-02
---

# rotation3DEffect(_:axis:anchor:)

Rotates the view’s content by an angle about an axis that you specify as a tuple of elements.

## Declaration

```swift
nonisolated func rotation3DEffect(_ angle: Angle, axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint3D = .center) -> some View

```

### Return Value

A view with rotated content.

### Discussion

> **NOTE:** During an animation, the angle and each element of the axis is interpolated separately, which may cause undesirable results. To achieve more natural animations, consider using `View/rotation3DEffect(_:anchor:)`

This modifier rotates the view’s content without changing the view’s frame. The following code displays a 3D model with a rotation of 45° about the y-axis using the default anchor point at the center of the view:

```swift
Model3D(named: "robot")
    .rotation3DEffect(.degrees(45), axis: (x: 0, y: 1, z: 0))
```

> **NOTE:** The following example is not equivalent to the previous. This example will use spherical linear interpolation during an animation.

```swift
let rotation = Rotation3D(
    .init(degrees: 45), axis: RotationAxis3D(x: 0, y: 1, z: 0))
Model3D(named: "robot")
    .rotation3DEffect(rotation)
```

## Parameters

- **angle**: The angle by which to rotate the view’s content.
- **axis**: The axis of rotation, specified as a tuple with named elements for each of the three spatial dimensions.
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
- `rotation3DEffect(_:anchor:)`
- `transformEffect(_:)`
- `transform3DEffect(_:)`
- `projectionEffect(_:)`
- `ProjectionTransform`
