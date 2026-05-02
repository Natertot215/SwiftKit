---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityrespondstouserinteraction(_:)
framework: SwiftUI
category: Accessible controls
title: accessibilityRespondsToUserInteraction(_:)
kind: method
captured: 2026-05-02
---

# accessibilityRespondsToUserInteraction(_:)

Explicitly set whether this Accessibility element responds to user interaction and would thus be interacted with by technologies such as Switch Control, Voice Control or Full Keyboard Access.

## Declaration

```swift
nonisolated func accessibilityRespondsToUserInteraction(_ respondsToUserInteraction: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

If this is not set, the value is inferred from the traits of the Accessibility element, the presence of Accessibility actions on the element, or the presence of gestures on the element or containing views.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `accessibilityRespondsToUserInteraction(_:isEnabled:)`
