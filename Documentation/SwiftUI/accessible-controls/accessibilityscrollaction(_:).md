---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityscrollaction(_:)
framework: SwiftUI
category: Accessible controls
title: accessibilityScrollAction(_:)
kind: method
captured: 2026-05-02
---

# accessibilityScrollAction(_:)

Adds an accessibility scroll action to the view. Actions allow assistive technologies, such as the VoiceOver, to interact with the view by invoking the action.

## Declaration

```swift
nonisolated func accessibilityScrollAction(_ handler: @escaping (Edge) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

For example, this is how a scroll action to trigger a refresh could be added to a view.

```swift
var body: some View {
    ScrollView {
        ContentView()
    }
    .accessibilityScrollAction { edge in
        if edge == .top {
            // Refresh content
        }
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

- `accessibilityAction(_:_:)`
- `accessibilityActions(_:)`
- `accessibilityAction(named:_:)`
- `accessibilityAction(action:label:)`
- `accessibilityAction(intent:label:)`
- `accessibilityAction(_:intent:)`
- `accessibilityAction(named:intent:)`
- `accessibilityAdjustableAction(_:)`
- `accessibilityActions(category:_:)`
- `AccessibilityActionKind`
- `AccessibilityAdjustmentDirection`
- `AccessibilityActionCategory`
