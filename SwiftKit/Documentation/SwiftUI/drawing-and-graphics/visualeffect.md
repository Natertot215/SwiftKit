---
url: https://developer.apple.com/documentation/swiftui/visualeffect
framework: SwiftUI
category: Drawing and graphics
title: VisualEffect
kind: protocol
captured: 2026-05-02
---

# VisualEffect

Visual Effects change the visual appearance of a view without changing its ancestors or descendents.

## Declaration

```swift
protocol VisualEffect : Sendable, Animatable
```

### Overview

Because effects do not impact layout, they are safe to use in situations where layout modification is not allowed. For example, effects may be applied as a function of position, accessed through a geometry proxy:

```swift
var body: some View {
    ContentRow()
        .visualEffect { content, geometryProxy in
            content.offset(x: geometryProxy.frame(in: .global).origin.y)
        }
}
```

You don’t conform to this protocol yourself. Instead, visual effects are created by calling modifier functions (such as `.offset(x:y:)` on other effects, as seen in the example above.





## Relationships

**Inherits From**: `Animatable`, `Sendable`, `SendableMetatype`

**Conforming Types**: `EmptyVisualEffect`, `ModifiedContent`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Adjusting Color

- `brightness(_:)`
- `colorEffect(_:isEnabled:)`
- `contrast(_:)`
- `grayscale(_:)`
- `hueRotation(_:)`
- `saturation(_:)`
- `opacity(_:)`

### Scaling

- `scaleEffect(_:anchor:)`
- `scaleEffect(x:y:anchor:)`
- `scaleEffect(x:y:z:anchor:)`

### Rotating

- `rotationEffect(_:anchor:)`
- `rotation3DEffect(_:axis:anchor:anchorZ:perspective:)`
- `perspectiveRotationEffect(_:axis:anchor:perspective:)`
- `rotation3DEffect(_:anchor:)`
- `rotation3DEffect(_:axis:anchor:)`

### Translating

- `offset(_:)`
- `offset(x:y:)`
- `offset(z:)`

### Applying a transform

- `transform3DEffect(_:)`
- `transformEffect(_:)`

### Applying other effects

- `blur(radius:opaque:)`
- `distortionEffect(_:maxSampleOffset:isEnabled:)`
- `layerEffect(_:maxSampleOffset:isEnabled:)`

### Instance Methods

- `blendMode(_:)`

## See Also

- `visualEffect(_:)`
- `visualEffect3D(_:)`
- `EmptyVisualEffect`
