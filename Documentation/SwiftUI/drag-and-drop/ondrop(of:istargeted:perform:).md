---
url: https://developer.apple.com/documentation/swiftui/view/ondrop(of:istargeted:perform:)
framework: SwiftUI
category: Drag and drop
title: onDrop(of:isTargeted:perform:)
kind: method
captured: 2026-05-02
---

# onDrop(of:isTargeted:perform:)

Defines the destination of a drag-and-drop operation that handles the dropped content with a closure that you specify.

## Declaration

```swift
nonisolated func onDrop(of supportedContentTypes: [UTType], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider]) -> Bool) -> some View

```

### Return Value

A view that provides a drop destination for a drag operation of the specified types.

### Discussion

The drop destination is the same size and position as this view.

Make sure to start loading the contents of `NSItemProvider` instances within the scope of the `action` closure. Do not perform loading asynchronously on a different actor. Loading the contents may finish later, but it must start here. For security reasons, the drop receiver can access the dropped payload only before this closure returns.

## Parameters

- **supportedContentTypes**: The uniform type identifiers that describe the types of content this view can accept through drag and drop. If the drag-and-drop operation doesn’t contain any of the supported types, then this drop destination doesn’t activate and `isTargeted` doesn’t update.
- **isTargeted**: A binding that updates when a drag and drop operation enters or exits the drop target area. The binding’s value is `true` when the cursor is inside the area, and `false` when the cursor is outside.
- **action**: A closure that takes the dropped content and responds appropriately. The parameter to `action` contains the dropped items, with types specified by `supportedContentTypes`. Return `true` if the drop operation was successful; otherwise, return `false`.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0



## See Also

- `itemProvider(_:)`
- `onDrag(_:preview:)`
- `onDrag(_:)`
- `onDrop(of:delegate:)`
- `DropDelegate`
- `DropProposal`
- `DropOperation`
- `DropInfo`
