---
url: https://developer.apple.com/documentation/swiftui/dropoperation
framework: SwiftUI
category: Drag and drop
title: DropOperation
kind: enum
captured: 2026-05-02
---

# DropOperation

Operation types that determine how a drag and drop session resolves when the user drops a drag item.

## Declaration

```swift
enum DropOperation
```







## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.4
- iPadOS 13.4
- Mac Catalyst 13.4
- macOS 10.15
- visionOS 1.0

## Topics

### Getting operation types

- `DropOperation.cancel`
- `DropOperation.copy`
- `DropOperation.forbidden`
- `DropOperation.move`

### Structures

- `DropOperation.Set`

### Enumeration Cases

- `DropOperation.alias`
- `DropOperation.delete`

## See Also

- `itemProvider(_:)`
- `onDrag(_:preview:)`
- `onDrag(_:)`
- `onDrop(of:isTargeted:perform:)`
- `onDrop(of:delegate:)`
- `DropDelegate`
- `DropProposal`
- `DropInfo`
