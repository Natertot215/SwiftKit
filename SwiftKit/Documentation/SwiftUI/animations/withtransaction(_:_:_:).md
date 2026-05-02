---
url: https://developer.apple.com/documentation/swiftui/withtransaction(_:_:_:)
framework: SwiftUI
category: Animations
title: withTransaction(_:_:_:)
kind: func
captured: 2026-05-02
---

# withTransaction(_:_:_:)

Executes a closure with the specified transaction key path and value and returns the result.

## Declaration

```swift
func withTransaction<R, V>(_ keyPath: WritableKeyPath<Transaction, V>, _ value: V, _ body: () throws -> R) rethrows -> R
```

### Return Value

The result of executing the closure with the specified transaction value.

## Parameters

- **keyPath**: A key path that indicates the property of the `Transaction` structure to update.
- **value**: The new value to set for the item specified by `keyPath`.
- **body**: A closure to execute.





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
- `transaction(_:)`
- `transaction(value:_:)`
- `transaction(_:body:)`
- `Transaction`
- `Entry()`
- `TransactionKey`
