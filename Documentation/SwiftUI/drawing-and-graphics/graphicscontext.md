---
url: https://developer.apple.com/documentation/swiftui/graphicscontext
framework: SwiftUI
category: Drawing and graphics
title: GraphicsContext
kind: struct
captured: 2026-05-02
---

# GraphicsContext

An immediate mode drawing destination, and its current state.

## Declaration

```swift
@frozen struct GraphicsContext
```

### Overview

Use a context to execute 2D drawing primitives. For example, you can draw filled shapes using the `GraphicsContext/fill(_:with:style:)` method inside a `Canvas` view:

```swift
Canvas { context, size in
    context.fill(
        Path(ellipseIn: CGRect(origin: .zero, size: size)),
        with: .color(.green))
}
.frame(width: 300, height: 200)
```

The example above draws an ellipse that just fits inside a canvas that’s constrained to 300 points wide and 200 points tall:

In addition to outlining or filling paths, you can draw images, text, and SwiftUI views. You can also use the context to perform many common graphical operations, like adding masks, applying filters and transforms, and setting a blend mode. For example you can add a mask using the `GraphicsContext/clip(to:style:options:)` method:

```swift
let halfSize = size.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))
context.clip(to: Path(CGRect(origin: .zero, size: halfSize)))
context.fill(
    Path(ellipseIn: CGRect(origin: .zero, size: size)),
    with: .color(.green))
```

The rectangular mask hides all but one quadrant of the ellipse:

The order of operations matters. Changes that you make to the state of the context, like adding a mask or a filter, apply to later drawing operations. If you reverse the fill and clip operations in the example above, so that the fill comes first, the mask doesn’t affect the ellipse.

Each context references a particular layer in a tree of transparency layers, and also contains a full copy of the drawing state. You can modify the state of one context without affecting the state of any other, even if they refer to the same layer. For example you can draw the masked ellipse from the previous example into a copy of the main context, and then add a rectangle into the main context:

```swift
// Create a copy of the context to draw a clipped ellipse.
var maskedContext = context
let halfSize = size.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))
maskedContext.clip(to: Path(CGRect(origin: .zero, size: halfSize)))
maskedContext.fill(
    Path(ellipseIn: CGRect(origin: .zero, size: size)),
    with: .color(.green))

// Go back to the original context to draw the rectangle.
let origin = CGPoint(x: size.width / 4, y: size.height / 4)
context.fill(
    Path(CGRect(origin: origin, size: halfSize)),
    with: .color(.blue))
```

The mask doesn’t clip the rectangle because the mask isn’t part of the main context. However, both contexts draw into the same view because you created one context as a copy of the other:

The context has access to an `EnvironmentValues` instance called `GraphicsContext/environment` that’s initially copied from the environment of its enclosing view. SwiftUI uses environment values — like the display resolution and color scheme — to resolve types like `Image` and `Color` that appear in the context. You can also access values stored in the environment for your own purposes.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Drawing a path

- `stroke(_:with:lineWidth:)`
- `stroke(_:with:style:)`
- `fill(_:with:style:)`
- `GraphicsContext.Shading`
- `GraphicsContext.GradientOptions`

### Drawing images, text, and views

- `draw(_:in:)`
- `draw(_:in:style:)`
- `draw(_:at:anchor:)`

### Drawing into a new layer

- `drawLayer(content:)`

### Resolving a drawn entity

- `resolve(_:)`
- `resolveSymbol(id:)`
- `GraphicsContext.ResolvedSymbol`
- `GraphicsContext.ResolvedImage`
- `GraphicsContext.ResolvedText`

### Masking

- `clip(to:style:options:)`
- `clipToLayer(opacity:options:content:)`
- `clipBoundingRect`
- `GraphicsContext.ClipOptions`

### Setting opacity and the blend mode

- `opacity`
- `blendMode`
- `GraphicsContext.BlendMode`

### Filtering

- `addFilter(_:options:)`
- `GraphicsContext.Filter`
- `GraphicsContext.FilterOptions`
- `GraphicsContext.BlurOptions`
- `GraphicsContext.ShadowOptions`

### Applying transforms

- `scaleBy(x:y:)`
- `rotate(by:)`
- `translateBy(x:y:)`
- `concatenate(_:)`
- `transform`

### Drawing with a core graphics context

- `withCGContext(content:)`

### Accessing the environment

- `environment`

### Instance Methods

- `draw(_:options:)`

## See Also

- `Add rich graphics to your SwiftUI app`
- `Canvas`
