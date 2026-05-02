---
url: https://developer.apple.com/documentation/swiftui/shapeview
framework: SwiftUI
category: Shapes
title: ShapeView
kind: protocol
captured: 2026-05-02
---

# ShapeView

A view that provides a shape that you can use for drawing operations.

## Declaration

```swift
protocol ShapeView<Content> : View, _RemoveGlobalActorIsolation
```

### Overview

Use this type with the drawing methods on `Shape` to apply multiple fills and/or strokes to a shape. For example, the following code applies a fill and stroke to a capsule shape:

```swift
Capsule()
    .fill(.yellow)
    .stroke(.blue, lineWidth: 8)
```





## Relationships

**Inherits From**: `View`

**Conforming Types**: `FillShapeView`, `StrokeBorderShapeView`, `StrokeShapeView`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting the shape

- `shape`
- `Content`

### Modify the shape

- `fill(_:style:)`
- `stroke(_:style:antialiased:)`
- `stroke(_:lineWidth:antialiased:)`
- `strokeBorder(_:style:antialiased:)`
- `strokeBorder(_:lineWidth:antialiased:)`

## See Also

- `Shape`
- `AnyShape`
- `ShapeRole`
- `StrokeStyle`
- `StrokeShapeView`
- `StrokeBorderShapeView`
- `FillStyle`
- `FillShapeView`
