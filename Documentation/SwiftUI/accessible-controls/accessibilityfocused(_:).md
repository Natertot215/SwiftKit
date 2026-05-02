---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityfocused(_:)
framework: SwiftUI
category: Accessible controls
title: accessibilityFocused(_:)
kind: method
captured: 2026-05-02
---

# accessibilityFocused(_:)

Modifies this view by binding its accessibility element’s focus state to the given boolean state value.

## Declaration

```swift
nonisolated func accessibilityFocused(_ condition: AccessibilityFocusState<Bool>.Binding) -> some View

```

### Return Value

The modified view.

## Parameters

- **condition**: The accessibility focus state to bind. When accessibility focus moves to the accessibility element of the modified view, the focus value is set to `true`. If the value is set to `true` programmatically, then accessibility focus will move to accessibility element of the modified view. The value will be set to `false` if accessibility focus leaves the accessibility element of the modified view, and accessibility focus will be dismissed automatically if the value is set to `false` programmatically.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `accessibilityFocused(_:equals:)`
- `AccessibilityFocusState`
