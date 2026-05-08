---
url: https://developer.apple.com/documentation/swiftui/angulargradient
framework: SwiftUI
category: Drawing and graphics
title: AngularGradient
kind: struct
captured: 2026-05-07
---

# AngularGradient

An angular gradient.

## Declaration

```swift
@frozen struct AngularGradient
```

### Overview

An angular gradient is also known as a “conic” gradient. This gradient applies the color function as the angle changes, relative to a center point and defined start and end angles. If `endAngle - startAngle > 2π`, the gradient only draws the last complete turn. If `endAngle - startAngle < 2π`, the gradient fills the missing area with the colors defined by gradient locations one and zero, transitioning between the two halfway across the missing area. The gradient maps the unit space center point into the bounding rectangle of each shape filled with the gradient.

When using an angular gradient as a shape style, you can also use `ShapeStyle/angularGradient(_:center:startAngle:endAngle:)`, `ShapeStyle/conicGradient(_:center:angle:)`, or similar methods.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`, `ShapeStyle`, `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a full rotation angular gradient

- `init(gradient:center:angle:)`
- `init(colors:center:angle:)`
- `init(stops:center:angle:)`

### Creating a partial rotation angular gradient

- `init(gradient:center:startAngle:endAngle:)`
- `init(colors:center:startAngle:endAngle:)`
- `init(stops:center:startAngle:endAngle:)`

## See Also

- `EllipticalGradient`
- `LinearGradient`
- `RadialGradient`
- `Material`
- `ImagePaint`
- `HierarchicalShapeStyle`
- `HierarchicalShapeStyleModifier`
- `ForegroundStyle`
- `BackgroundStyle`
- `SelectionShapeStyle`
- `SeparatorShapeStyle`
- `TintShapeStyle`
- `FillShapeStyle`
- `LinkShapeStyle`
- `PlaceholderTextShapeStyle`
