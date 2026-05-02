---
url: https://developer.apple.com/documentation/swiftui/view/subscriptionstoresigninaction(_:)
framework: SwiftUI
category: Technology-specific views
title: subscriptionStoreSignInAction(_:)
kind: method
captured: 2026-05-02
---

# subscriptionStoreSignInAction(_:)

Adds an action to perform when a person uses the sign-in button on a subscription store view within a view.

## Declaration

```swift
nonisolated func subscriptionStoreSignInAction(_ action: (() -> ())?) -> some View

```

### Discussion

You can only have one sign in action for a view. If an ancestor view specifies a sign in action, using this modifier will replace the ancestor’s sign in action.

If the value is `nil`, subscription stores will never show a sign in button. You can also hide the sign in button without removing the action by using the `View/storeButton(_:for:)` modifier, providing `StoreButtonKind/signIn` as the button kind.

## Parameters

- **action**: The action to perform. Pass `nil` to remove the sign in action for subscription stores within this view. The default value is `nil`.





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
