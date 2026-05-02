---
url: https://developer.apple.com/documentation/swiftui/view/offercoderedemption(ispresented:oncompletion:)
framework: SwiftUI
category: Technology-specific views
title: offerCodeRedemption(isPresented:onCompletion:)
kind: method
captured: 2026-05-02
---

# offerCodeRedemption(isPresented:onCompletion:)

Presents a sheet that enables customers to redeem offer codes that you configure in App Store Connect.

## Declaration

```swift
nonisolated func offerCodeRedemption(isPresented: Binding<Bool>, onCompletion: @escaping @MainActor (Result<Void, any Error>) -> Void = { _ in }) -> some View

```

### Discussion

The `View/offerCodeRedemption(isPresented:onCompletion:)` method displays a system sheet where customers can enter and redeem offer codes. If you generate offer codes in App Store Connect, call this function to enable customers to redeem the offer. To display the sheet using UIKit, see `presentOfferCodeRedeemSheet(in:)`.

> **IMPORTANT:** Set up offer codes in App Store Connect before calling this API. Customers can only redeem these offers in your app through the redemption sheet; don’t use a custom UI. For more information, see `supporting-subscription-offer-codes-in-your-app`.

The following code example shows a view that displays the offer code redemption sheet upon a button press:

```swift
import SwiftUI
import StoreKit

struct ContentView: View {
    @State private var redeemSheetIsPresented = false

    var body: some View {
        Button("Present offer code redemption sheet.") {
            redeemSheetIsPresented = true
        }
        .offerCodeRedemption(isPresented: $redeemSheetIsPresented) { result in
            // Handle result
        }
    }
}
```

When customers redeem an offer code, StoreKit emits the resulting transaction in `Transaction/updates`. Set up a transaction listener as soon as your app launches to receive new transactions while the app is running.

## Parameters

- **isPresented**: A binding to a Boolean value that determines whether the system displays the sheet. You set the Boolean value to true to cause the system to display the sheet. The system sets it to false when it dismisses the sheet.
- **onCompletion**: A closure that returns the result of the presentation. In Mac apps built with Mac Catalyst, the completion handler returns a failure with an error prior to macOS 15.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 15.0
- visionOS 1.0



## See Also

- `appStoreOverlay(isPresented:configuration:)`
- `manageSubscriptionsSheet(isPresented:)`
- `refundRequestSheet(for:isPresented:onDismiss:)`
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
