---
url: https://developer.apple.com/documentation/swiftui/view/visualeffect(_:)
framework: SwiftUI
category: Drawing and graphics
title: visualEffect(_:)
kind: method
captured: 2026-05-02
---

# visualEffect(_:)

Applies effects to this view, while providing access to layout information through a geometry proxy.

## Declaration

```swift
nonisolated func visualEffect(_ effect: @escaping @Sendable (EmptyVisualEffect, GeometryProxy) -> some VisualEffect) -> some View

```

### Return Value

A view with the effect applied.

### Discussion

You return new effects by calling functions on the first argument provided to the `effect` closure. In this example, `ContentView` is offset by its own size, causing its top left corner to appear where the bottom right corner was originally located:

```swift
ContentView()
    .visualEffect { content, geometryProxy in
        content.offset(geometryProxy.size)
    }
```

## Parameters

- **effect**: A closure that returns the effect to be applied. The first argument provided to the closure is a placeholder representing this view. The second argument is a `GeometryProxy`.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `visualEffect3D(_:)`
- `VisualEffect`
- `EmptyVisualEffect`
