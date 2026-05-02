---
url: https://developer.apple.com/documentation/swiftui/focusstate
framework: SwiftUI
category: Focus
title: FocusState
kind: struct
captured: 2026-05-01
---

# FocusState

## Declaration

```swift
@frozen @propertyWrapper struct FocusState<Value> where Value : Hashable
```

## Abstract

A property wrapper type that can read and write a value that SwiftUI updates as the placement of focus within the scene changes.

## Overview

Use this property wrapper in conjunction with `focused(_:equals:)` and `focused(_:)` to describe views whose appearance and contents relate to the location of focus in the scene. When focus enters the modified view, the wrapped value of this property updates to match a given prototype value. Similarly, when focus leaves, the wrapped value of this property resets to `nil` or `false`. Setting the property's value programmatically has the reverse effect, causing focus to move to the view associated with the updated value.

### Example: Login Form

```swift
struct LoginForm {
    enum Field: Hashable {
        case username
        case password
    }

    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?

    var body: some View {
        Form {
            TextField("Username", text: $username)
                .focused($focusedField, equals: .username)

            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)

            Button("Sign In") {
                if username.isEmpty {
                    focusedField = .username
                } else if password.isEmpty {
                    focusedField = .password
                } else {
                    handleLogin(username, password)
                }
            }
        }
    }
}
```

### Value Requirements

To allow for cases where focus is completely absent from a view tree, the wrapped value must be either an optional or a Boolean. Set the focus binding to `false` or `nil` as appropriate to remove focus from all bound fields. You can also use this to remove focus from a `TextField` and thereby dismiss the keyboard.

### Avoid Ambiguous Focus Bindings

The same view can have multiple focus bindings. However, binding the same value to two views is ambiguous. If the user moves focus to either field, the binding updates accordingly. However, if the app programmatically sets the value, SwiftUI chooses the first candidate and emits a runtime warning, since the repeated binding is likely a programmer error.

### Nest Focusable Views

Consider the difference between `focused(_:equals:)` and `focused(_:)` with nested focusable views. The `focused(_:)` modifier sets a Boolean state to `true` both when the view itself receives focus and when any view it contains receives focus. Use `focused(_:equals:)` for more granular control over which specific view has focus.

```swift
struct ContentView: View {
    enum Focus {
        case container
        case field
    }

    @FocusState private var focused: Focus?

    var body: some View {
        VStack {
            TextField("Name", ...)
                .focused($focused, equals: .field)
        }
        .focusable()
        .focused($focused, equals: .container)
    }
}
```

## Conformance

Conforms to `DynamicProperty`

## Topics

### Creating a Focus State

- `init()`

### Inspecting the Focus State

- `projectedValue`
- `Binding`
- `wrappedValue`

## See Also

- `View.focused(_:equals:)`
- `View.focused(_:)`
- `EnvironmentValues.isFocused`
- `FocusedValue`
- `FocusedValueKey`
- `FocusedBinding`
- `View.searchFocused(_:)`
- `View.searchFocused(_:equals:)`

## Availability

- iOS 15.0+
- iPadOS 15.0+
- Mac Catalyst 15.0+
- macOS 12.0+
- tvOS 15.0+
- visionOS 1.0+
- watchOS 8.0+
