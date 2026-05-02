---
url: https://developer.apple.com/documentation/swiftui/view/compositinggroup()
framework: SwiftUI
category: Drawing and graphics
title: compositingGroup()
kind: method
captured: 2026-05-02
---

# compositingGroup()

Wraps this view in a compositing group.

## Declaration

```swift
nonisolated func compositingGroup() -> some View

```

### Return Value

A view that wraps this view in a compositing group.

### Discussion

A compositing group makes compositing effects in this view’s ancestor views, such as opacity and the blend mode, take effect before this view is rendered.

Use `compositingGroup()` to apply effects to a parent view before applying effects to this view.

In the example below the `compositingGroup()` modifier separates the application of effects into stages. It applies the `View/opacity(_:)` effect to the VStack before the `blur(radius:)` effect is applied to the views inside the enclosed `ZStack`. This limits the scope of the opacity change to the outermost view.

```swift
VStack {
    ZStack {
        Text("CompositingGroup")
            .foregroundColor(.black)
            .padding(20)
            .background(Color.red)
        Text("CompositingGroup")
            .blur(radius: 2)
    }
    .font(.largeTitle)
    .compositingGroup()
    .opacity(0.9)
}
```







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `blendMode(_:)`
- `drawingGroup(opaque:colorMode:)`
- `BlendMode`
- `ColorRenderingMode`
- `CompositorContent`
- `CompositorContentBuilder`
- `AnyCompositorContent`
