---
url: https://developer.apple.com/documentation/swiftui/view/inapppurchaseoptions(_:)
framework: SwiftUI
category: Technology-specific views
title: inAppPurchaseOptions(_:)
kind: method
captured: 2026-05-02
---

# inAppPurchaseOptions(_:)

Add a function to call before initiating a purchase from StoreKit view within this view, providing a set of options for the purchase.

## Declaration

```swift
nonisolated func inAppPurchaseOptions(_ options: ((Product) async -> Set<Product.PurchaseOption>)?) -> some View

```

### Discussion

In-app stores within this view will add any default purchase options to the set you return, and use the result for configuring the purchase. If you just want to react to in-app purchases beginning without adding purchase options, you can add an action with `View/onInAppPurchaseStart(perform:)`.

You can remove any options ancestor views may have added by providing `nil` for the action. This will result in using the default set of purchase options.

## Parameters

- **options**: The system calls this function before processing a purchase, with the product to  be purchased is provided as a parameter. Return a set of purchase options to add to the purchase.





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
- `manageSubscriptionsSheet(isPresented:subscriptionGroupID:)`
- `onInAppPurchaseCompletion(perform:)`
- `onInAppPurchaseStart(perform:)`
- `productIconBorder()`
- `productViewStyle(_:)`
- `productDescription(_:)`
- `storeButton(_:for:)`
- `storeProductTask(for:priority:action:)`
- `storeProductsTask(for:priority:action:)`
