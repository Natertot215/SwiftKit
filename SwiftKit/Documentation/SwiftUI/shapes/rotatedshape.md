---
url: https://developer.apple.com/documentation/swiftui/rotatedshape
framework: SwiftUI
category: Shapes
title: RotatedShape
kind: struct
captured: 2026-05-02
---

# RotatedShape

A shape with a rotation transform applied to it.

## Declaration

```swift
@frozen struct RotatedShape<Content> where Content : Shape
```







## Relationships

**Conforms To**: `Animatable`, `Copyable`, `Escapable`, `InsettableShape`, `Sendable`, `SendableMetatype`, `Shape`, `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a rotated shape

- `init(shape:angle:anchor:)`

### Getting the shape’s characteristics

- `anchor`
- `angle`
- `shape`

### Supporting types

- `animatableData`

## See Also

- `ScaledShape`
- `OffsetShape`
- `TransformedShape`
