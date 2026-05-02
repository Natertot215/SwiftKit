---
url: https://developer.apple.com/documentation/swiftui/view/subscriptionstorebuttonlabel(_:)
framework: SwiftUI
category: Technology-specific views
title: subscriptionStoreButtonLabel(_:)
kind: method
captured: 2026-05-02
---

# subscriptionStoreButtonLabel(_:)

Configures subscription store view instances within a view to use the provided button label.

## Declaration

```swift
nonisolated func subscriptionStoreButtonLabel(_ label: SubscriptionStoreButtonLabel) -> some View

```

### Discussion

The button label is not always respected in every context. For example, if you have a subscription store that shows multiple subscribe buttons, setting `SubscriptionStoreButtonLabel/action-swift.type.property` as the button label will fall back to each subscription’s display name.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
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
