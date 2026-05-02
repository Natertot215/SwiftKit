---
url: https://developer.apple.com/documentation/swiftui/transformedshape
framework: SwiftUI
category: Shapes
title: TransformedShape
kind: struct
captured: 2026-05-02
---

# TransformedShape

A shape with an affine transform applied to it.

## Declaration

```swift
@frozen struct TransformedShape<Content> where Content : Shape
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

### Creating a transformed shape

- `init(shape:transform:)`

### Getting the shape’s characteristics

- `shape`
- `transform`

## See Also

- `ScaledShape`
- `RotatedShape`
- `OffsetShape`
