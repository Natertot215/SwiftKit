import SwiftUI

struct TransactionTaskGalleryPage: View {
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

extension TransactionTaskGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.transactionTask",
        title: "TransactionTask",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/transactionTask(_:action:)"
        ],
        blurb: "StoreKit modifier that runs an asynchronous task tied to the lifetime of the view, observing transaction updates.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/transactiontask(_:action:).md",
        page: { AnyView(TransactionTaskGalleryPage()) }
    )
}

#Preview {
    TransactionTaskGalleryPage()
        .frame(width: 900, height: 700)
}
