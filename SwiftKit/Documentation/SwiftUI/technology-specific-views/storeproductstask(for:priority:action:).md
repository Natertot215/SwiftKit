---
url: https://developer.apple.com/documentation/swiftui/view/storeproductstask(for:priority:action:)
framework: SwiftUI
category: Technology-specific views
title: storeProductsTask(for:priority:action:)
kind: method
captured: 2026-05-02
---

# storeProductsTask(for:priority:action:)

Declares the view as dependent on a collection of In-App Purchase products and returns a modified view.

## Declaration

```swift
nonisolated func storeProductsTask(for ids: some Collection<String> & Equatable & Sendable, priority: TaskPriority = .medium, action: @escaping (Product.CollectionTaskState) async -> ()) -> some View

```

### Discussion

Before a view modified with this method appears,  a task will start in the background to load the products from the App Store. While the view is presented, the task will call `action` whenever the products change or the task’s state changes.

## Parameters

- **ids**: The product IDs to load from the App Store. The task restarts whenever this parameter changes.
- **priority**: The task priority to use when creating the task.
- **action**: The action to perform when the task’s state changes.





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
