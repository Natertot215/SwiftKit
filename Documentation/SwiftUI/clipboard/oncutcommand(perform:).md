---
url: https://developer.apple.com/documentation/swiftui/view/oncutcommand(perform:)
framework: SwiftUI
category: Clipboard
title: onCutCommand(perform:)
kind: method
captured: 2026-05-02
---

# onCutCommand(perform:)

Adds an action to perform in response to the system’s Cut command.

## Declaration

```swift
nonisolated func onCutCommand(perform payloadAction: (() -> [NSItemProvider])?) -> some View

```

### Return Value

A view that triggers `action` when a system Cut command occurs.

## Parameters

- **payloadAction**: An action closure that should delete the selected data and return `NSItemProvider` items corresponding to that data, which should be written to the Clipboard. If `action` is `nil`, the Cut command is considered disabled.





## Availability

- macOS 10.15



## See Also

- `onCopyCommand(perform:)`
- `onPasteCommand(of:perform:)`
- `onPasteCommand(of:validator:perform:)`
