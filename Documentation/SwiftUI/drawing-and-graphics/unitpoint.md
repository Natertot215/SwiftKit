---
url: https://developer.apple.com/documentation/swiftui/unitpoint
framework: SwiftUI
category: Drawing and graphics
title: UnitPoint
kind: struct
captured: 2026-05-02
---

# UnitPoint

A normalized 2D point in a view’s coordinate space.

## Declaration

```swift
@frozen struct UnitPoint
```

### Overview

Use a unit point to represent a location in a view without having to know the view’s rendered size. The point stores a value in each dimension that indicates the fraction of the view’s size in that dimension — measured from the view’s origin — where the point appears. For example, you can create a unit point that represents the center of any view by using the value `0.5` for each dimension:

```swift
let unitPoint = UnitPoint(x: 0.5, y: 0.5)
```

To project the unit point into the rendered view’s coordinate space, multiply each component of the unit point with the corresponding component of the view’s size:

```swift
let projectedPoint = CGPoint(
    x: unitPoint.x * size.width,
    y: unitPoint.y * size.height
)
```

You can perform this calculation yourself if you happen to know a view’s size, or if you want to use the unit point for some custom purpose, but SwiftUI typically does this for you to carry out operations that you request, like when you:

- Transform a shape using a shape modifier. For example, to rotate a shape with `Shape/rotation(_:anchor:)`, you indicate an anchor point that you want to rotate the shape around.
- Override the alignment of the view in a `Grid` cell using the `View/gridCellAnchor(_:)` view modifier. The grid aligns the projection of a unit point onto the view with the projection of the same unit point onto the cell.
- Create a gradient that has a center, or start and stop points, relative to the shape that you are styling. See the gradient methods in `ShapeStyle`.

You can create custom unit points with explicit values, like the example above, or you can use one of the built-in unit points that SwiftUI provides, like `UnitPoint/zero`, `UnitPoint/center`, or `UnitPoint/topTrailing`. The built-in values correspond to the alignment positions of the similarly named, built-in `Alignment` types.

> **NOTE:** A unit point with one or more components outside the range `[0, 1]` projects to a point outside of the view.

#### Layout direction

When a person configures their device to use a left-to-right language like English, the system places the view’s origin in its top-left corner, with positive x toward the right and positive y toward the bottom of the view. In a right-to-left environment, the origin moves to the upper-right corner, and the positive x direction changes to be toward the left. You don’t typically need to do anything to handle this change, because SwiftUI applies the change to all aspects of the system. For example, see the discussion about layout direction in `HorizontalAlignment`.

It’s important to test your app for the different locales that you distribute your app in. For more information about the localization process, see `localization`.





## Relationships

**Conforms To**: `Animatable`, `BitwiseCopyable`, `Copyable`, `Decodable`, `Encodable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting the origin

- `zero`

### Getting top points

- `topLeading`
- `top`
- `topTrailing`

### Getting middle points

- `leading`
- `center`
- `trailing`

### Getting bottom points

- `bottomLeading`
- `bottom`
- `bottomTrailing`

### Creating a point

- `init()`
- `init(x:y:)`

### Getting the point’s coordinates

- `x`
- `y`

## See Also

- `Axis`
- `Angle`
- `UnitPoint3D`
- `Anchor`
- `DepthAlignmentID`
- `Alignment3D`
- `GeometryProxyCoordinateSpace3D`
