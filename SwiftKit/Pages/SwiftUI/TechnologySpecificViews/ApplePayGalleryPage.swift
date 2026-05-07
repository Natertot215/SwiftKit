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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
