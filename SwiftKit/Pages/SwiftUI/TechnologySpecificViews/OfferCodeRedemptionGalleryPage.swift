import SwiftUI

struct OfferCodeRedemptionGalleryPage: View {
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

extension OfferCodeRedemptionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.offerCodeRedemption",
        title: "OfferCodeRedemption",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/offerCodeRedemption(isPresented:onCompletion:)"
        ],
        blurb: "StoreKit modifier that presents the offer code redemption sheet so users can redeem subscription offer codes.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/offercoderedemption(ispresented:oncompletion:).md",
        page: { AnyView(OfferCodeRedemptionGalleryPage()) }
    )
}

#Preview {
    OfferCodeRedemptionGalleryPage()
        .frame(width: 900, height: 700)
}
