---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityidentifier(_:isenabled:)
framework: SwiftUI
category: Accessibility fundamentals
title: accessibilityIdentifier(_:isEnabled:)
kind: method
captured: 2026-05-02
---

# accessibilityIdentifier(_:isEnabled:)

Uses the string you specify to identify the view.

## Declaration

```swift
nonisolated func accessibilityIdentifier(_ identifier: String, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Use this value for testing. It isn’t visible to the user.

## Parameters

- **identifier**: The accessibility identifier to apply.
- **isEnabled**: If true the accessibility identifier is applied; otherwise the accessibility identifier is unchanged.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `accessibilityIdentifier(_:)`
