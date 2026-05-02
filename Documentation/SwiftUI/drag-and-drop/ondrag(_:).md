---
url: https://developer.apple.com/documentation/swiftui/view/ondrag(_:)
framework: SwiftUI
category: Drag and drop
title: onDrag(_:)
kind: method
captured: 2026-05-02
---

# onDrag(_:)

Activates this view as the source of a drag and drop operation.

## Declaration

```swift
nonisolated func onDrag(_ data: @escaping () -> NSItemProvider) -> some View

```

### Return Value

A view that activates this view as the source of a drag and drop operation, beginning with user gesture input.

### Discussion

Applying the `onDrag(_:)` modifier adds the appropriate gestures for drag and drop to this view. When a drag operation begins, a rendering of this view is generated and used as the preview image.

To customize the default preview, apply a `View/contentShape(_:_:eoFill:)` with a `ContentShapeKinds/dragPreview` kind. For example, you can change the preview’s corner radius or use a nested view as the preview.

If you want to show a different preview, you can use `View/onDrag(_:preview:)`.

## Parameters

- **data**: A closure that returns a single `NSItemProvider` that represents the draggable data from this view.





## Availability

- iOS 13.4
- iPadOS 13.4
- Mac Catalyst 13.4
- macOS 10.15
- visionOS 1.0



## See Also

- `itemProvider(_:)`
- `onDrag(_:preview:)`
- `onDrop(of:isTargeted:perform:)`
- `onDrop(of:delegate:)`
- `DropDelegate`
- `DropProposal`
- `DropOperation`
- `DropInfo`
