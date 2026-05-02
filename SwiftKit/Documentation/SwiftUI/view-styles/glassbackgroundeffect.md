---
url: https://developer.apple.com/documentation/swiftui/glassbackgroundeffect
framework: SwiftUI
category: View styles
title: GlassBackgroundEffect
kind: protocol
captured: 2026-05-02
---

# GlassBackgroundEffect

A specification for the appearance of a glass background.

## Declaration

```swift
protocol GlassBackgroundEffect
```







## Relationships

**Conforming Types**: `AutomaticGlassBackgroundEffect`, `FeatheredGlassBackgroundEffect`, `PlateGlassBackgroundEffect`

## Availability

- visionOS 2.4

## Topics

### Associated Types

- `Body`

### Instance Methods

- `makeBody(configuration:)`

### Type Aliases

- `GlassBackgroundEffect.Configuration`

### Type Properties

- `automatic`
- `feathered`
- `plate`

### Type Methods

- `feathered(padding:softEdgeRadius:)`

## See Also

- `glassBackgroundEffect(displayMode:)`
- `glassBackgroundEffect(in:displayMode:)`
- `GlassBackgroundDisplayMode`
- `AutomaticGlassBackgroundEffect`
- `GlassBackgroundEffectConfiguration`
- `FeatheredGlassBackgroundEffect`
- `PlateGlassBackgroundEffect`
