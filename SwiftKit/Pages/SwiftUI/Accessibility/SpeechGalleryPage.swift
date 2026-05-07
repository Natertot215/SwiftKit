import SwiftUI

struct SpeechGalleryPage: View {
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

extension SpeechGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.speech",
        title: "Speech",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/speechAdjustedPitch(_:)",
            "View/speechAlwaysIncludesPunctuation(_:)",
            "View/speechAnnouncementsQueued(_:)",
            "View/speechSpellsOutCharacters(_:)",
            "swiftui.accessible-descriptions.speechadjustedpitch(_:)",
            "swiftui.accessible-descriptions.speechalwaysincludespunctuation(_:)",
            "swiftui.accessible-descriptions.speechannouncementsqueued(_:)",
            "swiftui.accessible-descriptions.speechspellsoutcharacters(_:)"
        ],
        blurb: "Modifiers that tune how VoiceOver speaks a view: adjust pitch, force punctuation, queue announcements instead of interrupting, and spell out characters one by one.",
        signature: "func speechAdjustedPitch(_ value: Double) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/speechadjustedpitch(_:).md",
        page: { AnyView(SpeechGalleryPage()) }
    )
}

#Preview {
    SpeechGalleryPage()
        .frame(width: 900, height: 700)
}
