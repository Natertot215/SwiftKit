---
url: https://developer.apple.com/documentation/swiftui/view/onmovecommand(perform:)
framework: SwiftUI
category: Input events
title: onMoveCommand(perform:)
kind: method
captured: 2026-05-02
---

# onMoveCommand(perform:)

Adds an action to perform in response to a move command, like when the user presses an arrow key on a Mac keyboard, or taps the edge of the Siri Remote when controlling an Apple TV.

## Declaration

```swift
nonisolated func onMoveCommand(perform action: ((MoveCommandDirection) -> Void)?) -> some View

```









## Availability

- macOS 10.15
- tvOS 13.0



## See Also

- `onDeleteCommand(perform:)`
- `pageCommand(value:in:step:)`
- `onExitCommand(perform:)`
- `onPlayPauseCommand(perform:)`
- `onCommand(_:perform:)`
- `MoveCommandDirection`
