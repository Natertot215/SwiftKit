---
url: https://developer.apple.com/documentation/swiftui/view/onexitcommand(perform:)
framework: SwiftUI
category: Input events
title: onExitCommand(perform:)
kind: method
captured: 2026-05-02
---

# onExitCommand(perform:)

Sets up an action that triggers in response to receiving the exit command while the view has focus.

## Declaration

```swift
nonisolated func onExitCommand(perform action: (() -> Void)?) -> some View

```

### Discussion

The user generates an exit command by pressing the Menu button on tvOS, or the escape key on macOS.







## Availability

- macOS 10.15
- tvOS 13.0



## See Also

- `onMoveCommand(perform:)`
- `onDeleteCommand(perform:)`
- `pageCommand(value:in:step:)`
- `onPlayPauseCommand(perform:)`
- `onCommand(_:perform:)`
- `MoveCommandDirection`
