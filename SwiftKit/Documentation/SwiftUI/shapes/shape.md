---
url: https://developer.apple.com/documentation/swiftui/shape
framework: SwiftUI
category: Shapes
title: Shape
kind: protocol
captured: 2026-05-02
---

# Shape

A 2D shape that you can use when drawing a view.

## Declaration

```swift
protocol Shape : Sendable, Animatable, View, _RemoveGlobalActorIsolation
```

### Overview

Shapes without an explicit fill or stroke get a default fill based on the foreground color.

You can define shapes in relation to an implicit frame of reference, such as the natural size of the view that contains it. Alternatively, you can define shapes in terms of absolute coordinates.





## Relationships

**Inherits From**: `Animatable`, `Sendable`, `SendableMetatype`, `View`

**Inherited By**: `InsettableShape`, `RoundedRectangularShape`

**Conforming Types**: `AnyShape`, `ButtonBorderShape`, `Capsule`, `Circle`, `ConcentricRectangle`, `ContainerRelativeShape`, `DefaultGlassEffectShape`, `Ellipse`, `OffsetShape`, `Path`, `Rectangle`, `RotatedShape`, `RoundedRectangle`, `ScaledShape`, `TransformedShape`, `UnevenRoundedRectangle`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting standard shapes

- `buttonBorder`
- `capsule`
- `capsule(style:)`
- `circle`
- `containerRelative`
- `ellipse`
- `rect`
- `rect(cornerRadii:style:)`
- `rect(cornerRadius:style:)`
- `rect(cornerSize:style:)`
- `rect(topLeadingRadius:bottomLeadingRadius:bottomTrailingRadius:topTrailingRadius:style:)`

### Defining a shape’s size and path

- `sizeThatFits(_:)`
- `path(in:)`

### Transforming a shape

- `trim(from:to:)`
- `transform(_:)`
- `size(_:)`
- `size(width:height:)`
- `scale(_:anchor:)`
- `scale(x:y:anchor:)`
- `rotation(_:anchor:)`
- `offset(_:)`
- `offset(x:y:)`

### Setting the stroke characteristics

- `stroke(_:lineWidth:)`
- `stroke(_:lineWidth:antialiased:)`
- `stroke(lineWidth:)`
- `stroke(_:style:)`
- `stroke(_:style:antialiased:)`
- `stroke(style:)`

### Filling a shape

- `fill(_:style:)`
- `fill(style:)`

### Setting the role

- `role`

### Indicating a layout direction

- `layoutDirectionBehavior`

### Performing operations on a shape

- `intersection(_:eoFill:)`
- `lineIntersection(_:eoFill:)`
- `lineSubtraction(_:eoFill:)`
- `subtracting(_:eoFill:)`
- `symmetricDifference(_:eoFill:)`
- `union(_:eoFill:)`

### Instance Methods

- `size(_:anchor:)`
- `size(width:height:anchor:)`

### Type Methods

- `rect(corners:isUniform:)`
- `rect(topLeadingCorner:topTrailingCorner:bottomLeadingCorner:bottomTrailingCorner:)`
- `rect(uniformBottomCorners:topLeadingCorner:topTrailingCorner:)`
- `rect(uniformLeadingCorners:topTrailingCorner:bottomTrailingCorner:)`
- `rect(uniformLeadingCorners:uniformTrailingCorners:)`
- `rect(uniformTopCorners:bottomLeadingCorner:bottomTrailingCorner:)`
- `rect(uniformTopCorners:uniformBottomCorners:)`
- `rect(uniformTrailingCorners:topLeadingCorner:bottomLeadingCorner:)`

## See Also

- `ShapeView`
- `AnyShape`
- `ShapeRole`
- `StrokeStyle`
- `StrokeShapeView`
- `StrokeBorderShapeView`
- `FillStyle`
- `FillShapeView`
