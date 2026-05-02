---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityinputlabels(_:)
framework: SwiftUI
category: Accessible descriptions
title: accessibilityInputLabels(_:)
kind: method
captured: 2026-05-02
---

# accessibilityInputLabels(_:)

Sets alternate input labels with which users identify a view.

## Declaration

```swift
nonisolated func accessibilityInputLabels(_ inputLabelKeys: [LocalizedStringKey]) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Provide labels in descending order of importance. Voice Control and Full Keyboard Access use the input labels.

> **NOTE:** If you don’t specify any input labels, the user can still refer to the view using the accessibility label that you add with the `accessibilityLabel()` modifier.







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `accessibilityLabel(_:)`
- `accessibilityLabel(_:isEnabled:)`
- `accessibilityLabel(content:)`
- `accessibilityInputLabels(_:isEnabled:)`
- `accessibilityLabeledPair(role:id:in:)`
- `AccessibilityLabeledPairRole`
