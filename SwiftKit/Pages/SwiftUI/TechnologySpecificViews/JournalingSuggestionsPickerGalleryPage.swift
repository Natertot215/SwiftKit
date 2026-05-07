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
            ReferenceTile(
                name: "journalingSuggestionsPicker(isPresented:onCompletion:)",
                signature: "func journalingSuggestionsPicker(isPresented: Binding<Bool>, onCompletion: @escaping (JournalingSuggestion) -> Void) -> some View",
                note: "Presents the system picker for Journaling Suggestions — workouts, photos, contacts, and locations the user has chosen to surface to journaling apps. Only the user-selected suggestion is delivered to your app.",
                badge: "iOS only"
            )

            ReferenceTile(
                name: "Required import & entitlement",
                signature: "import JournalingSuggestions  //  com.apple.developer.journal.allow",
                note: "JournalingSuggestions framework + the journaling entitlement. Apple gates the entitlement to journaling apps."
            )

            ReferenceTile(
                name: "JournalingSuggestion",
                signature: "struct JournalingSuggestion: Identifiable",
                note: "Opaque suggestion bundle — read .content arrays for typed payloads (Workout, Photo, Contact, Location, Reflection). Your app sees only what the user explicitly grants."
            )

            ReferenceTile(
                name: "Use case",
                signature: "Journal-style apps that import system suggestions",
                note: "The picker keeps the data flow privacy-preserving: the system curates the suggestion list based on private on-device events, your app only sees what is selected."
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
