---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityactions(_:)
framework: SwiftUI
category: Accessible controls
title: accessibilityActions(_:)
kind: method
captured: 2026-05-02
---

# accessibilityActions(_:)

Adds multiple accessibility actions to the view.

## Declaration

```swift
nonisolated func accessibilityActions<Content>(@ViewBuilder _ content: () -> Content) -> some View where Content : View

```

### Discussion

Actions allow assistive technologies, such as the VoiceOver, to interact with the view by invoking the action. For example, this is how a dynamic number of custom action could be added to a view.

```swift
var isDraft: Bool

var body: some View {
    ContentView()
        .accessibilityActions {
            ForEach(actions) { action in
                Button {
                    action()
                } label: {
                    Text(action.title)
                }
            }

            if isDraft {
                Button {
                    // Handle Delete
                } label: {
                    Text("Delete")
                }
            }
        }
```







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `accessibilityAction(_:_:)`
- `accessibilityAction(named:_:)`
- `accessibilityAction(action:label:)`
- `accessibilityAction(intent:label:)`
- `accessibilityAction(_:intent:)`
- `accessibilityAction(named:intent:)`
- `accessibilityAdjustableAction(_:)`
- `accessibilityScrollAction(_:)`
- `accessibilityActions(category:_:)`
- `AccessibilityActionKind`
- `AccessibilityAdjustmentDirection`
- `AccessibilityActionCategory`
