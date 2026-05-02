---
url: https://developer.apple.com/documentation/swiftui/view/transactiontask(_:action:)
framework: SwiftUI
category: Technology-specific views
title: transactionTask(_:action:)
kind: method
captured: 2026-05-02
---

# transactionTask(_:action:)

Provides a task to perform before this view appears

## Declaration

```swift
nonisolated func transactionTask(_ configuration: CredentialTransaction.Configuration?, action: @escaping (CredentialTransaction) async -> Void) -> some View

```

### Discussion

This task provides an instance of a `CredentialTransaction` to be used to perform transactions.

A typical client should use the APIs in the following sequence:

1. `acquirePresentmentIntentAssertion()` prior to showing any proprietary payment UI
2. `relinquish()` the assertion before invoking the transaction API
3. `configuration.invalidate()` after presenting the credential
4. Optionally, `acquirePresentmentIntentAssertion()` to finish up any proprietary payment UI
5. `relinquish()` the assertion

For example:

```swift
 struct TransactionView: View {
     @State private var configuration: CredentialTransaction.Configuration?
     private var assertion: PresentmentIntentAssertion // acquirePresentmentIntentAssertion() before transitioning into this view (step 1)
     private var activeSession: CredentialSession
     private var selectedCredential: Credential

     var body: some View {
         VStack {
             Button("Perform Transaction") {
                 guard let configuration else {
                    configuration = activeSession.configuration()
                    return
                 }

                 configuration.invalidate() // step 3
                 // Optional
                 assertion = try await session.acquirePresentmentIntentAssertion() // step 4
                 // handle any proprietary UI
                 try await assertion.relinquish() // step 5
                 // Optional end
             }
             .transactionTask(configuration) { transaction in
                 do {
                     try await assertion.relinquish() // step 2
                     try await transaction.performTransaction(using: selectedCredential)
                 } catch {
                     // code to handle error
                 }
             }
         }
     }
 }
```

## Parameters

- **configuration**: A configuration containing information about the transaction task. When the task is completed or an error is encountered while performing the task, the system invalidates this configuration, and the `CredentialTransaction` is invalidated.
- **action**: A closure that will be called when `isPerformingTransaction` is `true`. It provides a `CredentialTransaction` instance that can be used to perform transactions.





## Availability

- iOS 18.1
- iPadOS 18.1
- Mac Catalyst 18.1



## See Also

- `PayWithApplePayButton`
- `AddPassToWalletButton`
- `VerifyIdentityWithWalletButton`
- `addOrderToWalletButtonStyle(_:)`
- `addPassToWalletButtonStyle(_:)`
- `onApplePayCouponCodeChange(perform:)`
- `onApplePayPaymentMethodChange(perform:)`
- `onApplePayShippingContactChange(perform:)`
- `onApplePayShippingMethodChange(perform:)`
- `payLaterViewAction(_:)`
- `payLaterViewDisplayStyle(_:)`
- `payWithApplePayButtonStyle(_:)`
- `verifyIdentityWithWalletButtonStyle(_:)`
- `AsyncShareablePassConfiguration`
