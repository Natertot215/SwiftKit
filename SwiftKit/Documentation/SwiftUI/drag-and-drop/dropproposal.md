---
url: https://developer.apple.com/documentation/swiftui/dropproposal
framework: SwiftUI
category: Drag and drop
title: DropProposal
kind: struct
captured: 2026-05-02
---

# DropProposal

The behavior of a drop.

## Declaration

```swift
struct DropProposal
```







## Relationships

**Conforms To**: `Copyable`, `CustomDebugStringConvertible`, `Escapable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.4
- iPadOS 13.4
- Mac Catalyst 13.4
- macOS 10.15
- visionOS 1.0

## Topics

### Creating a drop proposal

- `init(operation:)`
- `operation`

### Initializers

- `init(withinApplication:outsideApplication:)`

### Instance Properties

- `operationOutsideApplication`

## See Also

- `itemProvider(_:)`
- `onDrag(_:preview:)`
- `onDrag(_:)`
- `onDrop(of:isTargeted:perform:)`
- `onDrop(of:delegate:)`
- `DropDelegate`
- `DropOperation`
- `DropInfo`
