---
url: https://developer.apple.com/documentation/swiftui/view/accessibilitysortpriority(_:)
framework: SwiftUI
category: Accessible navigation
title: accessibilitySortPriority(_:)
kind: method
captured: 2026-05-02
---

# accessibilitySortPriority(_:)

Sets the sort priority order for this view’s accessibility element, relative to other elements at the same level.

## Declaration

```swift
nonisolated func accessibilitySortPriority(_ sortPriority: Double) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
```

### Discussion

Higher numbers are sorted first. The default sort priority is zero.







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `accessibilityRotorEntry(id:in:)`
- `accessibilityLinkedGroup(id:in:)`
