---
url: https://developer.apple.com/documentation/swiftui/compositorcontent
framework: SwiftUI
category: Drawing and graphics
title: CompositorContent
kind: protocol
captured: 2026-05-02
---

# CompositorContent


## Declaration

```swift
@MainActor protocol CompositorContent
```







## Relationships

**Conforming Types**: `AnyCompositorContent`, `CompositorContentBuilder.Content`

## Availability

- macOS 26.0
- visionOS 26.0

## Topics

### Associated Types

- `Body`

### Instance Properties

- `body`

### Instance Methods

- `contentCaptureProtected(_:)`
- `onAppear(perform:)`
- `onChange(of:initial:_:)`
- `onDisappear(perform:)`
- `onImmersionChange(initial:_:)`
- `onWorldRecenter(action:)`
- `persistentSystemOverlays(_:)`
- `preferredSurroundingsEffect(_:)`
- `upperLimbVisibility(_:)`

## See Also

- `blendMode(_:)`
- `compositingGroup()`
- `drawingGroup(opaque:colorMode:)`
- `BlendMode`
- `ColorRenderingMode`
- `CompositorContentBuilder`
- `AnyCompositorContent`
