---
url: https://developer.apple.com/documentation/swiftui/view/accessibilitylabel(content:)
framework: SwiftUI
category: Accessible descriptions
title: accessibilityLabel(content:)
kind: method
captured: 2026-05-02
---

# accessibilityLabel(content:)

Adds a label to the view that describes its contents.

## Declaration

```swift
nonisolated func accessibilityLabel<V>(@ViewBuilder content: (PlaceholderContentView<Self>) -> V) -> some View where V : View

```

### Discussion

Use this method to append content to the accessibility label for a view. For example, you could use this method to label a badge or alert that is custom drawn without removing the existing accessibility label.

## Parameters

- **content**: A view builder closure that takes a proxy value representing the modified view. You can combine the modified view with other content to create a new accessibility label for the original view.





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
- `accessibilityInputLabels(_:)`
- `accessibilityInputLabels(_:isEnabled:)`
- `accessibilityLabeledPair(role:id:in:)`
- `AccessibilityLabeledPairRole`
