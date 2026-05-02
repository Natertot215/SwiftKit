---
url: https://developer.apple.com/documentation/swiftui/environmentalmodifier
framework: SwiftUI
category: View fundamentals
title: EnvironmentalModifier
kind: protocol
captured: 2026-05-02
---

# EnvironmentalModifier

A modifier that must resolve to a concrete modifier in an environment before use.

## Declaration

```swift
protocol EnvironmentalModifier : ViewModifier where Self.Body == Never
```







## Relationships

**Inherits From**: `ViewModifier`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Resolving a modifier

- `resolve(in:)`
- `ResolvedModifier`

## See Also

- `Configuring views`
- `Reducing view modifier maintenance`
- `modifier(_:)`
- `ViewModifier`
- `EmptyModifier`
- `ModifiedContent`
- `ManipulableModifier`
- `ManipulableResponderModifier`
- `ManipulableTransformBindingModifier`
- `ManipulationGeometryModifier`
- `ManipulationGestureModifier`
- `ManipulationUsingGestureStateModifier`
- `Manipulable`
