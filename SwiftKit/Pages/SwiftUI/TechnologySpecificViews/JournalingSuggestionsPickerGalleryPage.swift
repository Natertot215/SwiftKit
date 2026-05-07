import SwiftUI

struct JournalingSuggestionsPickerGalleryPage: View {
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

extension JournalingSuggestionsPickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.journalingSuggestionsPicker",
        title: "JournalingSuggestionsPicker",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/journalingSuggestionsPicker(isPresented:onCompletion:)"
        ],
        blurb: "JournalingSuggestions modifier that presents the system picker so users can attach journaling suggestions to entries.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/journalingsuggestionspicker(ispresented:oncompletion:).md",
        page: { AnyView(JournalingSuggestionsPickerGalleryPage()) }
    )
}

#Preview {
    JournalingSuggestionsPickerGalleryPage()
        .frame(width: 900, height: 700)
}
