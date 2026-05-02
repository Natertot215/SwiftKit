---
url: https://developer.apple.com/documentation/swiftui/animatablepair
framework: SwiftUI
category: Animations
title: AnimatablePair
kind: struct
captured: 2026-05-02
---

# AnimatablePair

A pair of animatable values, which is itself animatable.

## Declaration

```swift
@frozen struct AnimatablePair<First, Second> where First : VectorArithmetic, Second : VectorArithmetic
```







## Relationships

**Conforms To**: `AdditiveArithmetic`, `Equatable`, `Sendable`, `SendableMetatype`, `VectorArithmetic`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating an animatable pair

- `init(_:_:)`

### Getting the constituent animations

- `first`
- `second`

### Manipulating values

- `magnitudeSquared`

## See Also

- `Animatable`
- `AnimatableValues`
- `VectorArithmetic`
- `EmptyAnimatableData`
