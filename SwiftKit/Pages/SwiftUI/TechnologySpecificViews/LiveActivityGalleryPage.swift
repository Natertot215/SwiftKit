import SwiftUI

struct LiveActivityGalleryPage: View {
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

extension LiveActivityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.liveActivity",
        title: "LiveActivity",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/activitySystemActionForegroundColor(_:)",
            "View/activityBackgroundTint(_:)"
        ],
        blurb: "ActivityKit modifiers for styling Live Activities — system-action foreground color and background tint of the activity surface.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/activitybackgroundtint(_:).md",
        page: { AnyView(LiveActivityGalleryPage()) }
    )
}

#Preview {
    LiveActivityGalleryPage()
        .frame(width: 900, height: 700)
}
