---
url: https://developer.apple.com/documentation/swiftui/view/searchfocused(_:equals:)
framework: SwiftUI
category: Focus
title: searchFocused(_:equals:)
kind: method
captured: 2026-05-02
---

# searchFocused(_:equals:)

Modifies this view by binding the focus state of the search field associated with the nearest searchable modifier to the given value.

## Declaration

```swift
nonisolated func searchFocused<V>(_ binding: FocusState<V>.Binding, equals value: V) -> some View where V : Hashable

```

### Return Value

The modified view.

### Discussion

To control focus by matching a simple boolean condition, use the `View/searchFocused(_:)` modifier instead.

For more information about using searchable modifiers, refer to `Adding-a-search-interface-to-your-app`.

## Parameters

- **binding**: The state binding to register. When focus moves to the associated search field, the binding sets the bound value to the corresponding match value. If a caller sets the state value programmatically to the matching value, then focus moves to the search field. When focus leaves the search field, the binding sets the bound value to `nil`. If a caller sets the value to `nil`, SwiftUI automatically dismisses focus.
- **value**: The value to match against when determining whether the binding should change.





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
- `searchFocused(_:)`
