---
url: https://developer.apple.com/documentation/swiftui/unitpoint3d
framework: SwiftUI
category: Drawing and graphics
title: UnitPoint3D
kind: struct
captured: 2026-05-02
---

# UnitPoint3D

A normalized 3D point in a view’s coordinate space.

## Declaration

```swift
@frozen struct UnitPoint3D
```

### Overview

Use a 3D unit point to represent a three-dimensional location in a view without having to know the view’s rendered size. The point stores a value in each dimension that indicates the fraction of the view’s size in that dimension — measured from the view’s origin — where the point appears. For example, you can create a unit point that represents the center of any view by using the value `0.5` for each dimension:

```swift
let unitPoint = UnitPoint3D(x: 0.5, y: 0.5, z: 0.5)
```

> **NOTE:** If you need a two-dimensional unit point, use `UnitPoint` instead.

To project the unit point into the rendered view’s coordinate space, multiply each component of the unit point with the corresponding component of the view’s size:

```swift
let projectedPoint = Point3D(
    x: unitPoint.x * size.width,
    y: unitPoint.y * size.height,
    z: unitPoint.z * size.depth
)
```

You can perform this calculation yourself if you happen to know a view’s size, or if you want to use a unit point for some custom purpose, but SwiftUI typically does this for you to carry out operations that you request, like when you rotate a view with the `View/rotation3DEffect(_:anchor:)` modifier and indicate the anchor point that you want to rotate the view around.

You can create custom unit points with explicit values, like the example above, or you can use one of the built-in unit points that SwiftUI provides, like `UnitPoint3D/zero`, `UnitPoint3D/center`, or `UnitPoint3D/topTrailing`. The built-in values correspond to common anchor points that you might want to refer to, like the center of one of a view’s edges.

> **NOTE:** A unit point with one or more components outside the range `[0, 1]` projects to a point outside of the view.

#### Layout direction

When a person configures their device to use a left-to-right language like English, the system places the view’s origin in its top-left-back corner, with positive x toward the right, positive y toward the bottom of the view, and positive z toward the front. In a right-to-left environment, the origin moves to the upper-right-back corner, and the positive x direction changes to be toward the left. You don’t typically need to do anything to handle this change, because SwiftUI applies the change to all aspects of the system. For example, see the discussion about layout direction in `HorizontalAlignment`.

It’s important to test your app for the different locales that you distribute your app in. For more information about the localization process, see `localization`.





## Relationships

**Conforms To**: `Animatable`, `BitwiseCopyable`, `Copyable`, `Decodable`, `Encodable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- visionOS 1.0

## Topics

### Getting the origin

- `origin`
- `zero`

### Getting top points

- `topLeadingBack`
- `topLeading`
- `topLeadingFront`
- `topBack`
- `top`
- `topFront`
- `topTrailingBack`
- `topTrailing`
- `topTrailingFront`

### Getting middle points

- `leadingBack`
- `leading`
- `leadingFront`
- `back`
- `center`
- `front`
- `trailingBack`
- `trailing`
- `trailingFront`

### Getting bottom points

- `bottomLeadingBack`
- `bottomLeading`
- `bottomLeadingFront`
- `bottomBack`
- `bottom`
- `bottomFront`
- `bottomTrailingBack`
- `bottomTrailing`
- `bottomTrailingFront`

### Creating a point

- `init()`
- `init(x:y:z:)`

### Getting the point’s coordinates

- `x`
- `y`
- `z`

## See Also

- `Axis`
- `Angle`
- `UnitPoint`
- `Anchor`
- `DepthAlignmentID`
- `Alignment3D`
- `GeometryProxyCoordinateSpace3D`
