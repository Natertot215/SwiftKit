---
url: https://developer.apple.com/documentation/swiftui/view/currententitlementtask(for:priority:action:)
framework: SwiftUI
category: Technology-specific views
title: currentEntitlementTask(for:priority:action:)
kind: method
captured: 2026-05-02
---

# currentEntitlementTask(for:priority:action:)

Declares the view as dependent on the entitlement of an In-App Purchase product, and returns a modified view.

## Declaration

```swift
nonisolated func currentEntitlementTask(for productID: String, priority: TaskPriority = .medium, action: @escaping (EntitlementTaskState<VerificationResult<Transaction>?>) async -> ()) -> some View

```

### Discussion

Before a view modified with this method appears, a task will start in the background to get the current entitlement. While the view is presented, the task will call `action` whenever the entitlement changes or the task’s state changes.

Consumable in-app purchases will always pass `nil` to `action`. For auto-renewable subscriptions, use `subscriptionStatusTask(for:priority:action:)` to get the full status information for the subscription.

## Parameters

- **productID**: The product ID to get the entitlement for. The task restarts whenever this parameter changes.
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
