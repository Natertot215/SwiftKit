---
url: https://developer.apple.com/documentation/swiftui/view/subscriptionstorepolicydestination(url:for:)
framework: SwiftUI
category: Technology-specific views
title: subscriptionStorePolicyDestination(url:for:)
kind: method
captured: 2026-05-02
---

# subscriptionStorePolicyDestination(url:for:)

Configures a URL as the destination for a policy button action in subscription store views.

## Declaration

```swift
nonisolated func subscriptionStorePolicyDestination(url: URL, for button: SubscriptionStorePolicyKind) -> some View

```

### Discussion

You can also set a view as the destination using `View/subscriptionStorePolicyDestination(for:destination:)`. If you do not set a destination, or pass `nil` for `url`, the system will use the automatic behavior. Check the documentation for the value you provide for `button` to understand the automatic behavior.

By default, the subscription store shows the terms of service & privacy policy buttons if you set a destination for at least one policy. The policy that is not explicitly set will use the automatic behavior. You can override this behavior using the `View/storeButton(_:for:)` modifier, with `StoreButtonKind/policies` as the second parameter.

## Parameters

- **url**: The URL of the web page to open when someone chooses to view the policy.
- **button**: The policy button to associate the URL with.





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
