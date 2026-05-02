---
url: https://developer.apple.com/documentation/swiftui/view/focused(_:equals:)
framework: SwiftUI
category: Focus
title: focused(_:equals:)
kind: article
captured: 2026-05-01
---

# focused(_:equals:)

## Abstract

Modifies this view by binding its focus state to the given state value.

## Declaration

```swift
nonisolated func focused<Value>(
    _ binding: FocusState<Value>.Binding,
    equals value: Value
) -> some View where Value: Hashable
```

## Parameters

- **binding**: The state binding to register. When focus moves to the modified view, the binding sets the bound value to the corresponding match value. If a caller sets the state value programmatically to the matching value, then focus moves to the modified view. When focus leaves the modified view, the binding sets the bound value to `nil`. If a caller sets the value to `nil`, SwiftUI automatically dismisses focus.

- **value**: The value to match against when determining whether the binding should change.

## Return Value

The modified view.

## Discussion

Use this modifier to cause the view to receive focus whenever the `binding` equals the `value`. Typically, you create an enumeration of fields that may receive focus, bind an instance of this enumeration, and assign its cases to focusable views.

```swift
struct LoginForm {
    enum Field: Hashable {
        case usernameField
        case passwordField
    }

    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?

    var body: some View {
        Form {
            TextField("Username", text: $username)
                .focused($focusedField, equals: .usernameField)

            SecureField("Password", text: $password)
                .focused($focusedField, equals: .passwordField)

            Button("Sign In") {
                if username.isEmpty {
                    focusedField = .usernameField
                } else if password.isEmpty {
                    focusedField = .passwordField
                } else {
                    handleLogin(username, password)
                }
            }
        }
    }
}
```

To control focus using a Boolean, use the `focused(_:)` method instead.

## Availability

| Platform | Version |
|----------|---------|
| iOS | 15.0+ |
| iPadOS | 15.0+ |
| Mac Catalyst | 15.0+ |
| macOS | 12.0+ |
| tvOS | 15.0+ |
| visionOS | 1.0+ |
| watchOS | 8.0+ |

## See Also

- `focused(_:)` — Modifies this view by binding its focus state to the given Boolean state value
- `EnvironmentValues.isFocused` — Returns whether the nearest focusable ancestor has focus
- `FocusState` — A property wrapper type that reads and writes focus placement
- `FocusedValue` — Property wrapper for observing values from the focused view
- `FocusedValueKey` — Protocol for identifier types used with focused values
- `FocusedBinding` — Property wrapper for observing and unwrapping state bindings from focused views
- `searchFocused(_:)` and `searchFocused(_:equals:)` — Bind search field focus state
