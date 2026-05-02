---
url: https://developer.apple.com/documentation/swiftui/view/draggable(_:)
framework: SwiftUI
category: Drag and drop
title: draggable(_:)
kind: method
captured: 2026-05-02
---

# draggable(_:)

Activates this view as the source of a drag and drop operation.

## Declaration

```swift
nonisolated func draggable<T>(_ payload: @autoclosure @escaping () -> T) -> some View where T : Transferable

```

### Return Value

A view that activates this view as the source of a drag and drop operation, beginning with user gesture input.

### Discussion

Applying the `draggable(_:)` modifier adds the appropriate gestures for drag and drop to this view. When a drag operation begins, a rendering of this view is generated and used as the preview image.

To customize the default preview, apply a `View/contentShape(_:_:eoFill:)` with a `ContentShapeKinds/dragPreview` kind. For example, you can change the preview’s corner radius or use a nested view as the preview.

## Parameters

- **payload**: A closure that returns a single instance or a value conforming to `Transferable` that represents the draggable data from this view.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0



## See Also

- `draggable(_:preview:)`
- `dropDestination(for:action:isTargeted:)`
