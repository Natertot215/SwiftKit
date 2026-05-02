---
url: https://developer.apple.com/documentation/swiftui/view/subscriptionpromotionaloffer(offer:signature:)
framework: SwiftUI
category: Technology-specific views
title: subscriptionPromotionalOffer(offer:signature:)
kind: method
captured: 2026-05-02
---

# subscriptionPromotionalOffer(offer:signature:)

Selects a promotional offer to apply to a purchase a customer makes from a subscription store view.

## Declaration

```swift
nonisolated func subscriptionPromotionalOffer(offer: @escaping (Product, Product.SubscriptionInfo) -> Product.SubscriptionOffer?, signature: @escaping (Product, Product.SubscriptionInfo, Product.SubscriptionOffer) async throws -> Product.SubscriptionOffer.Signature) -> some View

```









## Availability

- iOS 17.4 (deprecated 26.0)
- iPadOS 17.4 (deprecated 26.0)
- Mac Catalyst 17.4 (deprecated 26.0)
- macOS 14.4 (deprecated 26.0)
- tvOS 17.4 (deprecated 26.0)
- visionOS 1.1 (deprecated 26.0)
- watchOS 10.4 (deprecated 26.0)



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
