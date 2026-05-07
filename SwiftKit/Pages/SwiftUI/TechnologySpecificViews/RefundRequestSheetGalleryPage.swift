import SwiftUI

struct RefundRequestSheetGalleryPage: View {
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

extension RefundRequestSheetGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.refundRequestSheet",
        title: "RefundRequestSheet",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/refundRequestSheet(for:isPresented:onDismiss:)"
        ],
        blurb: "StoreKit modifier that presents a sheet enabling users to request a refund for an in-app purchase.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/refundrequestsheet(for:ispresented:ondismiss:).md",
        page: { AnyView(RefundRequestSheetGalleryPage()) }
    )
}

#Preview {
    RefundRequestSheetGalleryPage()
        .frame(width: 900, height: 700)
}
