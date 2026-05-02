---
url: https://developer.apple.com/documentation/swiftui/view/onkeypress(phases:action:)
framework: SwiftUI
category: Input events
title: onKeyPress(phases:action:)
kind: method
captured: 2026-05-02
---

# onKeyPress(phases:action:)

Performs an action if the user presses any key on a hardware keyboard while the view has focus.

## Declaration

```swift
nonisolated func onKeyPress(phases: KeyPress.Phases = [.down, .repeat], action: @escaping (KeyPress) -> KeyPress.Result) -> some View

```

### Return Value

A modified view that binds hardware keyboard input when focused.

## Parameters

- **phases**: The key-press phases to match (`.down`, `.repeat`, and `.up`). The default value is `[.down, .repeat]`.
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
- `onKeyPress(_:phases:action:)`
- `onKeyPress(characters:phases:action:)`
- `onKeyPress(keys:phases:action:)`
- `KeyPress`
