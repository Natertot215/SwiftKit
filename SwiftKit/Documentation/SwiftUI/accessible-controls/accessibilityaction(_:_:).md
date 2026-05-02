---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityaction(_:_:)
framework: SwiftUI
category: Accessible controls
title: accessibilityAction(_:_:)
kind: method
captured: 2026-05-02
---

# accessibilityAction(_:_:)

Adds an accessibility action to the view. Actions allow assistive technologies, such as the VoiceOver, to interact with the view by invoking the action.

## Declaration

```swift
nonisolated func accessibilityAction(_ actionKind: AccessibilityActionKind = .default, _ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

For example, this is how a `.default` action to compose a new email could be added to a view.

```swift
var body: some View {
    ContentView()
        .accessibilityAction {
            // Handle action
        }
}
```







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `accessibilityActions(_:)`
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
