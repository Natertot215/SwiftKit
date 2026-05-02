---
url: https://developer.apple.com/documentation/swiftui/view/ondrop(of:delegate:)
framework: SwiftUI
category: Drag and drop
title: onDrop(of:delegate:)
kind: method
captured: 2026-05-02
---

# onDrop(of:delegate:)

Defines the destination of a drag and drop operation using behavior controlled by the delegate that you provide.

## Declaration

```swift
nonisolated func onDrop(of supportedContentTypes: [UTType], delegate: any DropDelegate) -> some View

```

### Return Value

A view that provides a drop destination for a drag operation of the specified types.

## Parameters

- **supportedContentTypes**: The uniform type identifiers that describe the types of content this view can accept through drag and drop. If the drag and drop operation doesn’t contain any of the supported types, then this drop destination doesn’t activate and `isTargeted` doesn’t update.
- **delegate**: A type that conforms to the `DropDelegate` protocol. You have comprehensive control over drop behavior when you use a delegate.





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
- `onDrop(of:isTargeted:perform:)`
- `DropDelegate`
- `DropProposal`
- `DropOperation`
- `DropInfo`
