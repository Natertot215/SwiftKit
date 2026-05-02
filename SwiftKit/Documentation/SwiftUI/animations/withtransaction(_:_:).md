---
url: https://developer.apple.com/documentation/swiftui/withtransaction(_:_:)
framework: SwiftUI
category: Animations
title: withTransaction(_:_:)
kind: func
captured: 2026-05-02
---

# withTransaction(_:_:)

Executes a closure with the specified transaction and returns the result.

## Declaration

```swift
func withTransaction<Result>(_ transaction: Transaction, _ body: () throws -> Result) rethrows -> Result
```

### Return Value

The result of executing the closure with the specified transaction.

## Parameters

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

- `withTransaction(_:_:_:)`
- `transaction(_:)`
- `transaction(value:_:)`
- `transaction(_:body:)`
- `Transaction`
- `Entry()`
- `TransactionKey`
