---
url: https://developer.apple.com/documentation/swiftui/view/preferredsubscriptionoffer(_:)
framework: SwiftUI
category: Technology-specific views
title: preferredSubscriptionOffer(_:)
kind: method
captured: 2026-05-02
---

# preferredSubscriptionOffer(_:)

Selects a subscription offer to apply to a purchase that a customer makes from a subscription store view, a store view, or a product view.

## Declaration

```swift
nonisolated func preferredSubscriptionOffer(_ offer: @escaping (Product, Product.SubscriptionInfo, [Product.SubscriptionOffer]) -> Product.SubscriptionOffer?) -> some View

```

### Discussion

Subscription stores within this view use the subscription offer you specify to configure the appearance of the subscription plans. `ProductView` doesn’t display the terms of a subscription offer in the UI, but you can still use this modifier to declare which offer product views within a view hierarchy apply to a purchase.

Offer preferences that use this modifier override offer preferences from ancestor views.

> **IMPORTANT:** Subscription offers in the `Product/SubscriptionInfo` object may contain offers the customer isn’t eligible for. Instead, use the eligibleOffers argument of the offer closure to select the offers to apply to the customer’s purchase.

If StoreKit determines that the customer is eligible for more than one offer, the system calls the `offer` closure before it draws the product on the subscription store view, or before the customer initiates a purchase on a store view or product view. Return the subscription offer to apply to the product, if any, to have system-provided UI reflect the discounted pricing terms under the selected offer.

If your `offer` closure returns nil, the system selects the introductory offer, if it exists, and if the customer is eligible for it.

The following code example sets the preferred subscription offer to the first offer the customer is eligible for:

```swift
import SwiftUI
import StoreKit

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct MyView: View {

    var body: some View {
        SubscriptionStoreView(groupID: groupIdentifier)
            .preferredSubscriptionOffer { product, subscription, eligibleOffers in
                // Determine the offer to use from the list of eligibleOffers.
                // This example just uses the first offer.
                return eligibleOffers.first
            }
    }
}
```

## Parameters

- **offer**: A closure that returns the subscription offer to apply to the customer’s purchase.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `appStoreOverlay(isPresented:configuration:)`
- `manageSubscriptionsSheet(isPresented:)`
- `refundRequestSheet(for:isPresented:onDismiss:)`
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
