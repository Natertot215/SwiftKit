---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/labelreservediconwidth
framework: SwiftUI
category: Environment values
title: labelReservedIconWidth
kind: property
captured: 2026-05-02
---

# labelReservedIconWidth

The width reserved for icons in labels.

## Declaration

```swift
var labelReservedIconWidth: CGFloat? { get }
```

### Discussion

The value that should be used for the reserved icon width in labels. To set a different value for labels, use the `labelReservedIconWidth` modifier.

This environment value can be used in custom label styles to allow changing the reserved icon width using the `labelReservedIconWidth` modifier. If the value is `nil`, a default behavior to size the icon should be used instead.







## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- visionOS 26.0
- watchOS 26.0
