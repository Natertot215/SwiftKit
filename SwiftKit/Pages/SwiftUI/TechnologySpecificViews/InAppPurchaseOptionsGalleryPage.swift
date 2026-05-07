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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
