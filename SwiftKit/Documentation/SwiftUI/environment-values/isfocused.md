---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/isfocused
framework: SwiftUI
category: Environment values
title: isFocused
kind: property
captured: 2026-05-02
---

# isFocused

Returns whether the nearest focusable ancestor has focus.

## Declaration

```swift
var isFocused: Bool { get }
```

### Discussion

If there is no focusable ancestor, the value is `false`.







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `focused(_:equals:)`
- `focused(_:)`
- `FocusState`
- `FocusedValue`
- `Entry()`
- `FocusedValueKey`
- `FocusedBinding`
- `searchFocused(_:)`
- `searchFocused(_:equals:)`
