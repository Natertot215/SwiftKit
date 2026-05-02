---
url: https://developer.apple.com/documentation/swiftui/dropdelegate
framework: SwiftUI
category: Drag and drop
title: DropDelegate
kind: protocol
captured: 2026-05-02
---

# DropDelegate

An interface that you implement to interact with a drop operation in a view modified to accept drops.

## Declaration

```swift
@MainActor @preconcurrency protocol DropDelegate
```

### Overview

The `DropDelegate` protocol provides a comprehensive and flexible way to interact with a drop operation. Specify a drop delegate when you modify a view to accept drops with the `View/onDrop(of:delegate:)` method.

Alternatively, for simple drop cases that don’t require the full functionality of a drop delegate, you can modify a view to accept drops using the `View/onDrop(of:isTargeted:perform:)` method. This method handles the drop using a closure you provide as part of the modifier.







## Availability

- iOS 13.4
- iPadOS 13.4
- Mac Catalyst 13.4
- macOS 10.15
- visionOS 1.0

## Topics

### Receiving drop information

- `dropEntered(info:)`
- `dropExited(info:)`
- `dropUpdated(info:)`
- `validateDrop(info:)`
- `performDrop(info:)`

## See Also

- `itemProvider(_:)`
- `onDrag(_:preview:)`
- `onDrag(_:)`
- `onDrop(of:isTargeted:perform:)`
- `onDrop(of:delegate:)`
- `DropProposal`
- `DropOperation`
- `DropInfo`
