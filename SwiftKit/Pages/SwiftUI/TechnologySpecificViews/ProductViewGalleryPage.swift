import SwiftUI

struct ProductViewGalleryPage: View {
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

extension ProductViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.productView",
        title: "ProductView",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ProductView",
            "View/productIconBorder()",
            "View/productViewStyle(_:)",
            "View/productDescription(_:)"
        ],
        blurb: "StoreKit ProductView for displaying a single product. Companion modifiers configure the icon border, view style, and description.",
        signature: "struct ProductView<Icon, PlaceholderIcon> : View",
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/productviewstyle(_:).md",
        page: { AnyView(ProductViewGalleryPage()) }
    )
}

#Preview {
    ProductViewGalleryPage()
        .frame(width: 900, height: 700)
}
