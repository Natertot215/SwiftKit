---
url: https://developer.apple.com/documentation/swiftui/view/transformeffect(_:)
framework: SwiftUI
category: Drawing and graphics
title: transformEffect(_:)
kind: method
captured: 2026-05-02
---

# transformEffect(_:)

Applies an affine transformation to this view’s rendered output.

## Declaration

```swift
nonisolated func transformEffect(_ transform: CGAffineTransform) -> some View

```

### Discussion

Use `transformEffect(_:)` to rotate, scale, translate, or skew the output of the view according to the provided `CGAffineTransform`.

In the example below, the text is rotated at -30˚ on the `y` axis.

```swift
let transform = CGAffineTransform(rotationAngle: -30 * (.pi / 180))

Text("Projection effect using transforms")
    .transformEffect(transform)
    .border(Color.gray)
```

## Parameters

- **transform**: A `CGAffineTransform` to apply to the view.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `scaledToFill()`
- `scaledToFit()`
- `scaleEffect(_:anchor:)`
- `scaleEffect(_:anchor:)`
- `scaleEffect(x:y:anchor:)`
- `scaleEffect(x:y:z:anchor:)`
- `aspectRatio(_:contentMode:)`
- `rotationEffect(_:anchor:)`
- `rotation3DEffect(_:axis:anchor:anchorZ:perspective:)`
- `perspectiveRotationEffect(_:axis:anchor:anchorZ:perspective:)`
- `rotation3DEffect(_:anchor:)`
- `rotation3DEffect(_:axis:anchor:)`
- `transform3DEffect(_:)`
- `projectionEffect(_:)`
- `ProjectionTransform`
