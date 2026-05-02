---
url: https://developer.apple.com/documentation/swiftui/view/subscriptionstorepolicyforegroundstyle(_:_:)
framework: SwiftUI
category: Technology-specific views
title: subscriptionStorePolicyForegroundStyle(_:_:)
kind: method
captured: 2026-05-02
---

# subscriptionStorePolicyForegroundStyle(_:_:)

Sets the primary and secondary style for the terms of service and privacy policy buttons within a subscription store view.

## Declaration

```swift
nonisolated func subscriptionStorePolicyForegroundStyle(_ primary: some ShapeStyle, _ secondary: some ShapeStyle) -> some View

```



## Parameters

- **primary**: The color or pattern to use for the terms of service and privacy policy buttons
- **secondary**: The color or pattern to use for the conjunction between the buttons in the policy section





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
