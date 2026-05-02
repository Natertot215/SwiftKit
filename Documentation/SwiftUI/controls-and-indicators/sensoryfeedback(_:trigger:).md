---
url: https://developer.apple.com/documentation/swiftui/view/sensoryfeedback(_:trigger:)
framework: SwiftUI
category: Controls and indicators
title: sensoryFeedback(_:trigger:)
kind: method
captured: 2026-05-02
---

# sensoryFeedback(_:trigger:)

Plays the specified `feedback` when the provided `trigger` value changes.

## Declaration

```swift
nonisolated func sensoryFeedback<T>(_ feedback: SensoryFeedback, trigger: T) -> some View where T : Equatable

```

### Discussion

For example, you could play feedback when a state value changes:

```swift
struct MyView: View {
    @State private var showAccessory = false

    var body: some View {
        ContentView()
            .sensoryFeedback(.selection, trigger: showAccessory)
            .onLongPressGesture {
                showAccessory.toggle()
            }

        if showAccessory {
            AccessoryView()
        }
    }
}
```

## Parameters

- **feedback**: Which type of feedback to play.
- **trigger**: A value to monitor for changes to determine when to play.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 26.0
- watchOS 10.0



## See Also

- `sensoryFeedback(trigger:_:)`
- `sensoryFeedback(_:trigger:condition:)`
- `SensoryFeedback`
