---
url: https://developer.apple.com/documentation/swiftui/unevenroundedrectangle
framework: SwiftUI
category: Shapes
title: UnevenRoundedRectangle
kind: struct
captured: 2026-05-02
---

# UnevenRoundedRectangle

A rectangular shape with rounded corners with different values, aligned inside the frame of the view containing it.

## Declaration

```swift
@frozen struct UnevenRoundedRectangle
```







## Relationships

**Conforms To**: `Animatable`, `Copyable`, `Escapable`, `InsettableShape`, `RoundedRectangularShape`, `Sendable`, `SendableMetatype`, `Shape`, `View`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating an uneven rounded rectangle

- `init(cornerRadii:style:)`
- `init(topLeadingRadius:bottomLeadingRadius:bottomTrailingRadius:topTrailingRadius:style:)`

### Getting the shape’s characteristics

- `cornerRadii`
- `style`

### Supporting types

- `animatableData`

## See Also

- `Rectangle`
- `RoundedRectangle`
- `RoundedCornerStyle`
- `RoundedRectangularShape`
- `RoundedRectangularShapeCorners`
- `RectangleCornerRadii`
- `RectangleCornerInsets`
- `ConcentricRectangle`
