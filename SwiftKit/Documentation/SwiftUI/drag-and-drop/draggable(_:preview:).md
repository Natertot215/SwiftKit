---
url: https://developer.apple.com/documentation/swiftui/view/draggable(_:preview:)
framework: SwiftUI
category: Drag and drop
title: draggable(_:preview:)
kind: method
captured: 2026-05-02
---

# draggable(_:preview:)

Activates this view as the source of a drag and drop operation.

## Declaration

```swift
nonisolated func draggable<V, T>(_ payload: @autoclosure @escaping () -> T, @ViewBuilder preview: () -> V) -> some View where V : View, T : Transferable

```

### Return Value

A view that activates this view as the source of a drag and drop operation, beginning with user gesture input.

### Discussion

Applying the `draggable(_:preview:)` modifier adds the appropriate gestures for drag and drop to this view. When a drag operation begins, a rendering of `preview` is generated and used as the preview image.

```swift
var title: String
var body: some View {
    Color.pink
        .frame(width: 400, height: 400)
        .draggable(title) {
             Text("Drop me")
         }
}
```

To customize the lift preview, shown while the system transitions to show your custom `preview`, apply a `View/contentShape(_:_:eoFill:)` with a `ContentShapeKinds/dragPreview` kind. For example, you can change the preview’s corner radius or use a nested view as the preview.

## Parameters

- **payload**: A closure that returns a single class instance or a value conforming to `Transferable` that represents the draggable data from this view.
- **preview**: A `View` to use as the source for the dragging preview, once the drag operation has begun. The preview is centered over the source view.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0



## See Also

- `draggable(_:)`
- `dropDestination(for:action:isTargeted:)`
