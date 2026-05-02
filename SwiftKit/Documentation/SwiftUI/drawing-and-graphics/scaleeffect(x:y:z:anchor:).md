---
url: https://developer.apple.com/documentation/swiftui/view/scaleeffect(x:y:z:anchor:)
framework: SwiftUI
category: Drawing and graphics
title: scaleEffect(x:y:z:anchor:)
kind: method
captured: 2026-05-02
---

# scaleEffect(x:y:z:anchor:)

Scales this view by the specified horizontal, vertical, and depth factors, relative to an anchor point.

## Declaration

```swift
nonisolated func scaleEffect(x: CGFloat = 1.0, y: CGFloat = 1.0, z: CGFloat = 1.0, anchor: UnitPoint3D = .center) -> some View

```

### Return Value

A view that scales this view by `x`,`y`, and `z`.

### Discussion

The original dimensions of the view are considered to be unchanged by scaling the contents. To change the dimensions of the view, use a modifier like `frame()` instead.

## Parameters

- **x**: The horizontal scale factor for this view.
- **y**: The vertical scale factor for this view.
- **z**: The depth scale factor for this view.
- **anchor**: The anchor point about which to scale the view. Defaults to center.





## Availability

- visionOS 1.0



## See Also

- `scaledToFill()`
- `scaledToFit()`
- `scaleEffect(_:anchor:)`
- `scaleEffect(_:anchor:)`
- `scaleEffect(x:y:anchor:)`
- `aspectRatio(_:contentMode:)`
- `rotationEffect(_:anchor:)`
- `rotation3DEffect(_:axis:anchor:anchorZ:perspective:)`
- `perspectiveRotationEffect(_:axis:anchor:anchorZ:perspective:)`
- `rotation3DEffect(_:anchor:)`
- `rotation3DEffect(_:axis:anchor:)`
- `transformEffect(_:)`
- `transform3DEffect(_:)`
- `projectionEffect(_:)`
- `ProjectionTransform`
