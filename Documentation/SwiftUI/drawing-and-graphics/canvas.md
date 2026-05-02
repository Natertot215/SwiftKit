---
url: https://developer.apple.com/documentation/swiftui/canvas
framework: SwiftUI
category: Drawing and graphics
title: Canvas
kind: struct
captured: 2026-05-02
---

# Canvas

A view type that supports immediate mode drawing.

## Declaration

```swift
struct Canvas<Symbols> where Symbols : View
```

### Overview

Use a canvas to draw rich and dynamic 2D graphics inside a SwiftUI view. The canvas passes a `GraphicsContext` to the closure that you use to perform immediate mode drawing operations. The canvas also passes a `CGSize` value that you can use to customize what you draw. For example, you can use the context’s `GraphicsContext/stroke(_:with:lineWidth:)` command to draw a `Path` instance:

```swift
Canvas { context, size in
    context.stroke(
        Path(ellipseIn: CGRect(origin: .zero, size: size)),
        with: .color(.green),
        lineWidth: 4)
}
.frame(width: 300, height: 200)
.border(Color.blue)
```

The example above draws the outline of an ellipse that exactly inscribes a canvas with a blue border:

In addition to outlined and filled paths, you can draw images, text, and complete SwiftUI views. To draw views, use the `Canvas/init(opaque:colorMode:rendersAsynchronously:renderer:symbols:)` method to supply views that you can reference from inside the renderer. You can also add masks, apply filters, perform transforms, control blending, and more. For information about how to draw, see `GraphicsContext`.

A canvas doesn’t offer interactivity or accessibility for individual elements, including for views that you pass in as symbols. However, it might provide better performance for a complex drawing that involves dynamic data. Use a canvas to improve performance for a drawing that doesn’t primarily involve text or require interactive elements.





## Relationships

**Conforms To**: `Copyable`, `Escapable`, `View`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Creating a canvas

- `init(opaque:colorMode:rendersAsynchronously:renderer:)`
- `init(opaque:colorMode:rendersAsynchronously:renderer:symbols:)`

### Managing opacity and color

- `isOpaque`
- `colorMode`

### Referencing symbols

- `symbols`

### Rendering

- `rendersAsynchronously`
- `renderer`

## See Also

- `Add rich graphics to your SwiftUI app`
- `GraphicsContext`
