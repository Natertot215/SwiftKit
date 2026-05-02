---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityhint(_:)
framework: SwiftUI
category: Accessible descriptions
title: accessibilityHint(_:)
kind: method
captured: 2026-05-02
---

# accessibilityHint(_:)

Communicates to the user what happens after performing the view’s action.

## Declaration

```swift
nonisolated func accessibilityHint(_ hint: LocalizedStringResource) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Provide a hint in the form of a brief phrase, like “Purchases the item” or “Downloads the attachment”.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `accessibilityHint(_:isEnabled:)`
