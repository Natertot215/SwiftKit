---
url: https://developer.apple.com/documentation/swiftui/view/ondeletecommand(perform:)
framework: SwiftUI
category: Input events
title: onDeleteCommand(perform:)
kind: method
captured: 2026-05-02
---

# onDeleteCommand(perform:)

Adds an action to perform in response to the system’s Delete command, or pressing either the ⌫ (backspace) or ⌦ (forward delete) keys while the view has focus.

## Declaration

```swift
nonisolated func onDeleteCommand(perform action: (() -> Void)?) -> some View

```









## Availability

- macOS 10.15



## See Also

- `onMoveCommand(perform:)`
- `pageCommand(value:in:step:)`
- `onExitCommand(perform:)`
- `onPlayPauseCommand(perform:)`
- `onCommand(_:perform:)`
- `MoveCommandDirection`
