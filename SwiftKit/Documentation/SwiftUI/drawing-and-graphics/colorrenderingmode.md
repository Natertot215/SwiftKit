---
url: https://developer.apple.com/documentation/swiftui/colorrenderingmode
framework: SwiftUI
category: Drawing and graphics
title: ColorRenderingMode
kind: enum
captured: 2026-05-02
---

# ColorRenderingMode

The set of possible working color spaces for color-compositing operations.

## Declaration

```swift
enum ColorRenderingMode
```

### Overview

Each color space guarantees the preservation of a particular range of color values.





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

### Getting rendering modes

- `ColorRenderingMode.extendedLinear`
- `ColorRenderingMode.linear`
- `ColorRenderingMode.nonLinear`

## See Also

- `blendMode(_:)`
- `compositingGroup()`
- `drawingGroup(opaque:colorMode:)`
- `BlendMode`
- `CompositorContent`
- `CompositorContentBuilder`
- `AnyCompositorContent`
