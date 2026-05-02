---
url: https://developer.apple.com/documentation/swiftui/view/transactionpicker(ispresented:selection:)
framework: SwiftUI
category: Technology-specific views
title: transactionPicker(isPresented:selection:)
kind: method
captured: 2026-05-02
---

# transactionPicker(isPresented:selection:)

Presents a picker that selects a collection of transactions.

## Declaration

```swift
@MainActor @preconcurrency func transactionPicker(isPresented: Binding<Bool>, selection: Binding<[Transaction]>) -> some View

```



## Parameters

- **isPresented**: The binding to whether the transaction picker should be shown.
- **selection**: The selection of transactions from the transaction picker.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
