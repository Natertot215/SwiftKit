---
url: https://developer.apple.com/documentation/swiftui/view/searchfocused(_:)
framework: SwiftUI
category: Focus
title: searchFocused(_:)
kind: method
captured: 2026-05-02
---

# searchFocused(_:)

Modifies this view by binding the focus state of the search field associated with the nearest searchable modifier to the given Boolean value.

## Declaration

```swift
nonisolated func searchFocused(_ binding: FocusState<Bool>.Binding) -> some View

```

### Return Value

The modified view.

### Discussion

To control focus by matching a non-boolean value, use the `View/searchFocused(_:equals:)` modifier instead.

For more information about using searchable modifiers, refer to `Adding-a-search-interface-to-your-app`.

## Parameters

- **binding**: The focus state to bind. When focus moves to the associated search field, the binding sets the bound value to `true`. If a caller sets the value to  `true` programmatically, then focus moves to the search field. When focus leaves the search field, the binding sets the value to `false`. If a caller sets the value to `false`, SwiftUI automatically dismisses focus.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- visionOS 2.0



## See Also

- `focused(_:equals:)`
- `focused(_:)`
- `isFocused`
- `FocusState`
- `FocusedValue`
- `Entry()`
- `FocusedValueKey`
- `FocusedBinding`
- `searchFocused(_:equals:)`
