---
url: https://developer.apple.com/documentation/swiftui/view/refundrequestsheet(for:ispresented:ondismiss:)
framework: SwiftUI
category: Technology-specific views
title: refundRequestSheet(for:isPresented:onDismiss:)
kind: method
captured: 2026-05-02
---

# refundRequestSheet(for:isPresented:onDismiss:)

Display the refund request sheet for the given transaction.

## Declaration

```swift
@preconcurrency nonisolated func refundRequestSheet(for transactionID: Transaction.ID, isPresented: Binding<Bool>, onDismiss: (@MainActor (Result<Transaction.RefundRequestStatus, Transaction.RefundRequestError>) -> ())? = nil) -> some View

```



## Parameters

- **transactionID**: The transaction ID to request a refund for.
- **isPresented**: A binding to a Boolean value that determines whether the refund request sheet is presented.
- **onDismiss**: The closure to execute when dismissing the sheet, with the result of the refund request provided as a parameter.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 14.0
- visionOS 1.0



## See Also

- `appStoreOverlay(isPresented:configuration:)`
- `manageSubscriptionsSheet(isPresented:)`
- `offerCodeRedemption(isPresented:onCompletion:)`
- `musicSubscriptionOffer(isPresented:options:onLoadCompletion:)`
- `currentEntitlementTask(for:priority:action:)`
- `inAppPurchaseOptions(_:)`
- `manageSubscriptionsSheet(isPresented:subscriptionGroupID:)`
- `onInAppPurchaseCompletion(perform:)`
- `onInAppPurchaseStart(perform:)`
- `productIconBorder()`
- `productViewStyle(_:)`
- `productDescription(_:)`
- `storeButton(_:for:)`
- `storeProductTask(for:priority:action:)`
- `storeProductsTask(for:priority:action:)`
