---
url: https://developer.apple.com/documentation/swiftui/view/scaleeffect(x:y:anchor:)
framework: SwiftUI
category: Drawing and graphics
title: scaleEffect(x:y:anchor:)
kind: method
captured: 2026-05-02
---

# scaleEffect(x:y:anchor:)

Scales this view’s rendered output by the given horizontal and vertical amounts, relative to an anchor point.

## Declaration

```swift
nonisolated func scaleEffect(x: CGFloat = 1.0, y: CGFloat = 1.0, anchor: UnitPoint = .center) -> some View

```

### Discussion

Use `scaleEffect(x:y:anchor:)` to apply a scaling transform to a view by a specific horizontal and vertical amount.

```swift
Image(systemName: "envelope.badge.fill")
    .resizable()
    .frame(width: 100, height: 100, alignment: .center)
    .foregroundColor(Color.red)
    .scaleEffect(x: 0.5, y: 0.5, anchor: .bottomTrailing)
    .border(Color.gray)
```

## Parameters

- **x**: An amount that represents the horizontal amount to scale the view. The default value is `1.0`.
- **y**: An amount that represents the vertical amount to scale the view. The default value is `1.0`.
- **anchor**: The anchor point that indicates the starting position for the scale operation.





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
