import SwiftUI

struct TransactionGalleryPage: View {
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

extension TransactionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.transaction",
        title: "Transaction",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "Transaction",
            "TransactionKey",
            "withTransaction(_:_:)",
            "withTransaction(_:_:_:)",
            "View/transaction(_:)",
            "View/transaction(value:_:)",
            "View/transaction(_:body:)"
        ],
        blurb: "The context of the current state-processing update. Use Transaction to inspect or override animation behavior for an in-flight change — including custom TransactionKey values to plumb data through a view hierarchy.",
        signature: "@frozen struct Transaction",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/animations/transaction.md",
        page: { AnyView(TransactionGalleryPage()) }
    )
}

#Preview {
    TransactionGalleryPage()
        .frame(width: 900, height: 700)
}
