import SwiftUI

struct WKNotificationSceneGalleryPage: View {
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

extension WKNotificationSceneGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.wkNotificationScene",
        title: "WKNotificationScene",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: ["WKNotificationScene", "swiftui.scenes.wknotificationscene"],
        blurb: "A scene that appears in response to receiving a specified category of remote or local notification. watchOS-only — kept here for catalog completeness; macOS apps use other notification surfaces.",
        signature: "struct WKNotificationScene<Content> : Scene where Content : View",
        availability: "watchOS 7.0+",
        docPath: "Documentation/SwiftUI/scenes/wknotificationscene.md",
        page: { AnyView(WKNotificationSceneGalleryPage()) }
    )
}

#Preview {
    WKNotificationSceneGalleryPage()
        .frame(width: 900, height: 700)
}
