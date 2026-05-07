import SwiftUI

struct TranslationPresentationGalleryPage: View {
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

extension TranslationPresentationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.translationPresentation",
        title: "TranslationPresentation",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/translationPresentation(isPresented:text:attachmentAnchor:arrowEdge:replacementAction:)"
        ],
        blurb: "Translation modifier that presents the system translation UI for a given source string and optional replacement action.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/translationpresentation(ispresented:text:attachmentanchor:arrowedge:replacementaction:).md",
        page: { AnyView(TranslationPresentationGalleryPage()) }
    )
}

#Preview {
    TranslationPresentationGalleryPage()
        .frame(width: 900, height: 700)
}
