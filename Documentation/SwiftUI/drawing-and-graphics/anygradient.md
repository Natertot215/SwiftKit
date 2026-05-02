---
url: https://developer.apple.com/documentation/swiftui/anygradient
framework: SwiftUI
category: Drawing and graphics
title: AnyGradient
kind: struct
captured: 2026-05-02
---

# AnyGradient

A color gradient.

## Declaration

```swift
@frozen struct AnyGradient
```

### Overview

When used as a `ShapeStyle`, this type draws a linear gradient with start-point [0.5, 0] and end-point [0.5, 1].





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Hashable`, `ScaleRange`, `Sendable`, `SendableMetatype`, `ShapeStyle`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating a gradient

- `init(_:)`

### Working with color spaces

- `colorSpace(_:)`

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
- `MeshGradient`
- `ShadowStyle`
- `Glass`
