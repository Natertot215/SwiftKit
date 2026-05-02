---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/undomanager
framework: SwiftUI
category: Documents
title: undoManager
kind: property
captured: 2026-05-02
---

# undoManager

The undo manager used to register a view’s undo operations.

## Declaration

```swift
var undoManager: UndoManager? { get }
```

### Discussion

This value is `nil` when the environment represents a context that doesn’t support undo and redo operations. You can skip registration of an undo operation when this value is `nil`.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `ReferenceFileDocument`
- `ReferenceFileDocumentConfiguration`
