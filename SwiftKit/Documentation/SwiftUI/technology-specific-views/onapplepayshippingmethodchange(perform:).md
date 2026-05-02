---
url: https://developer.apple.com/documentation/swiftui/view/onapplepayshippingmethodchange(perform:)
framework: SwiftUI
category: Technology-specific views
title: onApplePayShippingMethodChange(perform:)
kind: method
captured: 2026-05-02
---

# onApplePayShippingMethodChange(perform:)

Called when a user selected a shipping method. This is required if the user is being asked to provide a shipping method.

## Declaration

```swift
nonisolated func onApplePayShippingMethodChange(perform action: @escaping (PKShippingMethod) async -> PKPaymentRequestShippingMethodUpdate) -> some View

```

### Return Value

An update to the payment request shipping method.







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
- `onApplePayPaymentMethodChange(perform:)`
- `onApplePayShippingContactChange(perform:)`
- `payLaterViewAction(_:)`
- `payLaterViewDisplayStyle(_:)`
- `payWithApplePayButtonStyle(_:)`
- `verifyIdentityWithWalletButtonStyle(_:)`
- `AsyncShareablePassConfiguration`
- `transactionTask(_:action:)`
