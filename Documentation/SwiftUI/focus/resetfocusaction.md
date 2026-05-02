---
url: https://developer.apple.com/documentation/swiftui/resetfocusaction
framework: SwiftUI
category: Focus
title: ResetFocusAction
kind: struct
captured: 2026-05-02
---

# ResetFocusAction

An environment value that provides the ability to reevaluate default focus.

## Declaration

```swift
struct ResetFocusAction
```

### Overview

Get the `EnvironmentValues/resetFocus` environment value and call it as a function to force a default focus reevaluation at runtime.

```swift
@Namespace var mainNamespace
@Environment(\.resetFocus) var resetFocus

var body: some View {
    // ...
    resetFocus(in: mainNamespace)
    // ...
}
```







## Availability

- macOS 12.0
- tvOS 14.0
- watchOS 7.0

## Topics

### Calling the action

- `callAsFunction(in:)`

## See Also

- `resetFocus`
