---
url: https://developer.apple.com/documentation/swiftui/view/appstoreoverlay(ispresented:configuration:)
framework: SwiftUI
category: Technology-specific views
title: appStoreOverlay(isPresented:configuration:)
kind: method
captured: 2026-05-02
---

# appStoreOverlay(isPresented:configuration:)

Presents a StoreKit overlay when a given condition is true.

## Declaration

```swift
nonisolated func appStoreOverlay(isPresented: Binding<Bool>, configuration: @escaping () -> SKOverlay.Configuration) -> some View

```

### Discussion

You use `appStoreOverlay` to display an overlay that recommends another app. The overlay enables users to instantly view the other app’s page on the App Store.

When `isPresented` is true, the system will run `configuration` to determine how to configure the overlay. The overlay will automatically be presented over the current scene.

> **NOTE:** SKOverlay.Configuration.

## Parameters

- **isPresented**: A Binding to a boolean value indicating whether the overlay should be presented.
- **configuration**: A closure providing the configuration of the overlay.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- visionOS 1.0



## See Also

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
- `storeProductsTask(for:priority:action:)`
