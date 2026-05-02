---
url: https://developer.apple.com/documentation/swiftui/view/onapplepaypaymentmethodchange(perform:)
framework: SwiftUI
category: Technology-specific views
title: onApplePayPaymentMethodChange(perform:)
kind: method
captured: 2026-05-02
---

# onApplePayPaymentMethodChange(perform:)

Called when a payment method has changed and asks for an update payment request. If this modifier isn’t provided Wallet will assume the payment method is valid.

## Declaration

```swift
nonisolated func onApplePayPaymentMethodChange(perform action: @escaping (PKPaymentMethod) async -> PKPaymentRequestPaymentMethodUpdate) -> some View

```

### Return Value

An update to the payment request method.







## Availability

- iOS 15.5
- iPadOS 15.5
- Mac Catalyst 15.5
- macOS 12.5
- watchOS 8.5



## See Also

- `PayWithApplePayButton`
- `AddPassToWalletButton`
- `VerifyIdentityWithWalletButton`
- `addOrderToWalletButtonStyle(_:)`
- `addPassToWalletButtonStyle(_:)`
- `onApplePayCouponCodeChange(perform:)`
- `onApplePayShippingContactChange(perform:)`
- `onApplePayShippingMethodChange(perform:)`
- `payLaterViewAction(_:)`
- `payLaterViewDisplayStyle(_:)`
- `payWithApplePayButtonStyle(_:)`
- `verifyIdentityWithWalletButtonStyle(_:)`
- `AsyncShareablePassConfiguration`
- `transactionTask(_:action:)`
