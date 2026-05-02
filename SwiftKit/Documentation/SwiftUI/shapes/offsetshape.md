---
url: https://developer.apple.com/documentation/swiftui/offsetshape
framework: SwiftUI
category: Shapes
title: OffsetShape
kind: struct
captured: 2026-05-02
---

# OffsetShape

A shape with a translation offset transform applied to it.

## Declaration

```swift
@frozen struct OffsetShape<Content> where Content : Shape
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

### Creating an offset shape

- `init(shape:offset:)`

### Getting the shape’s characteristics

- `offset`
- `shape`

### Supporting types

- `animatableData`

## See Also

- `ScaledShape`
- `RotatedShape`
- `TransformedShape`
