---
url: https://developer.apple.com/documentation/swiftui/view/containershape(_:)
framework: SwiftUI
category: Shapes
title: containerShape(_:)
kind: method
captured: 2026-05-02
---

# containerShape(_:)

Sets the container shape to use for any container relative shape or concentric rectangle within this view.

## Declaration

```swift
nonisolated func containerShape(_ shape: some RoundedRectangularShape) -> some View

```

### Discussion

The example below defines a view that shows its content with a rounded rectangle background and the same container shape. Any `ContainerRelativeShape` within the `content` matches the rounded rectangle shape from this container inset as appropriate. Any `ConcentricRectangle` within the `content` will match the corners to be concentric to the container corners.

```swift
struct PlatterContainer<Content: View> : View {
    @ViewBuilder var content: Content
    var body: some View {
        content
            .padding()
            .containerShape(shape)
            .background(shape.fill(.background))
    }
    var shape: RoundedRectangle { RoundedRectangle(cornerRadius: 20) }
}
```

> **NOTE:** `View/containerShape(_:)-qn9q`







## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- visionOS 26.0
- watchOS 26.0



## See Also

- `InsettableShape`
- `ContainerRelativeShape`
