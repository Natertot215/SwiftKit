---
url: https://developer.apple.com/documentation/swiftui/view/foregroundstyle(_:_:_:)
framework: SwiftUI
category: Drawing and graphics
title: foregroundStyle(_:_:_:)
kind: method
captured: 2026-05-02
---

# foregroundStyle(_:_:_:)

Sets the primary, secondary, and tertiary levels of the foreground style.

## Declaration

```swift
nonisolated func foregroundStyle<S1, S2, S3>(_ primary: S1, _ secondary: S2, _ tertiary: S3) -> some View where S1 : ShapeStyle, S2 : ShapeStyle, S3 : ShapeStyle

```

### Return Value

A view that uses the given foreground styles.

### Discussion

SwiftUI uses these styles when rendering child views that don’t have an explicit rendering style, like images, text, shapes, and so on.

Symbol images within the view hierarchy use the `SymbolRenderingMode/palette` rendering mode when you apply this modifier, if you don’t explicitly specify another mode.

## Parameters

- **primary**: The primary color or pattern to use when filling in the foreground elements. To indicate a specific value, use `Color` or `ShapeStyle/image(_:sourceRect:scale:)`, or one of the gradient types, like `ShapeStyle/linearGradient(colors:startPoint:endPoint:)`. To set a style that’s relative to the containing view’s style, use one of the semantic styles, like `ShapeStyle/primary`.
- **secondary**: The secondary color or pattern to use when filling in the foreground elements.
- **tertiary**: The tertiary color or pattern to use when filling in the foreground elements.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `border(_:width:)`
- `foregroundStyle(_:)`
- `foregroundStyle(_:_:)`
- `backgroundStyle(_:)`
- `backgroundStyle`
- `ShapeStyle`
- `AnyShapeStyle`
- `Gradient`
- `MeshGradient`
- `AnyGradient`
- `ShadowStyle`
- `Glass`
