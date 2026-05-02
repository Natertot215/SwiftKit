---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityhidden(_:isenabled:)
framework: SwiftUI
category: Accessibility fundamentals
title: accessibilityHidden(_:isEnabled:)
kind: method
captured: 2026-05-02
---

# accessibilityHidden(_:isEnabled:)

Specifies whether to hide this view from system accessibility features.

## Declaration

```swift
nonisolated func accessibilityHidden(_ hidden: Bool, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```



## Parameters

- **hidden**: Whether to hide this view from accessibility features.
- **isEnabled**: If true the accessibility hidden state is applied; otherwise the accessibility hidden state is unchanged.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `accessibilityHidden(_:)`
