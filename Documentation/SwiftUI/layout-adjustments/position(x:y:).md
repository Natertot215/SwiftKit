---
url: https://developer.apple.com/documentation/swiftui/view/position(x:y:)
framework: SwiftUI
category: Layout adjustments
title: position(x:y:)
kind: method
captured: 2026-05-02
---

# position(x:y:)

Positions the center of this view at the specified coordinates in its parent’s coordinate space.

## Declaration

```swift
nonisolated func position(x: CGFloat = 0, y: CGFloat = 0) -> some View

```

### Return Value

A view that fixes the center of this view at `x` and `y`.

### Discussion

Use the `position(x:y:)` modifier to place the center of a view at a specific coordinate in the parent view using an `x` and `y` offset.

```swift
Text("Position by passing the x and y coordinates")
    .position(x: 175, y: 100)
    .border(Color.gray)
```

## Parameters

- **x**: The x-coordinate at which to place the center of this view.
- **y**: The y-coordinate at which to place the center of this view.





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
- `position(_:)`
- `offset(_:)`
- `offset(x:y:)`
- `offset(z:)`
