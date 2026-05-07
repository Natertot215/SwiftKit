import SwiftUI

struct CurrentEntitlementTaskGalleryPage: View {
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

extension CurrentEntitlementTaskGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.currentEntitlementTask",
        title: "CurrentEntitlementTask",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/currentEntitlementTask(for:priority:action:)"
        ],
        blurb: "StoreKit modifier that runs a task observing the user's current entitlement for a given product identifier.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/currententitlementtask(for:priority:action:).md",
        page: { AnyView(CurrentEntitlementTaskGalleryPage()) }
    )
}

#Preview {
    CurrentEntitlementTaskGalleryPage()
        .frame(width: 900, height: 700)
}
