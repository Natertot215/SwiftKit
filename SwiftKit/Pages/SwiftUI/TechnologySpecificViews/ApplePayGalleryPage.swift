import SwiftUI

struct ApplePayGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "PayWithApplePayButton",
                signature: "struct PayWithApplePayButton<Label> : View",
                note: "PassKit's SwiftUI view for the canonical Pay with Apple Pay button. Pair with .payWithApplePayButtonStyle to choose the appearance."
            )

            ReferenceTile(
                name: "payWithApplePayButtonStyle(_:)",
                signature: "func payWithApplePayButtonStyle(_ style: PayWithApplePayButtonStyle) -> some View",
                note: "Built-in styles: .automatic, .black, .white, .whiteOutline. The button must remain unmodified visually beyond Apple's published styles."
            )

            ReferenceTile(
                name: "onApplePayCouponCodeChange(perform:)",
                signature: "func onApplePayCouponCodeChange(perform: @escaping (String) async -> PKPaymentRequestCouponCodeUpdate) -> some View",
                note: "Handles user-entered coupon codes during checkout. Return an updated PKPaymentRequestCouponCodeUpdate with new totals."
            )

            ReferenceTile(
                name: "onApplePayPaymentMethodChange(perform:)",
                signature: "func onApplePayPaymentMethodChange(perform: @escaping (PKPaymentMethod) async -> PKPaymentRequestPaymentMethodUpdate) -> some View",
                note: "Fires when the user picks a different card. Use it to recalculate totals (e.g. card-issuer-specific discounts)."
            )

            ReferenceTile(
                name: "onApplePayShippingContactChange(perform:)",
                signature: "func onApplePayShippingContactChange(perform: @escaping (PKContact) async -> PKPaymentRequestShippingContactUpdate) -> some View",
                note: "Validate the shipping contact and return updated shipping methods, totals, or errors."
            )

            ReferenceTile(
                name: "onApplePayShippingMethodChange(perform:)",
                signature: "func onApplePayShippingMethodChange(perform: @escaping (PKShippingMethod) async -> PKPaymentRequestShippingMethodUpdate) -> some View",
                note: "Handles shipping-method selection changes — return an update with the recomputed line items."
            )

            ReferenceTile(
                name: "Required imports & entitlements",
                signature: "import PassKit  //  Entitlement: com.apple.developer.in-app-payments",
                note: "Requires the In-App Payments entitlement and a registered Apple Pay merchant ID. The button only renders when the device can make payments — call PKPaymentAuthorizationController.canMakePayments() to gate UI."
            )
        }
    }
}

extension ApplePayGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.applePay",
        title: "ApplePay",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onApplePayCouponCodeChange(perform:)",
            "View/onApplePayPaymentMethodChange(perform:)",
            "View/onApplePayShippingContactChange(perform:)",
            "View/onApplePayShippingMethodChange(perform:)",
            "View/payWithApplePayButtonStyle(_:)"
        ],
        blurb: "Apple Pay integration: button style for the Pay with Apple Pay button, plus modifiers that respond to coupon code, payment method, shipping contact, and shipping method changes.",
        signature: nil,
        availability: "macOS 12.5+",
        docPath: "Documentation/SwiftUI/technology-specific-views/paywithapplepaybuttonstyle(_:).md",
        page: { AnyView(ApplePayGalleryPage()) }
    )
}

#Preview {
    ApplePayGalleryPage()
        .frame(width: 900, height: 700)
}
