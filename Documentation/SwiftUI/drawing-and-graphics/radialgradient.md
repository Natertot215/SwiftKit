---
url: https://developer.apple.com/documentation/swiftui/radialgradient
framework: SwiftUI
category: Drawing and graphics
title: RadialGradient
kind: struct
captured: 2026-05-07
---

# RadialGradient

A radial gradient.

## Declaration

```swift
@frozen struct RadialGradient
```

### Overview

The gradient applies the color function as the distance from a center point, scaled to fit within the defined start and end radii. The gradient maps the unit space center point into the bounding rectangle of each shape filled with the gradient.

When using a radial gradient as a shape style, you can also use `ShapeStyle/radialGradient(_:center:startRadius:endRadius:)`.





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

### Creating a radial gradient

- `init(gradient:center:startRadius:endRadius:)`
- `init(colors:center:startRadius:endRadius:)`
- `init(stops:center:startRadius:endRadius:)`

## See Also

- `AngularGradient`
- `EllipticalGradient`
- `LinearGradient`
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
