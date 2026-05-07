import SwiftUI

struct TransactionPickerGalleryPage: View {
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

extension TransactionPickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.transactionPicker",
        title: "TransactionPicker",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/transactionPicker(isPresented:selection:)"
        ],
        blurb: "FinanceKit modifier that presents a picker for selecting financial transactions from the user's account history.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/transactionpicker(ispresented:selection:).md",
        page: { AnyView(TransactionPickerGalleryPage()) }
    )
}

#Preview {
    TransactionPickerGalleryPage()
        .frame(width: 900, height: 700)
}
