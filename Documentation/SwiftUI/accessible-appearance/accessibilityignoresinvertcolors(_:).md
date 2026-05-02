---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityignoresinvertcolors(_:)
framework: SwiftUI
category: Accessible appearance
title: accessibilityIgnoresInvertColors(_:)
kind: method
captured: 2026-05-02
---

# accessibilityIgnoresInvertColors(_:)

Sets whether this view should ignore the system Smart Invert setting.

## Declaration

```swift
nonisolated func accessibilityIgnoresInvertColors(_ active: Bool = true) -> some View

```

### Discussion

Use this modifier to suppress Smart Invert in a view that shouldn’t be inverted. Or pass an `active` argument of `false` to begin following the Smart Invert setting again when it was previously disabled.

## Parameters

- **active**: A true value ignores the system Smart Invert setting. A false value follows the system setting.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `accessibilityInvertColors`
- `accessibilityDifferentiateWithoutColor`
