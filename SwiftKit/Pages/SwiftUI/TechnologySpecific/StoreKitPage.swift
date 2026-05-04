import SwiftUI
import StoreKit

// SwiftUI StoreKit modifiers reference page.
// Covers: currentEntitlementTask, storeProductTask, storeProductsTask, subscriptionStatusTask,
//         inAppPurchaseOptions, onInAppPurchaseCompletion, onInAppPurchaseStart,
//         preferredSubscriptionOffer, storeButton, productDescription, productIconBorder,
//         productViewStyle, refundRequestSheet, subscriptionStoreButtonLabel,
//         subscriptionStoreControlBackground, subscriptionStoreControlIcon,
//         subscriptionStoreControlStyle, subscriptionStoreOptionGroupStyle,
//         subscriptionStorePickerItemBackground, subscriptionStorePolicyDestination,
//         subscriptionStorePolicyForegroundStyle, subscriptionStoreSignInAction,
//         subscriptionPromotionalOffer, payWithApplePayButtonStyle,
//         onApplePayCouponCodeChange, onApplePayPaymentMethodChange,
//         onApplePayShippingContactChange, onApplePayShippingMethodChange,
//         musicSubscriptionOffer
// Source: Documentation/SwiftUI/technology-specific-views/

struct StoreKitPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("StoreKit SwiftUI Modifiers")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("In-app purchases, subscriptions, Apple Pay, and product display in SwiftUI.")
                .font(.callout).foregroundStyle(.secondary)
            Text("StoreKit 2 macOS 13.0+ · most modifiers macOS 14.0–15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "storeProductTask + ProductView") {
            snippet("""
            // Load and display a single product:
            ContentView()
                .storeProductTask(for: "com.app.premium") { state in
                    switch state {
                    case .loading:
                        ProgressView()
                    case .success(let product):
                        ProductView(product)
                            .productViewStyle(.compact)
                    case .failure(let error):
                        Text(error.localizedDescription)
                    }
                }
            """)
            APICallout(".storeProductTask(for: productID) { state in … }")
            Text("storeProductTask asynchronously fetches an App Store product and delivers the result as a TaskState.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "currentEntitlementTask — observe entitlement") {
                snippet("""
                view.currentEntitlementTask(for: "com.app.premium") { state in
                    switch state {
                    case .loading: ProgressView()
                    case .success(let verificationResult):
                        // verificationResult is VerificationResult<Transaction>?
                        if case .verified(let tx) = verificationResult {
                            enablePremiumFeatures()
                        }
                    case .failure: showRestoreButton()
                    }
                }
                """)
            }

            Block(title: "storeProductsTask — multiple products") {
                snippet("""
                view.storeProductsTask(for: productIDs) { state in
                    switch state {
                    case .success(let products):
                        ForEach(products) { product in
                            ProductView(product)
                        }
                    default: EmptyView()
                    }
                }
                """)
            }

            Block(title: "subscriptionStatusTask — monitor subscription state") {
                snippet("""
                view.subscriptionStatusTask(for: subscriptionGroupID) { state in
                    switch state {
                    case .success(let statuses):
                        let active = statuses.filter {
                            $0.state == .subscribed || $0.state == .inGracePeriod
                        }
                        showSubscriptionStatus(active)
                    default: break
                    }
                }
                """)
            }

            Block(title: "inAppPurchaseOptions — customize purchase") {
                snippet("""
                ProductView(product)
                    .inAppPurchaseOptions { product in
                        // Return a Set<Product.PurchaseOption>:
                        [.promotionalOffer(offerID: "launch-promo",
                                           keyID: keyID, nonce: nonce,
                                           signature: sig, timestamp: ts)]
                    }
                """)
            }

            Block(title: "onInAppPurchaseStart / onInAppPurchaseCompletion") {
                snippet("""
                SubscriptionStoreView(groupID: subGroupID)
                    .onInAppPurchaseStart { product in
                        analytics.track("purchase_started", product: product.id)
                    }
                    .onInAppPurchaseCompletion { product, result in
                        switch result {
                        case .success(let verResult): unlockFeatures()
                        case .userCancelled: break
                        case .pending: showPendingUI()
                        default: break
                        }
                    }
                """)
            }

            Block(title: "Subscription store styling") {
                snippet("""
                SubscriptionStoreView(groupID: groupID)
                    .subscriptionStoreControlStyle(.prominentPicker)
                    .subscriptionStoreButtonLabel(.action)
                    .subscriptionStoreControlBackground(.thinMaterial)
                    .subscriptionStoreControlIcon(icon: Image(systemName: "crown.fill"))
                    .subscriptionStoreOptionGroupStyle(.automatic)
                    .subscriptionStorePickerItemBackground(Color.accentColor.opacity(0.15))
                    .subscriptionStorePickerItemBackground(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
                    .subscriptionStorePolicyForegroundStyle(.secondary)
                    .subscriptionStorePolicyForegroundStyle(.primary, .secondary)
                    .subscriptionStorePolicyDestination(url: privacyURL, for: .privacyPolicy)
                    .subscriptionStorePolicyDestination(for: .termsOfService) { PolicyView() }
                    .subscriptionStoreSignInAction { signIn() }
                """)
            }

            Block(title: "Product display modifiers") {
                snippet("""
                ProductView(product)
                    .productViewStyle(.compact)     // .compact, .regular, .large
                    .productDescription(enabled: true)
                    .productIconBorder()           // adds rounded-rect border to icon
                """)
            }

            Block(title: "subscriptionPromotionalOffer + preferredSubscriptionOffer") {
                snippet("""
                SubscriptionStoreView(groupID: groupID)
                    .subscriptionPromotionalOffer(
                        offer: offer, signature: sig)
                    .preferredSubscriptionOffer(
                        offer)   // pre-select an offer in the picker
                """)
            }

            Block(title: "refundRequestSheet") {
                snippet("""
                view.refundRequestSheet(
                    for: transaction.id,
                    isPresented: $showRefund
                ) { result in
                    if result == .success { showRefundConfirmation() }
                }
                """)
            }

            Block(title: "storeButton(_:for:)") {
                snippet("""
                ProductView(product)
                    .storeButton(.visible, for: .restorePurchases)
                    .storeButton(.hidden, for: .cancellation)
                    .storeButton(.visible, for: .redeemCode)
                // Controls visibility of standard store buttons.
                """)
            }

            Block(title: "Apple Pay modifiers") {
                snippet("""
                PayWithApplePayButton(.buy) { request in
                    // Build PKPaymentRequest
                }
                .payWithApplePayButtonStyle(.automatic)
                // .automatic, .black, .white, .whiteOutline

                // Payment sheet event hooks:
                PKPaymentAuthorizationController(paymentRequest: req)
                    .onApplePayPaymentMethodChange { method in updateSummary(method) }
                    .onApplePayShippingContactChange { contact in validateContact(contact) }
                    .onApplePayShippingMethodChange { method in updateTotal(method) }
                    .onApplePayCouponCodeChange { code in applyCoupon(code) }
                """)
            }

            Block(title: "musicSubscriptionOffer") {
                snippet("""
                view.musicSubscriptionOffer(
                    isPresented: $showOffer,
                    options: MusicSubscriptionOffer.Options(
                        itemID: songID,
                        messageIdentifier: "listenAlong"
                    )
                ) { result in
                    if result == .subscribed { playMusic() }
                }
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("bag.fill", "All StoreKit 2 modifiers require a StoreKit configuration file in Xcode for local testing. Use the sandbox environment for device testing.")
            noteRow("arrow.triangle.2.circlepath", "currentEntitlementTask re-fires whenever entitlement state changes — perfect for gating premium UI without polling.")
            noteRow("creditcard", "Apple Pay modifiers (onApplePayShippingContactChange, etc.) attach to PKPaymentAuthorizationController/View — not standard SwiftUI views.")
            noteRow("crown.fill", "SubscriptionStoreView handles the entire subscription purchase flow. Use the styling modifiers to match your app's brand rather than building custom UI.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    StoreKitPage().frame(width: 1100, height: 900)
}
