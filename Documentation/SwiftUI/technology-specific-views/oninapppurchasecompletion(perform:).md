---
url: https://developer.apple.com/documentation/swiftui/view/oninapppurchasecompletion(perform:)
framework: SwiftUI
category: Technology-specific views
title: onInAppPurchaseCompletion(perform:)
kind: method
captured: 2026-05-02
---

# onInAppPurchaseCompletion(perform:)

Add an action to perform when a purchase initiated from a StoreKit view within this view completes.

## Declaration

```swift
nonisolated func onInAppPurchaseCompletion(perform action: ((Product, Result<Product.PurchaseResult, any Error>) async -> ())?) -> some View

```

### Discussion

By default, transactions from successful in-app store view purchases will be emitted from `Transaction.updates`. If the purchase fails with an error, an alert will be displayed. You can revert a view back to this behavior by providing `nil` for action.

Only one action will be performed for each purchase. Descendant views can override the action by using another `View/onInAppPurchaseCompletion(perform:)` modifier.

## Parameters

- **action**: The action to perform, with the product value and the purchase result provided as parameters.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `appStoreOverlay(isPresented:configuration:)`
- `manageSubscriptionsSheet(isPresented:)`
- `refundRequestSheet(for:isPresented:onDismiss:)`
- `offerCodeRedemption(isPresented:onCompletion:)`
- `musicSubscriptionOffer(isPresented:options:onLoadCompletion:)`
- `currentEntitlementTask(for:priority:action:)`
- `inAppPurchaseOptions(_:)`
- `manageSubscriptionsSheet(isPresented:subscriptionGroupID:)`
- `onInAppPurchaseStart(perform:)`
- `productIconBorder()`
- `productViewStyle(_:)`
- `productDescription(_:)`
- `storeButton(_:for:)`
- `storeProductTask(for:priority:action:)`
- `storeProductsTask(for:priority:action:)`
