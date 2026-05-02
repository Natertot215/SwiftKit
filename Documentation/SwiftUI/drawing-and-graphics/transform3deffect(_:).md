---
url: https://developer.apple.com/documentation/swiftui/view/transform3deffect(_:)
framework: SwiftUI
category: Drawing and graphics
title: transform3DEffect(_:)
kind: method
captured: 2026-05-02
---

# transform3DEffect(_:)

Applies a 3D transformation to this view’s rendered output.

## Declaration

```swift
nonisolated func transform3DEffect(_ transform: AffineTransform3D) -> some View

```

### Return Value

A view that renders transformed according to the provided `transform`

#### Apply a transform about an anchor

This does not adjust the transform relative to an anchor point. Instead, apply the scale and rotation separately using `View/scaleEffect(_:anchor:)` together with `View/rotation3DEffect(_:anchor:)`.

```swift
Model3D(url: URL(string: "https://example.com/robot.usdz")!)
   .scaleEffect(transform.scale)
   .rotation3DEffect(transform.rotation ?? .identity)
   .transform3DEffect(AffineTransform3D(
       translation: transform.translation))
```

## Parameters

- **transform**: The 3D transformation to apply to the view, interpreting it as a 3D plane in space.





## Availability

- visionOS 1.0



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
- `transformEffect(_:)`
- `projectionEffect(_:)`
- `ProjectionTransform`
