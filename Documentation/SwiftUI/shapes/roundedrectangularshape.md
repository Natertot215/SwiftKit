---
url: https://developer.apple.com/documentation/swiftui/roundedrectangularshape
framework: SwiftUI
category: Shapes
title: RoundedRectangularShape
kind: protocol
captured: 2026-05-02
---

# RoundedRectangularShape

A protocol of `InsettableShape` that describes a rounded rectangular shape.

## Declaration

```swift
protocol RoundedRectangularShape : InsettableShape
```

### Overview

Conform your `InsettableShape` type to `RoundedRectangularShape` when your shape is a rounded rectangular with four corners and you want to expose information about the corners. For example, a custom triangle `Shape` is not fit for such conformance, while a custom rectangle `Shape` could benefit from providing the implementation, especially when the shape is used as a container shape in `View/containerShape(_:)-3br47` to achieve concentricity.

System shapes like `Rectangle`, `RoundedRectangle`, `UnevenRoundedRectangle`, `Capsule`, and `Circle` already provide default implementation for this protocol.





## Relationships

**Inherits From**: `Animatable`, `InsettableShape`, `Sendable`, `SendableMetatype`, `Shape`, `View`

**Conforming Types**: `Capsule`, `Circle`, `Rectangle`, `RoundedRectangle`, `UnevenRoundedRectangle`

## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- visionOS 26.0
- watchOS 26.0

## Topics

### Instance Methods

- `corners(in:)`

### Type Aliases

- `RoundedRectangularShape.Corners`

## See Also

- `Rectangle`
- `RoundedRectangle`
- `RoundedCornerStyle`
- `RoundedRectangularShapeCorners`
- `UnevenRoundedRectangle`
- `RectangleCornerRadii`
- `RectangleCornerInsets`
- `ConcentricRectangle`
