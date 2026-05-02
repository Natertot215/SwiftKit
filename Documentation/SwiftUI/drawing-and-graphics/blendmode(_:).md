---
url: https://developer.apple.com/documentation/swiftui/view/blendmode(_:)
framework: SwiftUI
category: Drawing and graphics
title: blendMode(_:)
kind: method
captured: 2026-05-02
---

# blendMode(_:)

Sets the blend mode for compositing this view with overlapping views.

## Declaration

```swift
nonisolated func blendMode(_ blendMode: BlendMode) -> some View

```

### Return Value

A view that applies `blendMode` to this view.

### Discussion

Use `blendMode(_:)` to combine overlapping views and use a different visual effect to produce the result. The `BlendMode` enumeration defines many possible effects.

In the example below, the two overlapping rectangles have a `BlendMode/colorBurn` effect applied, which effectively removes the non-overlapping portion of the second image:

```swift
HStack {
    Color.yellow.frame(width: 50, height: 50, alignment: .center)

    Color.red.frame(width: 50, height: 50, alignment: .center)
        .rotationEffect(.degrees(45))
        .padding(-20)
        .blendMode(.colorBurn)
}
```

## Parameters

- **blendMode**: The `BlendMode` for compositing this view.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `compositingGroup()`
- `drawingGroup(opaque:colorMode:)`
- `BlendMode`
- `ColorRenderingMode`
- `CompositorContent`
- `CompositorContentBuilder`
- `AnyCompositorContent`
