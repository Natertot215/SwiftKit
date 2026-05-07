import SwiftUI

struct SubscriptionViewGalleryPage: View {
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

extension SubscriptionViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.subscriptionView",
        title: "SubscriptionView",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: ["SubscriptionView"],
        blurb: "A view that subscribes to a Combine publisher and runs an action whenever a value is emitted. The publisher's Failure type must be Never.",
        signature: "@frozen struct SubscriptionView<PublisherType, Content> where PublisherType : Publisher, Content : View, PublisherType.Failure == Never",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/subscriptionview.md",
        page: { AnyView(SubscriptionViewGalleryPage()) }
    )
}

#Preview {
    SubscriptionViewGalleryPage()
        .frame(width: 900, height: 700)
}
