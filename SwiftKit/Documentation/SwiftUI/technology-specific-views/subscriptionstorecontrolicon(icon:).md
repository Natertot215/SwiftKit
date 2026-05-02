---
url: https://developer.apple.com/documentation/swiftui/view/subscriptionstorecontrolicon(icon:)
framework: SwiftUI
category: Technology-specific views
title: subscriptionStoreControlIcon(icon:)
kind: method
captured: 2026-05-02
---

# subscriptionStoreControlIcon(icon:)

Sets a view to use to decorate individual subscription options within a subscription store view.

## Declaration

```swift
nonisolated func subscriptionStoreControlIcon(@ViewBuilder icon: @escaping (Product, Product.SubscriptionInfo) -> some View) -> some View

```

### Discussion

You can adjust this view to provide a different appearance for each subscription option.

## Parameters

- **icon**: A closure that takes a `Product` and `Product/SubscriptionInfo` and returns a view.





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
- `onInAppPurchaseCompletion(perform:)`
- `onInAppPurchaseStart(perform:)`
- `productIconBorder()`
- `productViewStyle(_:)`
- `productDescription(_:)`
- `storeButton(_:for:)`
- `storeProductTask(for:priority:action:)`
