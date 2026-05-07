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
            ReferenceTile(
                name: "WKNotificationScene",
                signature: "struct WKNotificationScene<Content> : Scene where Content : View",
                note: "watchOS-only Scene that activates when a notification of a specified category arrives. Catalog placeholder — macOS apps use UNNotificationCenter and UI surfaces inside their existing scenes for notification handling.",
                badge: "watchOS"
            )

            ReferenceTile(
                name: "Initializer",
                signature: "init(controller:category:)  /  init(content:category:)",
                note: "Pair the scene with a notification category identifier. The controller form bridges to a WKUserNotificationHostingController; the content form takes a SwiftUI view directly."
            )

            ReferenceTile(
                name: "Cross-platform note",
                signature: "macOS notifications: UNUserNotificationCenter + standard windows",
                note: "On macOS, notifications surface through UserNotifications.framework rather than a dedicated Scene type — handle them via UNUserNotificationCenterDelegate and present detail UI from existing scenes."
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
