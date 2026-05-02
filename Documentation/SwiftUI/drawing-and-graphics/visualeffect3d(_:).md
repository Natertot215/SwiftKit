---
url: https://developer.apple.com/documentation/swiftui/view/visualeffect3d(_:)
framework: SwiftUI
category: Drawing and graphics
title: visualEffect3D(_:)
kind: method
captured: 2026-05-02
---

# visualEffect3D(_:)

Applies effects to this view, while providing access to layout information through a 3D geometry proxy.

## Declaration

```swift
nonisolated func visualEffect3D(_ effect: @escaping @Sendable (EmptyVisualEffect, GeometryProxy3D) -> some VisualEffect) -> some View

```

### Return Value

A view with the effect applied.

### Discussion

You return new effects by calling functions on the first argument provided to the `effect` closure. In this example, `ContentView` is offset in Z by its own depth, causing its back face to appear where the front face of the view was originally located:

```swift
ContentView()
    .visualEffect3D { content, geometryProxy in
        content.offset(z: geometryProxy.size.depth)
    }
```

## Parameters

- **effect**: A closure that returns the effect to be applied. The first argument provided to the closure is a placeholder representing this view. The second argument is a `GeometryProxy3D`.





## Availability

- visionOS 1.0



## See Also

- `visualEffect(_:)`
- `VisualEffect`
- `EmptyVisualEffect`
