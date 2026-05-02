---
url: https://developer.apple.com/documentation/swiftui/meshgradient
framework: SwiftUI
category: Drawing and graphics
title: MeshGradient
kind: struct
captured: 2026-05-02
---

# MeshGradient

A two-dimensional gradient defined by a 2D grid of positioned colors.

## Declaration

```swift
struct MeshGradient
```

### Overview

Each vertex has a position, a color and four surrounding Bezier control points (leading, top, trailing, bottom) that define the tangents connecting the vertex with its four neighboring vertices. (Vertices on the corners or edges of the mesh have less than four neighbors, they ignore their extra control points.) Control points may either be specified explicitly or implicitly.

When rendering, a tessellated sequence of Bezier patches are created, and vertex colors are interpolated across each patch, either linearly, or via another set of cubic curves derived from how the colors change between neighbors – the latter typically gives smoother color transitions.

```swift
MeshGradient(width: 3, height: 3, points: [
    .init(0, 0), .init(0.5, 0), .init(1, 0),
    .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
    .init(0, 1), .init(0.5, 1), .init(1, 1)
], colors: [
    .red, .purple, .indigo,
    .orange, .white, .blue,
    .yellow, .green, .mint
])
```





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Sendable`, `SendableMetatype`, `ShapeStyle`, `View`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Structures

- `MeshGradient.BezierPoint`

### Initializers

- `init(width:height:bezierPoints:colors:background:smoothsColors:colorSpace:)`
- `init(width:height:bezierPoints:resolvedColors:background:smoothsColors:colorSpace:)`
- `init(width:height:locations:colors:background:smoothsColors:colorSpace:)`
- `init(width:height:points:colors:background:smoothsColors:colorSpace:)`
- `init(width:height:points:resolvedColors:background:smoothsColors:colorSpace:)`

### Instance Properties

- `background`
- `colorSpace`
- `colors`
- `height`
- `locations`
- `smoothsColors`
- `width`

### Enumerations

- `MeshGradient.Colors`
- `MeshGradient.Locations`

## See Also

- `border(_:width:)`
- `foregroundStyle(_:)`
- `foregroundStyle(_:_:)`
- `foregroundStyle(_:_:_:)`
- `backgroundStyle(_:)`
- `backgroundStyle`
- `ShapeStyle`
- `AnyShapeStyle`
- `Gradient`
- `AnyGradient`
- `ShadowStyle`
- `Glass`
