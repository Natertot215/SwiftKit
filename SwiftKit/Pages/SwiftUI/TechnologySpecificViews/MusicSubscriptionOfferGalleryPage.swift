import SwiftUI

struct MusicSubscriptionOfferGalleryPage: View {
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

extension MusicSubscriptionOfferGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.musicSubscriptionOffer",
        title: "MusicSubscriptionOffer",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/musicSubscriptionOffer(isPresented:options:onLoadCompletion:)"
        ],
        blurb: "MusicKit modifier that presents an Apple Music subscription offer sheet from inside the app.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/musicsubscriptionoffer(ispresented:options:onloadcompletion:).md",
        page: { AnyView(MusicSubscriptionOfferGalleryPage()) }
    )
}

#Preview {
    MusicSubscriptionOfferGalleryPage()
        .frame(width: 900, height: 700)
}
