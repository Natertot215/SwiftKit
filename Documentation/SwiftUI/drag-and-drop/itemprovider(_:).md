---
url: https://developer.apple.com/documentation/swiftui/view/itemprovider(_:)
framework: SwiftUI
category: Drag and drop
title: itemProvider(_:)
kind: method
captured: 2026-05-02
---

# itemProvider(_:)

Provides a closure that vends the drag representation to be used for a particular data element.

## Declaration

```swift
nonisolated func itemProvider(_ action: Optional<() -> NSItemProvider?>) -> some View

```









## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `onDrag(_:preview:)`
- `onDrag(_:)`
- `onDrop(of:isTargeted:perform:)`
- `onDrop(of:delegate:)`
- `DropDelegate`
- `DropProposal`
- `DropOperation`
- `DropInfo`
