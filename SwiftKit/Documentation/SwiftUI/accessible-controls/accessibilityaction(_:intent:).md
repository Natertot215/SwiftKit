---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityaction(_:intent:)
framework: SwiftUI
category: Accessible controls
title: accessibilityAction(_:intent:)
kind: method
captured: 2026-05-02
---

# accessibilityAction(_:intent:)

Adds an accessibility action representing `actionKind` to the view. Actions allow assistive technologies, such as the VoiceOver, to interact with the view by invoking the action. When the action is performed, the `intent` will be invoked.

## Declaration

```swift
nonisolated func accessibilityAction<I>(_ actionKind: AccessibilityActionKind = .default, intent: I) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where I : AppIntent
```









## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `accessibilityAction(_:_:)`
- `accessibilityActions(_:)`
- `accessibilityAction(named:_:)`
- `accessibilityAction(action:label:)`
- `accessibilityAction(intent:label:)`
- `accessibilityAction(named:intent:)`
- `accessibilityAdjustableAction(_:)`
- `accessibilityScrollAction(_:)`
- `accessibilityActions(category:_:)`
- `AccessibilityActionKind`
- `AccessibilityAdjustmentDirection`
- `AccessibilityActionCategory`
