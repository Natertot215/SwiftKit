---
url: https://developer.apple.com/documentation/swiftui/view/onkeypress(_:phases:action:)
framework: SwiftUI
category: Input events
title: onKeyPress(_:phases:action:)
kind: method
captured: 2026-05-02
---

# onKeyPress(_:phases:action:)

Performs an action if the user presses a key on a hardware keyboard while the view has focus.

## Declaration

```swift
nonisolated func onKeyPress(_ key: KeyEquivalent, phases: KeyPress.Phases, action: @escaping (KeyPress) -> KeyPress.Result) -> some View

```

### Return Value

A modified view that binds hardware keyboard input when focused.

### Discussion

SwiftUI performs the action for the specified event phases.

## Parameters

- **key**: The key to match against incoming hardware keyboard events.
- **phases**: The key-press phases to match (`.down`, `.up`, and `.repeat`).
- **action**: The action to perform. The action receives a value describing the matched key event. Return `.handled` to consume the event and prevent further dispatch, or `.ignored` to allow dispatch to continue.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0



## See Also

- `onKeyPress(_:action:)`
- `onKeyPress(phases:action:)`
- `onKeyPress(characters:phases:action:)`
- `onKeyPress(keys:phases:action:)`
- `KeyPress`
