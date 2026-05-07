import SwiftUI

struct SubscriptionStoreViewGalleryPage: View {
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

extension SubscriptionStoreViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.subscriptionStoreView",
        title: "SubscriptionStoreView",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "SubscriptionStoreView",
            "View/subscriptionStoreButtonLabel(_:)",
            "View/subscriptionStoreControlIcon(icon:)",
            "View/subscriptionStoreControlStyle(_:)",
            "View/subscriptionStoreControlStyle(_:placement:)",
            "View/subscriptionStoreOptionGroupStyle(_:)",
            "View/subscriptionStorePickerItemBackground(_:)",
            "View/subscriptionStorePickerItemBackground(_:in:)",
            "View/subscriptionStorePolicyDestination(for:destination:)",
            "View/subscriptionStorePolicyDestination(url:for:)",
            "View/subscriptionStorePolicyForegroundStyle(_:)",
            "View/subscriptionStorePolicyForegroundStyle(_:_:)",
            "View/subscriptionStoreSignInAction(_:)",
            "View/subscriptionStoreControlBackground(_:)",
            "View/subscriptionPromotionalOffer(offer:signature:)",
            "View/preferredSubscriptionOffer(_:)"
        ],
        blurb: "StoreKit SubscriptionStoreView for merchandising auto-renewable subscriptions. Companion modifiers configure button label, control style and icon, picker backgrounds, policy destinations, sign-in action, promotional offers, and preferred offer.",
        signature: "struct SubscriptionStoreView<Content> : View where Content : View",
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/subscriptionstorebuttonlabel(_:).md",
        page: { AnyView(SubscriptionStoreViewGalleryPage()) }
    )
}

#Preview {
    SubscriptionStoreViewGalleryPage()
        .frame(width: 900, height: 700)
}
