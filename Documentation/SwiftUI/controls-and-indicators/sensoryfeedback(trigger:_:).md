---
url: https://developer.apple.com/documentation/swiftui/view/sensoryfeedback(trigger:_:)
framework: SwiftUI
category: Controls and indicators
title: sensoryFeedback(trigger:_:)
kind: method
captured: 2026-05-02
---

# sensoryFeedback(trigger:_:)

Plays feedback when returned from the `feedback` closure after the provided `trigger` value changes.

## Declaration

```swift
nonisolated func sensoryFeedback<T>(trigger: T, _ feedback: @escaping () -> SensoryFeedback?) -> some View where T : Equatable

```

### Discussion

For example, you could play different feedback for different state transitions:

```swift
struct MyView: View {
    @State private var isExpanded = false

    var body: some View {
        ContentView(isExpanded: $isExpanded)
            .sensoryFeedback(trigger: isExpanded) {
                isExpanded ? .impact : nil
            }
    }
}
```

When the value changes, the new version of the closure will be called, so any captured values will have their values from the time that the observed value has its new value.

## Parameters

- **trigger**: A value to monitor for changes to determine when to play.
- **feedback**: A closure to determine whether to play the feedback and what type of feedback to play when `trigger` changes.





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
- `sensoryFeedback(_:trigger:condition:)`
- `SensoryFeedback`
