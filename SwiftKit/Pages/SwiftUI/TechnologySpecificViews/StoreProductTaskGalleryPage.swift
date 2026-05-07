import SwiftUI

struct StoreProductTaskGalleryPage: View {
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

extension StoreProductTaskGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.storeProductTask",
        title: "StoreProductTask",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/storeProductTask(for:priority:action:)",
            "View/storeProductsTask(for:priority:action:)"
        ],
        blurb: "StoreKit modifiers that load a product (or set of products) by identifier as an asynchronous task tied to the view's lifetime.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/storeproducttask(for:priority:action:).md",
        page: { AnyView(StoreProductTaskGalleryPage()) }
    )
}

#Preview {
    StoreProductTaskGalleryPage()
        .frame(width: 900, height: 700)
}
