import SwiftUI

struct PayLaterViewGalleryPage: View {
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

extension PayLaterViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.payLaterView",
        title: "PayLaterView",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "PayLaterView",
            "View/payLaterViewAction(_:)",
            "View/payLaterViewDisplayStyle(_:)"
        ],
        blurb: "Apple Pay Later promotional view. Companion modifiers configure the action and display style of the Pay Later view.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/paylaterviewaction(_:).md",
        page: { AnyView(PayLaterViewGalleryPage()) }
    )
}

#Preview {
    PayLaterViewGalleryPage()
        .frame(width: 900, height: 700)
}
