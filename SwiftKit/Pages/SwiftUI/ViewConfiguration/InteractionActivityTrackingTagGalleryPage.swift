import SwiftUI

struct InteractionActivityTrackingTagGalleryPage: View {
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

extension InteractionActivityTrackingTagGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.interactionActivityTrackingTag",
        title: "InteractionActivityTrackingTag",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/interactionActivityTrackingTag(_:)"],
        blurb: "Sets a tag used for tracking interactivity. Tags compose hierarchically — nested modifiers concatenate top-to-bottom (\"Home-Feed\") so subsystems can identify which surface produced an interaction.",
        signature: "func interactionActivityTrackingTag(_ tag: String) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/view-configuration/interactionactivitytrackingtag(_:).md",
        page: { AnyView(InteractionActivityTrackingTagGalleryPage()) }
    )
}

#Preview {
    InteractionActivityTrackingTagGalleryPage()
        .frame(width: 900, height: 700)
}
