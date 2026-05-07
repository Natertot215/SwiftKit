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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
