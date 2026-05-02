---
url: https://developer.apple.com/documentation/swiftui/view/padding(_:)
framework: SwiftUI
category: Layout adjustments
title: padding(_:)
kind: method
captured: 2026-05-02
---

# padding(_:)

Adds a different padding amount to each edge of this view.

## Declaration

```swift
nonisolated func padding(_ insets: EdgeInsets) -> some View

```

### Return Value

A view that’s padded by different amounts on each edge.

### Discussion

Use this modifier to add a different amount of padding on each edge of a view:

```swift
VStack {
    Text("Text padded by different amounts on each edge.")
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 40, trailing: 0))
        .border(.gray)
    Text("Unpadded text for comparison.")
        .border(.yellow)
}
```

The order in which you apply modifiers matters. The example above applies the padding before applying the border to ensure that the border encompasses the padded region:

To pad a view on specific edges with equal padding for all padded edges, use `View/padding(_:_:)`. To pad all edges of a view equally, use `View/padding(_:)`.

## Parameters

- **insets**: An `EdgeInsets` instance that contains padding amounts for each edge.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `padding(_:_:)`
- `padding3D(_:)`
- `padding3D(_:_:)`
- `scenePadding(_:)`
- `scenePadding(_:edges:)`
- `ScenePadding`
