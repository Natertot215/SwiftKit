import SwiftUI

struct SubscriptionStatusTaskGalleryPage: View {
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

extension SubscriptionStatusTaskGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.subscriptionStatusTask",
        title: "SubscriptionStatusTask",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/subscriptionStatusTask(for:priority:action:)"
        ],
        blurb: "StoreKit modifier that runs a task observing the subscription status for a given subscription group.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/subscriptionstatustask(for:priority:action:).md",
        page: { AnyView(SubscriptionStatusTaskGalleryPage()) }
    )
}

#Preview {
    SubscriptionStatusTaskGalleryPage()
        .frame(width: 900, height: 700)
}
