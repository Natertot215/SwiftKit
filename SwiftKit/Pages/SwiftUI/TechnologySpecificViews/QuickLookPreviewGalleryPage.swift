import SwiftUI

struct QuickLookPreviewGalleryPage: View {
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

extension QuickLookPreviewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.quickLookPreview",
        title: "QuickLookPreview",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/quickLookPreview(_:)",
            "View/quickLookPreview(_:in:)"
        ],
        blurb: "QuickLook modifier that presents a preview of one or more files using the system Quick Look UI.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/quicklookpreview(_:).md",
        page: { AnyView(QuickLookPreviewGalleryPage()) }
    )
}

#Preview {
    QuickLookPreviewGalleryPage()
        .frame(width: 900, height: 700)
}
