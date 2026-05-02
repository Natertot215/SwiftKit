---
url: https://developer.apple.com/documentation/swiftui/view/subscriptionstorepolicydestination(for:destination:)
framework: SwiftUI
category: Technology-specific views
title: subscriptionStorePolicyDestination(for:destination:)
kind: method
captured: 2026-05-02
---

# subscriptionStorePolicyDestination(for:destination:)

Configures a view as the destination for a policy button action in subscription store views.

## Declaration

```swift
nonisolated func subscriptionStorePolicyDestination(for button: SubscriptionStorePolicyKind, @ViewBuilder destination: () -> some View) -> some View

```

### Discussion

Except on tvOS, you can also set a URL as the destination using `View/subscriptionStorePolicyDestination(url:for:)`. If you do not set a destination, the system will use the automatic behavior. Check the documentation for the value you provide for `button` to understand the automatic behavior.

By default, the subscription store shows the terms of service & privacy policy buttons if you set a destination for at least one policy. The policy that is not explicitly set will use the automatic behavior. You can override this behavior using the `View/storeButton(_:for:)` modifier, with `StoreButtonKind/policies` as the second parameter.

## Parameters

- **button**: The policy button to associate the URL with.
- **destination**: The view to present when someone chooses to view the policy.





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
