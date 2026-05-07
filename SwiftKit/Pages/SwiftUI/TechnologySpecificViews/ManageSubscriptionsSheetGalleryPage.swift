import SwiftUI

struct ManageSubscriptionsSheetGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "manageSubscriptionsSheet(isPresented:)",
                signature: "func manageSubscriptionsSheet(isPresented: Binding<Bool>) -> some View",
                note: "Presents the system sheet for managing all of the user's auto-renewable subscriptions for this app. The user can upgrade, downgrade, or cancel from inside the sheet."
            )

            ReferenceTile(
                name: "manageSubscriptionsSheet(isPresented:subscriptionGroupID:)",
                signature: "func manageSubscriptionsSheet(isPresented: Binding<Bool>, subscriptionGroupID: String) -> some View",
                note: "Variant scoped to a single subscription group ID — useful when an app sells multiple unrelated subscriptions and only one group is relevant in this context."
            )

            ReferenceTile(
                name: "Required import",
                signature: "import StoreKit",
                note: "Replaces the older AppStore.showManageSubscriptions(in:) UIWindowScene API with a SwiftUI-native presentation modifier."
            )

            ReferenceTile(
                name: "Use case",
                signature: "Settings → Subscription / cancel flows",
                note: "Surfacing this sheet is the App Store-compliant way to let users cancel — never build a custom cancellation UI."
            )
        }
    }
}

extension ManageSubscriptionsSheetGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.manageSubscriptionsSheet",
        title: "ManageSubscriptionsSheet",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/manageSubscriptionsSheet(isPresented:)",
            "View/manageSubscriptionsSheet(isPresented:subscriptionGroupID:)"
        ],
        blurb: "StoreKit modifier that presents the system sheet for managing the user's auto-renewable subscriptions.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/managesubscriptionssheet(ispresented:).md",
        page: { AnyView(ManageSubscriptionsSheetGalleryPage()) }
    )
}

#Preview {
    ManageSubscriptionsSheetGalleryPage()
        .frame(width: 900, height: 700)
}
