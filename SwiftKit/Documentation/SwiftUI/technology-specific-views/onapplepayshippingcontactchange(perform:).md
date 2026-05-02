---
url: https://developer.apple.com/documentation/swiftui/view/onapplepayshippingcontactchange(perform:)
framework: SwiftUI
category: Technology-specific views
title: onApplePayShippingContactChange(perform:)
kind: method
captured: 2026-05-02
---

# onApplePayShippingContactChange(perform:)

Called when a user selected a shipping address. This is required if the user is being asked to provide a shipping contact.

## Declaration

```swift
nonisolated func onApplePayShippingContactChange(perform action: @escaping (PKContact) async -> PKPaymentRequestShippingContactUpdate) -> some View

```

### Return Value

An update to the payment request shipping methods.







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
- `onApplePayShippingMethodChange(perform:)`
- `payLaterViewAction(_:)`
- `payLaterViewDisplayStyle(_:)`
- `payWithApplePayButtonStyle(_:)`
- `verifyIdentityWithWalletButtonStyle(_:)`
- `AsyncShareablePassConfiguration`
- `transactionTask(_:action:)`
