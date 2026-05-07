import SwiftUI

struct InAppPurchaseOptionsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "inAppPurchaseOptions(_:)",
                signature: "func inAppPurchaseOptions(_ options: @escaping (Product) async -> Set<Product.PurchaseOption>?) -> some View",
                note: "Customizes the purchase options (quantity, promotional offers, app-account-token) for any in-app purchase initiated under this view's subtree."
            )

            ReferenceTile(
                name: "onInAppPurchaseStart(perform:)",
                signature: "func onInAppPurchaseStart(perform: @escaping (Product) async -> Void) -> some View",
                note: "Runs when a purchase begins. Use to reveal a loading state, log analytics, or pre-warm a server endpoint."
            )

            ReferenceTile(
                name: "onInAppPurchaseCompletion(perform:)",
                signature: "func onInAppPurchaseCompletion(perform: @escaping (Product, Result<Product.PurchaseResult, any Error>) async -> Void) -> some View",
                note: "Fires when a purchase resolves with .success(.verified), .success(.unverified), .success(.userCancelled), .success(.pending), or .failure. Verify and persist on .verified only."
            )

            ReferenceTile(
                name: "Required import",
                signature: "import StoreKit",
                note: "All three modifiers attach observers to the new StoreKit purchase flow. They apply to ProductView, StoreView, SubscriptionStoreView, and any Product.purchase() call within the subtree."
            )

            ReferenceTile(
                name: "Product.PurchaseOption",
                signature: "Product.PurchaseOption.appAccountToken(UUID) / .quantity(Int) / .promotionalOffer(...)",
                note: "Returning nil from inAppPurchaseOptions falls back to default purchase options. Returning a set installs them at purchase time — useful for tying purchases to your own server-side user IDs."
            )
        }
    }
}

extension InAppPurchaseOptionsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.inAppPurchaseOptions",
        title: "InAppPurchaseOptions",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/inAppPurchaseOptions(_:)",
            "View/onInAppPurchaseCompletion(perform:)",
            "View/onInAppPurchaseStart(perform:)"
        ],
        blurb: "StoreKit purchase-flow modifiers: configures purchase options, observes purchase completion, and observes purchase start events.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/inapppurchaseoptions(_:).md",
        page: { AnyView(InAppPurchaseOptionsGalleryPage()) }
    )
}

#Preview {
    InAppPurchaseOptionsGalleryPage()
        .frame(width: 900, height: 700)
}
