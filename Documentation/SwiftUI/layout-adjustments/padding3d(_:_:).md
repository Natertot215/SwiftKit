---
url: https://developer.apple.com/documentation/swiftui/view/padding3d(_:_:)
framework: SwiftUI
category: Layout adjustments
title: padding3D(_:_:)
kind: method
captured: 2026-05-02
---

# padding3D(_:_:)

Pads this view using the edge insets you specify.

## Declaration

```swift
nonisolated func padding3D(_ edges: Edge3D.Set = .all, _ length: CGFloat? = nil) -> some View

```

### Return Value

A view that pads this view using edge the insets you specify.

## Parameters

- **edges**: The set of edges along which to inset this view.
- **length**: The amount to inset this view on each edge. If `nil`, the amount is the system default amount.





## Availability

- visionOS 1.0



## See Also

- `padding(_:)`
- `padding(_:_:)`
- `padding3D(_:)`
- `scenePadding(_:)`
- `scenePadding(_:edges:)`
- `ScenePadding`
