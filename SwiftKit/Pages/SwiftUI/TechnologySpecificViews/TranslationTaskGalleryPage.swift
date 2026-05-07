import SwiftUI

struct TranslationTaskGalleryPage: View {
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

extension TranslationTaskGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.translationTask",
        title: "TranslationTask",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/translationTask(_:action:)",
            "View/translationTask(source:target:action:)",
            "View/translationTask(source:target:preferredStrategy:action:)"
        ],
        blurb: "Translation modifier that runs an asynchronous translation task tied to the view's lifetime, with optional source/target language and preferred strategy.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/translationtask(_:action:).md",
        page: { AnyView(TranslationTaskGalleryPage()) }
    )
}

#Preview {
    TranslationTaskGalleryPage()
        .frame(width: 900, height: 700)
}
