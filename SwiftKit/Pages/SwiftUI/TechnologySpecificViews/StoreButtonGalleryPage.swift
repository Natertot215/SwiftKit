import SwiftUI

struct StoreButtonGalleryPage: View {
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

extension StoreButtonGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.storeButton",
        title: "StoreButton",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/storeButton(_:for:)"
        ],
        blurb: "StoreKit modifier that controls visibility of standard store buttons (such as redeem code) inside StoreKit views.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/storebutton(_:for:).md",
        page: { AnyView(StoreButtonGalleryPage()) }
    )
}

#Preview {
    StoreButtonGalleryPage()
        .frame(width: 900, height: 700)
}
