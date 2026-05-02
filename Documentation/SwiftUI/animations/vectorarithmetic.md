---
url: https://developer.apple.com/documentation/swiftui/vectorarithmetic
framework: SwiftUI
category: Animations
title: VectorArithmetic
kind: protocol
captured: 2026-05-02
---

# VectorArithmetic

A type that can serve as the animatable data of an animatable type.

## Declaration

```swift
protocol VectorArithmetic : AdditiveArithmetic
```

### Overview

`VectorArithmetic` extends the `AdditiveArithmetic` protocol with scalar multiplication and a way to query the vector magnitude of the value. Use this type as the `animatableData` associated type of a type that conforms to the `Animatable` protocol.





## Relationships

**Inherits From**: `AdditiveArithmetic`, `Equatable`

**Conforming Types**: `AnimatablePair`, `AnimatableValues`, `EmptyAnimatableData`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Manipulating values

- `magnitudeSquared`
- `scale(by:)`
- `scaled(by:)`
- `interpolate(towards:amount:)`
- `interpolated(towards:amount:)`

## See Also

- `Animatable`
- `AnimatableValues`
- `AnimatablePair`
- `EmptyAnimatableData`
