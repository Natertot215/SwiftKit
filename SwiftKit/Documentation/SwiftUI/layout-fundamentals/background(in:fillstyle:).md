---
url: https://developer.apple.com/documentation/swiftui/view/background(in:fillstyle:)
framework: SwiftUI
category: Layout fundamentals
title: background(in:fillStyle:)
kind: method
captured: 2026-05-02
---

# background(in:fillStyle:)

Sets the view’s background to an insettable shape filled with the default background style.

## Declaration

```swift
nonisolated func background<S>(in shape: S, fillStyle: FillStyle = FillStyle()) -> some View where S : InsettableShape

```

### Return Value

A view with the specified insettable shape drawn behind it.

### Discussion

This modifier behaves like `View/background(_:in:fillStyle:)`, except that it always uses the `ShapeStyle/background` shape style to fill the specified insettable shape. For example, you can use a `RoundedRectangle` as a background on a `Label`:

```swift
ZStack {
    Color.teal
    Label("Flag", systemImage: "flag.fill")
        .padding()
        .background(in: RoundedRectangle(cornerRadius: 8))
}
```

Without the background modifier, the fill color shows through the label. With the modifier, the label’s text and icon appear backed by a shape filled with a color that’s appropriate for light or dark appearance:

To create a background with other `View` types — or with a stack of views — use `View/background(alignment:content:)` instead. To add a `ShapeStyle` as a background, use `View/background(_:ignoresSafeAreaEdges:)`.

## Parameters

- **shape**: An instance of a type that conforms to `InsettableShape` that SwiftUI draws behind the view using the `ShapeStyle/background` shape style.
- **fillStyle**: The `FillStyle` to use when drawing the shape. The default style uses the nonzero winding number rule and antialiasing.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `Adding a background to your view`
- `ZStack`
- `zIndex(_:)`
- `background(alignment:content:)`
- `background(_:ignoresSafeAreaEdges:)`
- `background(ignoresSafeAreaEdges:)`
- `background(_:in:fillStyle:)`
- `overlay(alignment:content:)`
- `overlay(_:ignoresSafeAreaEdges:)`
- `overlay(_:in:fillStyle:)`
- `backgroundMaterial`
- `containerBackground(_:for:)`
- `containerBackground(for:alignment:content:)`
- `ContainerBackgroundPlacement`
