---
url: https://developer.apple.com/documentation/swiftui/view/scaleeffect(_:anchor:)
framework: SwiftUI
category: Drawing and graphics
title: scaleEffect(_:anchor:)
kind: method
captured: 2026-05-02
---

# scaleEffect(_:anchor:)

Scales this view’s rendered output by the given amount in both the horizontal and vertical directions, relative to an anchor point.

## Declaration

```swift
nonisolated func scaleEffect(_ s: CGFloat, anchor: UnitPoint = .center) -> ModifiedContent<Self, _UniformScaleEffect>
```

### Discussion

Use `scaleEffect(_:anchor:)` to apply a horizontally and vertically scaling transform to a view.

```swift
Image(systemName: "envelope.badge.fill")
    .resizable()
    .frame(width: 100, height: 100, alignment: .center)
    .foregroundColor(Color.red)
    .scaleEffect(2, anchor: .leading)
    .border(Color.gray)
```

## Parameters

- **s**: The amount to scale the view in the view in both the horizontal and vertical directions.
- **anchor**: The anchor point with a default of `UnitPoint/center` that indicates the starting position for the scale operation.





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
- `scaleEffect(x:y:anchor:)`
- `scaleEffect(x:y:z:anchor:)`
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
- `ContentMode`
