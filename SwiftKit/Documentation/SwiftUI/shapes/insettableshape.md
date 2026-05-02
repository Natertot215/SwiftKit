---
url: https://developer.apple.com/documentation/swiftui/insettableshape
framework: SwiftUI
category: Shapes
title: InsettableShape
kind: protocol
captured: 2026-05-02
---

# InsettableShape

A shape type that is able to inset itself to produce another shape.

## Declaration

```swift
protocol InsettableShape : Shape
```







## Relationships

**Inherits From**: `Animatable`, `Sendable`, `SendableMetatype`, `Shape`, `View`

**Inherited By**: `RoundedRectangularShape`

**Conforming Types**: `ButtonBorderShape`, `Capsule`, `Circle`, `ContainerRelativeShape`, `Ellipse`, `OffsetShape`, `Rectangle`, `RotatedShape`, `RoundedRectangle`, `UnevenRoundedRectangle`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Setting the stroke border characteristics

- `strokeBorder(_:lineWidth:antialiased:)`
- `strokeBorder(lineWidth:antialiased:)`
- `strokeBorder(_:style:antialiased:)`
- `strokeBorder(style:antialiased:)`

### Setting the inset

- `inset(by:)`
- `InsetShape`

## See Also

- `containerShape(_:)`
- `ContainerRelativeShape`
