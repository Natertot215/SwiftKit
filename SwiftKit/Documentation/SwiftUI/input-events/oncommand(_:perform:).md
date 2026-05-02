---
url: https://developer.apple.com/documentation/swiftui/view/oncommand(_:perform:)
framework: SwiftUI
category: Input events
title: onCommand(_:perform:)
kind: method
captured: 2026-05-02
---

# onCommand(_:perform:)

Adds an action to perform in response to the given selector.

## Declaration

```swift
nonisolated func onCommand(_ selector: Selector, perform action: (() -> Void)?) -> some View

```

### Return Value

A view that triggers `action` when the `command` occurs.

### Discussion

This view or one of the views it contains must be in focus in order for the action to trigger. Other actions for the same command on views *closer*closer to the view in focus take priority, potentially overriding this action.

## Parameters

- **selector**: The selector to register for `action`.
- **action**: The action to perform. If `action` is `nil`, `command` keeps its association with this view but doesn’t trigger.





## Availability

- macOS 10.15



## See Also

- `onMoveCommand(perform:)`
- `onDeleteCommand(perform:)`
- `pageCommand(value:in:step:)`
- `onExitCommand(perform:)`
- `onPlayPauseCommand(perform:)`
- `MoveCommandDirection`
