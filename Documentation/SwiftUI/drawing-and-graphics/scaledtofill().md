---
url: https://developer.apple.com/documentation/swiftui/view/scaledtofill()
framework: SwiftUI
category: Drawing and graphics
title: scaledToFill()
kind: method
captured: 2026-05-02
---

# scaledToFill()

Scales this view to fill its parent.

## Declaration

```swift
nonisolated func scaledToFill() -> some View

```

### Return Value

A view that scales this view to fill its parent, maintaining this view’s aspect ratio.

### Discussion

Use `scaledToFill()` to scale this view to fill its parent, while maintaining the view’s aspect ratio as the view scales:

```swift
Circle()
    .fill(Color.pink)
    .scaledToFill()
    .frame(width: 300, height: 150)
    .border(Color(white: 0.75))
```

This method is equivalent to calling `View/aspectRatio(_:contentMode:)` with a `nil` aspectRatio and a content mode of `ContentMode/fill`.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

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
- `transform3DEffect(_:)`
- `projectionEffect(_:)`
- `ProjectionTransform`
