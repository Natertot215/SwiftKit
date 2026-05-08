---
url: https://developer.apple.com/documentation/swiftui/lineargradient
framework: SwiftUI
category: Drawing and graphics
title: LinearGradient
kind: struct
captured: 2026-05-07
---

# LinearGradient

A linear gradient.

## Declaration

```swift
@frozen struct LinearGradient
```

### Overview

The gradient applies the color function along an axis, as defined by its start and end points. The gradient maps the unit space points into the bounding rectangle of each shape filled with the gradient.

When using a linear gradient as a shape style, you can also use `ShapeStyle/linearGradient(_:startPoint:endPoint:)`.





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

### Creating a linear gradient

- `init(gradient:startPoint:endPoint:)`
- `init(colors:startPoint:endPoint:)`
- `init(stops:startPoint:endPoint:)`

## See Also

- `AngularGradient`
- `EllipticalGradient`
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
