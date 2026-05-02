---
url: https://developer.apple.com/documentation/swiftui/view/position(_:)
framework: SwiftUI
category: Layout adjustments
title: position(_:)
kind: method
captured: 2026-05-02
---

# position(_:)

Positions the center of this view at the specified point in its parent’s coordinate space.

## Declaration

```swift
nonisolated func position(_ position: CGPoint) -> some View

```

### Return Value

A view that fixes the center of this view at `position`.

### Discussion

Use the `position(_:)` modifier to place the center of a view at a specific coordinate in the parent view using a `CGPoint` to specify the `x` and `y` offset.

```swift
Text("Position by passing a CGPoint()")
    .position(CGPoint(x: 175, y: 100))
    .border(Color.gray)
```

## Parameters

- **position**: The point at which to place the center of this view.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `Making fine adjustments to a view’s position`
- `position(x:y:)`
- `offset(_:)`
- `offset(x:y:)`
- `offset(z:)`
