---
url: https://developer.apple.com/documentation/swiftui/view/subscriptionstorecontrolstyle(_:placement:)
framework: SwiftUI
category: Technology-specific views
title: subscriptionStoreControlStyle(_:placement:)
kind: method
captured: 2026-05-02
---

# subscriptionStoreControlStyle(_:placement:)

Sets the control style and control placement for subscription store views within a view.

## Declaration

```swift
nonisolated func subscriptionStoreControlStyle<S>(_ style: S, placement: S.Placement) -> some View where S : SubscriptionStoreControlStyle

```

### Discussion

This modifier sets the style and placement of the subscription controls in any `SubscriptionStoreView` instance within a view.

## Parameters

- **style**: The subscription store control style to use when drawing the subscription controls of `SubscriptionStoreView` instances within a view.
- **placement**: The desired region of the subscription store view for placing the subscription controls.





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
