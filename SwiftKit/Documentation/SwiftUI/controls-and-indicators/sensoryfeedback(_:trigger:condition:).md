---
url: https://developer.apple.com/documentation/swiftui/view/sensoryfeedback(_:trigger:condition:)
framework: SwiftUI
category: Controls and indicators
title: sensoryFeedback(_:trigger:condition:)
kind: method
captured: 2026-05-02
---

# sensoryFeedback(_:trigger:condition:)

Plays the specified `feedback` when the provided `trigger` value changes and the `condition` closure returns `true`.

## Declaration

```swift
nonisolated func sensoryFeedback<T>(_ feedback: SensoryFeedback, trigger: T, condition: @escaping (T, T) -> Bool) -> some View where T : Equatable

```

### Discussion

For example, you could play feedback for certain state transitions:

```swift
struct MyView: View {
    @State private var phase = Phase.inactive

    var body: some View {
        ContentView(phase: $phase)
            .sensoryFeedback(.selection, trigger: phase) { old, new in
                old == .inactive || new == .expanded
            }
    }

    enum Phase {
        case inactive
        case preparing
        case active
        case expanded
    }
}
```

When the value changes, the new version of the closure will be called, so any captured values will have their values from the time that the observed value has its new value.

## Parameters

- **feedback**: Which type of feedback to play.
- **trigger**: A value to monitor for changes to determine when to play.
- **condition**: A closure to determine whether to play the feedback when `trigger` changes.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 26.0
- watchOS 10.0



## See Also

- `sensoryFeedback(_:trigger:)`
- `sensoryFeedback(trigger:_:)`
- `SensoryFeedback`
