---
url: https://developer.apple.com/documentation/swiftui/blendmode
framework: SwiftUI
category: Drawing and graphics
title: BlendMode
kind: enum
captured: 2026-05-02
---

# BlendMode

Modes for compositing a view with overlapping content.

## Declaration

```swift
enum BlendMode
```







## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting the default

- `BlendMode.normal`

### Darkening

- `BlendMode.darken`
- `BlendMode.multiply`
- `BlendMode.colorBurn`
- `BlendMode.plusDarker`

### Lightening

- `BlendMode.lighten`
- `BlendMode.screen`
- `BlendMode.colorDodge`
- `BlendMode.plusLighter`

### Adding contrast

- `BlendMode.overlay`
- `BlendMode.softLight`
- `BlendMode.hardLight`

### Inverting

- `BlendMode.difference`
- `BlendMode.exclusion`

### Mixing color components

- `BlendMode.hue`
- `BlendMode.saturation`
- `BlendMode.color`
- `BlendMode.luminosity`

### Accessing Porter-Duff modes

- `BlendMode.sourceAtop`
- `BlendMode.destinationOver`
- `BlendMode.destinationOut`

## See Also

- `blendMode(_:)`
- `compositingGroup()`
- `drawingGroup(opaque:colorMode:)`
- `ColorRenderingMode`
- `CompositorContent`
- `CompositorContentBuilder`
- `AnyCompositorContent`
