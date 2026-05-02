---
url: https://developer.apple.com/documentation/swiftui/entry()
framework: SwiftUI
category: Environment values
title: Entry()
kind: macro
captured: 2026-05-02
---

# Entry()

Creates an environment values, transaction, container values, or focused values entry.

## Declaration

```swift
@attached(accessor) @attached(peer, names: prefixed(__Key_)) macro Entry()
```

### Environment Values

Create `EnvironmentValues` entries by extending the `EnvironmentValues` structure with new properties and attaching the @Entry macro to the variable declarations:

```swift
extension EnvironmentValues {
    @Entry var myCustomValue: String = "Default value"
    @Entry var anotherCustomValue = true
}
```

### Transaction Values

Create `Transaction` entries by extending the `Transaction` structure with new properties and attaching the @Entry macro to the variable declarations:

```swift
extension Transaction {
    @Entry var myCustomValue: String = "Default value"
}
```

### Container Values

Create `ContainerValues` entries by extending the `ContainerValues` structure with new properties and attaching the @Entry macro to the variable declarations:

```swift
extension ContainerValues {
    @Entry var myCustomValue: String = "Default value"
}
```

### Focused Values

Since the default value for `FocusedValues` is always `nil`, `FocusedValues` entries cannot specify a different default value and must have an Optional type.

Create `FocusedValues` entries by extending the `FocusedValues` structure with new properties and attaching the @Entry macro to the variable declarations:

```swift
extension FocusedValues {
    @Entry var myCustomValue: String?
}
```







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `withTransaction(_:_:)`
- `withTransaction(_:_:_:)`
- `transaction(_:)`
- `transaction(value:_:)`
- `transaction(_:body:)`
- `Transaction`
- `TransactionKey`
