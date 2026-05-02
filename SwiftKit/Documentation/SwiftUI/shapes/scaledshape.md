---
url: https://developer.apple.com/documentation/swiftui/scaledshape
framework: SwiftUI
category: Shapes
title: ScaledShape
kind: struct
captured: 2026-05-02
---

# ScaledShape

A shape with a scale transform applied to it.

## Declaration

```swift
@frozen struct ScaledShape<Content> where Content : Shape
```







## Relationships

**Conforms To**: `Animatable`, `Sendable`, `SendableMetatype`, `Shape`, `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a scaled shape

- `init(shape:scale:anchor:)`

### Getting the shape’s characteristics

- `anchor`
- `scale`
- `shape`

### Supporting types

- `animatableData`

## See Also

- `RotatedShape`
- `OffsetShape`
- `TransformedShape`
