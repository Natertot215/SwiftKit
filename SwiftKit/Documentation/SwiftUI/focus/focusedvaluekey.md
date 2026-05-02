---
url: https://developer.apple.com/documentation/swiftui/focusedvaluekey
framework: SwiftUI
category: Focus
title: FocusedValueKey
kind: protocol
captured: 2026-05-02
---

# FocusedValueKey

A protocol for identifier types used when publishing and observing focused values.

## Declaration

```swift
protocol FocusedValueKey
```

### Overview

Unlike `EnvironmentKey`, `FocusedValueKey` has no default value requirement, because the default value for a key is always `nil`.

Use the `Entry` macro to create custom focused values by extending `FocusedValues` with new properties:

```swift
extension FocusedValues {
    @Entry var selectedItem: Item?
}
```

Alternatively it is possible to create a focused value key by manually creating a type that conforms to this protocol:

```swift
struct SelectedItemKey: FocusedValueKey {
    typealias Value = Item
}
```

Then extend `FocusedValues` to add a computed property for your key:

```swift
extension FocusedValues {
    var selectedItem: Item? {
        get { self[SelectedItemKey.self] }
        set { self[SelectedItemKey.self] = newValue }
    }
}
```







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Specifying the value type

- `Value`

## See Also

- `focused(_:equals:)`
- `focused(_:)`
- `isFocused`
- `FocusState`
- `FocusedValue`
- `Entry()`
- `FocusedBinding`
- `searchFocused(_:)`
- `searchFocused(_:equals:)`
