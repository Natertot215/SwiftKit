---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityinputlabels(_:isenabled:)
framework: SwiftUI
category: Accessible descriptions
title: accessibilityInputLabels(_:isEnabled:)
kind: method
captured: 2026-05-02
---

# accessibilityInputLabels(_:isEnabled:)

Sets alternate input labels with which users identify a view.

## Declaration

```swift
nonisolated func accessibilityInputLabels(_ inputLabelKeys: [LocalizedStringKey], isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Provide labels in descending order of importance. Voice Control and Full Keyboard Access use the input labels.

> **NOTE:** If you don’t specify any input labels, the user can still refer to the view using the accessibility label that you add with the `accessibilityLabel()` modifier.

## Parameters

- **inputLabelKeys**: The accessibility input labels to apply.
- **isEnabled**: If true the accessibility input labels are applied; otherwise the accessibility input labels are unchanged.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `accessibilityLabel(_:)`
- `accessibilityLabel(_:isEnabled:)`
- `accessibilityLabel(content:)`
- `accessibilityInputLabels(_:)`
- `accessibilityLabeledPair(role:id:in:)`
- `AccessibilityLabeledPairRole`
