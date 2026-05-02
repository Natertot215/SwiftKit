---
url: https://developer.apple.com/documentation/swiftui/view/oncopycommand(perform:)
framework: SwiftUI
category: Clipboard
title: onCopyCommand(perform:)
kind: method
captured: 2026-05-02
---

# onCopyCommand(perform:)

Adds an action to perform in response to the system’s Copy command.

## Declaration

```swift
nonisolated func onCopyCommand(perform payloadAction: (() -> [NSItemProvider])?) -> some View

```

### Return Value

A view that triggers `action` when a system Copy command occurs.

## Parameters

- **payloadAction**: An action closure returning the `NSItemProvider` items that should be copied to the Clipboard when the Copy command is triggered. If `action` is `nil`, the Copy command is considered disabled.





## Availability

- macOS 10.15



## See Also

- `onCutCommand(perform:)`
- `onPasteCommand(of:perform:)`
- `onPasteCommand(of:validator:perform:)`
