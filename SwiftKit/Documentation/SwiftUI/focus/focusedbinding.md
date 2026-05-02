---
url: https://developer.apple.com/documentation/swiftui/focusedbinding
framework: SwiftUI
category: Focus
title: FocusedBinding
kind: struct
captured: 2026-05-02
---

# FocusedBinding

A convenience property wrapper for observing and automatically unwrapping state bindings from the focused view or one of its ancestors.

## Declaration

```swift
@propertyWrapper struct FocusedBinding<Value>
```

### Overview

If multiple views publish bindings using the same key, the wrapped property will reflect the value of the binding from the view closest to focus.





## Relationships

**Conforms To**: `DynamicProperty`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Creating the binding

- `init(_:)`

### Getting the value

- `projectedValue`
- `wrappedValue`

## See Also

- `focused(_:equals:)`
- `focused(_:)`
- `isFocused`
- `FocusState`
- `FocusedValue`
- `Entry()`
- `FocusedValueKey`
- `searchFocused(_:)`
- `searchFocused(_:equals:)`
