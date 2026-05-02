---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityhint(_:isenabled:)
framework: SwiftUI
category: Accessible descriptions
title: accessibilityHint(_:isEnabled:)
kind: method
captured: 2026-05-02
---

# accessibilityHint(_:isEnabled:)

Communicates to the user what happens after performing the view’s action.

## Declaration

```swift
nonisolated func accessibilityHint(_ hint: LocalizedStringResource, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Provide a hint in the form of a brief phrase, like “Purchases the item” or “Downloads the attachment”.

## Parameters

- **hint**: The accessibility hint to apply.
- **isEnabled**: If true the accessibility hint is applied; otherwise the accessibility hint is unchanged.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `accessibilityHint(_:)`
