---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/purchase
framework: SwiftUI
category: Environment values
title: purchase
kind: property
captured: 2026-05-02
---

# purchase

An action that starts an in-app purchase.

## Declaration

```swift
@MainActor @preconcurrency var purchase: PurchaseAction { get }
```

### Discussion

Read this environment value to get an `PurchaseAction` instance for a given `Environment`. Call the instance to start an in-app purchase. You call the instance directly because it defines a `PurchaseAction/callAsFunction(_:options:)` method that Swift calls when you call the instance.

For example, you can start an in-app purchase when the user taps a button:

```swift
struct PurchaseExample: View {
    @Environment(\.purchase) private var purchase
    let product: Product
    let purchaseOptions: [Product.PurchaseOption]

    var body: some View {
        Button {
            Task {
                let purchaseResult = try? await purchase(product, options: purchaseOptions)
                // Process purchase result.
            }
        } label: {
            Text(product.displayName)
        }
    }
}
```







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `dismiss`
- `dismissSearch`
- `dismissWindow`
- `openImmersiveSpace`
- `dismissImmersiveSpace`
- `newDocument`
- `openDocument`
- `openURL`
- `openWindow`
- `pushWindow`
- `refresh`
- `rename`
- `resetFocus`
- `openSettings`
