---
url: https://developer.apple.com/documentation/swiftui/view/background(_:in:fillstyle:)
framework: SwiftUI
category: Layout fundamentals
title: background(_:in:fillStyle:)
kind: method
captured: 2026-05-02
---

# background(_:in:fillStyle:)

Sets the view’s background to an insettable shape filled with a style.

## Declaration

```swift
nonisolated func background<S, T>(_ style: S, in shape: T, fillStyle: FillStyle = FillStyle()) -> some View where S : ShapeStyle, T : InsettableShape

```

### Return Value

A view with the specified insettable shape drawn behind it.

### Discussion

Use this modifier to layer a type that conforms to the `InsettableShape` protocol — like a `Rectangle`, `Circle`, or `Capsule` — behind a view. Specify the `ShapeStyle` that’s used to fill the shape. For example, you can place a `RoundedRectangle` behind a `Label`:

```swift
Label("Flag", systemImage: "flag.fill")
    .padding()
    .background(.teal, in: RoundedRectangle(cornerRadius: 8))
```

The `ShapeStyle/teal` color fills the shape:

This modifier is a convenience method for placing a single shape behind a view. To create a background with other `View` types — or with a stack of views — use `View/background(alignment:content:)` instead. To add a `ShapeStyle` as a background, use `View/background(_:ignoresSafeAreaEdges:)`.

## Parameters

- **style**: A `ShapeStyle` that SwiftUI uses to the fill the shape that you specify.
- **shape**: An instance of a type that conforms to `InsettableShape` that SwiftUI draws behind the view.
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
- `background(in:fillStyle:)`
- `overlay(alignment:content:)`
- `overlay(_:ignoresSafeAreaEdges:)`
- `overlay(_:in:fillStyle:)`
- `backgroundMaterial`
- `containerBackground(_:for:)`
- `containerBackground(for:alignment:content:)`
- `ContainerBackgroundPlacement`
