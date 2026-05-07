import SwiftUI

struct RedactedGalleryPage: View {
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

extension RedactedGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.redacted",
        title: "Redacted",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/redacted(reason:)",
            "View/unredacted()",
            "EnvironmentValues/redactionReasons",
            "RedactionReasons"
        ],
        blurb: "Adds redaction reasons (placeholder, privacy, invalidated) to a subtree so SwiftUI can substitute placeholder visuals. Use unredacted() to opt a subview back in; the resolved RedactionReasons set is available via the environment.",
        signature: "func redacted(reason: RedactionReasons) -> some View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/view-configuration/redacted(reason:).md",
        page: { AnyView(RedactedGalleryPage()) }
    )
}

#Preview {
    RedactedGalleryPage()
        .frame(width: 900, height: 700)
}
