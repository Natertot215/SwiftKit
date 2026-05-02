---
url: https://developer.apple.com/documentation/swiftui/view/storebutton(_:for:)
framework: SwiftUI
category: Technology-specific views
title: storeButton(_:for:)
kind: method
captured: 2026-05-02
---

# storeButton(_:for:)

Specifies the visibility of auxiliary buttons that store view and subscription store view instances may use.

## Declaration

```swift
nonisolated func storeButton(_ visibility: Visibility, for buttonKinds: StoreButtonKind...) -> some View

```



## Parameters

- **visibility**: The preferred visibility of the buttons.
- **buttonKinds**: The type of store button.





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
- `storeProductTask(for:priority:action:)`
- `storeProductsTask(for:priority:action:)`
