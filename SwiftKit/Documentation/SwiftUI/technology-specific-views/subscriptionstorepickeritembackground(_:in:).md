---
url: https://developer.apple.com/documentation/swiftui/view/subscriptionstorepickeritembackground(_:in:)
framework: SwiftUI
category: Technology-specific views
title: subscriptionStorePickerItemBackground(_:in:)
kind: method
captured: 2026-05-02
---

# subscriptionStorePickerItemBackground(_:in:)

Sets the background shape and style for subscription store view picker items within a view.

## Declaration

```swift
nonisolated func subscriptionStorePickerItemBackground(_ backgroundStyle: some ShapeStyle, in shape: some Shape) -> some View

```

### Discussion

Use this view modifier to customize the shape of the picker options in a subscription store view, as well as the background style.

## Parameters

- **backgroundStyle**: A `ShapeStyle` that determines the background style for the subscription store view picker items.
- **shape**: An instance of a type that conforms to `Shape` and determines the shape of the subscription store view picker items. Omit the shape parameter to use the default shape.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
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
