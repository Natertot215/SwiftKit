---
url: https://developer.apple.com/documentation/swiftui/glass
framework: SwiftUI
category: Drawing and graphics
title: Glass
kind: struct
captured: 2026-05-02
---

# Glass

A structure that defines the configuration of the Liquid Glass material.

## Declaration

```swift
struct Glass
```

### Overview

You provide instances of a variant of Liquid Glass to the `View/glassEffect(_:in:)` view modifier:

```swift
Text("Hello, World!")
    .font(.title)
    .padding()
    .glassEffect()
```

You can combine Liquid Glass effects using a `GlassEffectContainer`, which supports morphing views with this effect into each other based on the geometry of their associated views.





## Relationships

**Conforms To**: `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- watchOS 26.0

## Topics

### Instance Methods

- `interactive(_:)`
- `tint(_:)`

### Type Properties

- `clear`
- `identity`
- `regular`

## See Also

- `border(_:width:)`
- `foregroundStyle(_:)`
- `foregroundStyle(_:_:)`
- `foregroundStyle(_:_:_:)`
- `backgroundStyle(_:)`
- `backgroundStyle`
- `ShapeStyle`
- `AnyShapeStyle`
- `Gradient`
- `MeshGradient`
- `AnyGradient`
- `ShadowStyle`
