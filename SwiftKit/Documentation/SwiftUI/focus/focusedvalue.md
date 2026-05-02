---
url: https://developer.apple.com/documentation/swiftui/focusedvalue
framework: SwiftUI
category: Focus
title: FocusedValue
kind: struct
captured: 2026-05-02
---

# FocusedValue

A property wrapper for observing values from the focused view or one of its ancestors.

## Declaration

```swift
@propertyWrapper struct FocusedValue<Value>
```

### Overview

If multiple views publish values using the same key, the wrapped property will reflect the value from the view closest to focus.





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

### Creating the value

- `init(_:)`

### Getting the value

- `wrappedValue`

## See Also

- `focused(_:equals:)`
- `focused(_:)`
- `isFocused`
- `FocusState`
- `Entry()`
- `FocusedValueKey`
- `FocusedBinding`
- `searchFocused(_:)`
- `searchFocused(_:equals:)`
