---
url: https://developer.apple.com/documentation/swiftui/view/border(_:width:)
framework: SwiftUI
category: Drawing and graphics
title: border(_:width:)
kind: method
captured: 2026-05-02
---

# border(_:width:)

Adds a border to this view with the specified style and width.

## Declaration

```swift
nonisolated func border<S>(_ content: S, width: CGFloat = 1) -> some View where S : ShapeStyle

```

### Return Value

A view that adds a border with the specified style and width to this view.

### Discussion

Use this modifier to draw a border of a specified width around the view’s frame. By default, the border appears inside the bounds of this view. For example, you can add a four-point wide border covers the text:

```swift
Text("Purple border inside the view bounds.")
    .border(Color.purple, width: 4)
```

To place a border around the outside of this view, apply padding of the same width before adding the border:

```swift
Text("Purple border outside the view bounds.")
    .padding(4)
    .border(Color.purple, width: 4)
```

## Parameters

- **content**: A value that conforms to the `ShapeStyle` protocol, like a `Color` or `HierarchicalShapeStyle`, that SwiftUI uses to fill the border.
- **width**: The thickness of the border. The default is 1 pixel.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

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
- `Glass`
