---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/dynamictypesize
framework: SwiftUI
category: Environment values
title: dynamicTypeSize
kind: property
captured: 2026-05-02
---

# dynamicTypeSize

The current Dynamic Type size.

## Declaration

```swift
var dynamicTypeSize: DynamicTypeSize { get set }
```

### Discussion

This value changes as the user’s chosen Dynamic Type size changes. The default value is device-dependent.

When limiting the Dynamic Type size, consider if adding a large content view with `View/accessibilityShowsLargeContentViewer()` would be appropriate.

On macOS, this value cannot be changed by users and does not affect the text size.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `textScale(_:isEnabled:)`
- `dynamicTypeSize(_:)`
- `DynamicTypeSize`
- `ScaledMetric`
- `TextVariantPreference`
- `FixedTextVariant`
- `SizeDependentTextVariant`
