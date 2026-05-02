---
url: https://developer.apple.com/documentation/swiftui/gradient
framework: SwiftUI
category: Drawing and graphics
title: Gradient
kind: struct
captured: 2026-05-02
---

# Gradient

A color gradient represented as an array of color stops, each having a parametric location value.

## Declaration

```swift
@frozen struct Gradient
```







## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Hashable`, `ScaleRange`, `Sendable`, `SendableMetatype`, `ShapeStyle`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a gradient from colors

- `init(colors:)`

### Creating a gradient from stops

- `init(stops:)`
- `stops`
- `Gradient.Stop`

### Working with color spaces

- `colorSpace(_:)`
- `Gradient.ColorSpace`

## See Also

- `border(_:width:)`
- `foregroundStyle(_:)`
- `foregroundStyle(_:_:)`
- `foregroundStyle(_:_:_:)`
- `backgroundStyle(_:)`
- `backgroundStyle`
- `ShapeStyle`
- `AnyShapeStyle`
- `MeshGradient`
- `AnyGradient`
- `ShadowStyle`
- `Glass`
