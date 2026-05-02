---
url: https://developer.apple.com/documentation/swiftui/compositorcontentbuilder
framework: SwiftUI
category: Drawing and graphics
title: CompositorContentBuilder
kind: struct
captured: 2026-05-02
---

# CompositorContentBuilder

A result builder for composing a collection of `CompositorContent` elements.

## Declaration

```swift
@resultBuilder struct CompositorContentBuilder
```









## Availability

- macOS 26.0
- visionOS 26.0

## Topics

### Structures

- `CompositorContentBuilder.Content`

### Type Methods

- `buildBlock(_:)`
- `buildEither(first:)`
- `buildEither(second:)`
- `buildExpression(_:)`
- `buildLimitedAvailability(_:)`

## See Also

- `blendMode(_:)`
- `compositingGroup()`
- `drawingGroup(opaque:colorMode:)`
- `BlendMode`
- `ColorRenderingMode`
- `CompositorContent`
- `AnyCompositorContent`
