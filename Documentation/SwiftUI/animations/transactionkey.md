---
url: https://developer.apple.com/documentation/swiftui/transactionkey
framework: SwiftUI
category: Animations
title: TransactionKey
kind: protocol
captured: 2026-05-02
---

# TransactionKey

A key for accessing values in a transaction.

## Declaration

```swift
protocol TransactionKey
```

### Overview

You can create custom transaction values by extending the `Transaction` structure with new properties. First declare a new transaction key type and specify a value for the required `TransactionKey/defaultValue` property:

```swift
private struct MyTransactionKey: TransactionKey {
    static let defaultValue = false
}
```

The Swift compiler automatically infers the associated `TransactionKey/Value` type as the type you specify for the default value. Then use the key to define a new transaction value property:

```swift
extension Transaction {
    var myCustomValue: Bool {
        get { self[MyTransactionKey.self] }
        set { self[MyTransactionKey.self] = newValue }
    }
}
```

Clients of your transaction value never use the key directly. Instead, they use the key path of your custom transaction value property. To set the transaction value for a change, wrap that change in a call to `withTransaction`:

```swift
withTransaction(\.myCustomValue, true) {
    isActive.toggle()
}
```

To use the value from inside `MyView` or one of its descendants, use the `View/transaction(_:)` view modifier:

```swift
MyView()
    .transaction { transaction in
        if transaction.myCustomValue {
            transaction.animation = .default.repeatCount(3)
        }
    }
```







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Setting a default value

- `defaultValue`
- `Value`

## See Also

- `withTransaction(_:_:)`
- `withTransaction(_:_:_:)`
- `transaction(_:)`
- `transaction(value:_:)`
- `transaction(_:body:)`
- `Transaction`
- `Entry()`
