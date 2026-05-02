---
url: https://developer.apple.com/documentation/swiftui/view/productviewstyle(_:)
framework: SwiftUI
category: Technology-specific views
title: productViewStyle(_:)
kind: method
captured: 2026-05-02
---

# productViewStyle(_:)

Sets the style for In-App Purchase product views within a view.

## Declaration

```swift
nonisolated func productViewStyle(_ style: some ProductViewStyle) -> some View

```

### Discussion

This modifier styles any `ProductView` or `StoreView` instances within a view.

## Parameters

- **style**: The style to apply to the in-app purchase product views within the view.





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
- `productDescription(_:)`
- `storeButton(_:for:)`
- `storeProductTask(for:priority:action:)`
- `storeProductsTask(for:priority:action:)`
