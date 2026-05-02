---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityvalue(_:)
framework: SwiftUI
category: Accessibility fundamentals
title: accessibilityValue(_:)
kind: method
captured: 2026-05-02
---

# accessibilityValue(_:)

Adds a textual description of the value that the view contains.

## Declaration

```swift
nonisolated func accessibilityValue(_ valueDescription: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Use this method to describe the value represented by a view, but only if that’s different than the view’s label. For example, for a slider that you label as “Volume” using accessibilityLabel(), you can provide the current volume setting, like “60%”, using accessibilityValue().







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `accessibilityValue(_:isEnabled:)`
