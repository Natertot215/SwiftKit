---
url: https://developer.apple.com/documentation/swiftui/concentricrectangle
framework: SwiftUI
category: Shapes
title: ConcentricRectangle
kind: struct
captured: 2026-05-02
---

# ConcentricRectangle

A shape that is replaced by a concentric version of the current container shape. If the container shape is a rectangle derived shape with four corners, this shape could choose to respect corners individually.

## Declaration

```swift
struct ConcentricRectangle
```

### Overview

To use `ConcentricRectangle`, first make sure the ancestor view hierarchy provides the container shape. Some container shapes are provided by platform kits, but you could provide your own by writing the `View/containerShape(_:)-3br47` modifier with a shape. Then, either call one of the initializers of `ConcentricRectangle` or use the static `Shape` convenience to create the concentric shape.

```swift
    ZStack {
        Color.cyan
            .fill(.rect(corners: .concentric(minimum: 12), isUniform: false))
            .padding(.all, padding)
    }
    .containerShape(.rect(cornerRadius: 24))
```

The above example will generate a shape that is inset by `padding` on all sides. It will stay concentric to its container shape which has a 24 pts corner radius, so the shape will have a smaller radius with more padding. However, since here we provided a minimum value, the radius will be at least 12 pts, ensuring the shape to never have a square corner.

`ConcentricRectangle` also provides per-corner control with the initializers that take different styles for each corner.

```swift
ConcentricRectangle(
    topLeadingCorner: 0,
    topTrailingCorner: 28,
    bottomLeadingCorner: .concentric,
    bottomTrailingCorner: .concentric(minimum: 12)
)
```

The above example will have the top leading corner as square, the top trailing corner as constant 28 pts radius, the bottom leading as concentric to container shape, and bottom trailing as concentric with a minimum radius.

If you wish `ConcentricRectangle` to be symmetric on two corners, create the shape with initializers that takes an uniform corner style for any two corners on the rectangle. `ConcentricRectangle` will still resolves corner radius individually, but use the maximum value out of the corners as the final, shared corner radius of the uniform corners.

When the container shape provided is not a `RoundedRectangularShape` compatible shape, `ConcentricRectangle` will not be able to resolve corner radius based on concentricity. In those cases, it will fallback to be a `ContainerRelativeShape`, which is an inset version of the container shape.

> **NOTE:** `ContainerRelativeShape`.

> **NOTE:** `Shape/rect(corners:isUniform:))`, `Shape/rect(uniformTopCorners:uniformBottomCorners:)`, `Shape/rect(uniformLeadingCorners:uniformTrailingCorners:)`, `Shape/rect(uniformTopCorners:bottomLeadingCorner:bottomTrailingCorner:)`, `Shape/rect(uniformBottomCorners:topLeadingCorner:topTrailingCorner:)`, `Shape/rect(uniformLeadingCorners:topTrailingCorner:bottomTrailingCorner:)`, `Shape/rect(uniformTrailingCorners:topLeadingCorner:bottomLeadingCorner:)`.





## Relationships

**Conforms To**: `Animatable`, `Sendable`, `SendableMetatype`, `Shape`, `View`

## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- visionOS 26.0
- watchOS 26.0

## Topics

### Initializers

- `init()`
- `init(corners:isUniform:)`
- `init(topLeadingCorner:topTrailingCorner:bottomLeadingCorner:bottomTrailingCorner:)`
- `init(uniformBottomCorners:topLeadingCorner:topTrailingCorner:)`
- `init(uniformLeadingCorners:topTrailingCorner:bottomTrailingCorner:)`
- `init(uniformLeadingCorners:uniformTrailingCorners:)`
- `init(uniformTopCorners:bottomLeadingCorner:bottomTrailingCorner:)`
- `init(uniformTopCorners:uniformBottomCorners:)`
- `init(uniformTrailingCorners:topLeadingCorner:bottomLeadingCorner:)`

## See Also

- `Rectangle`
- `RoundedRectangle`
- `RoundedCornerStyle`
- `RoundedRectangularShape`
- `RoundedRectangularShapeCorners`
- `UnevenRoundedRectangle`
- `RectangleCornerRadii`
- `RectangleCornerInsets`
