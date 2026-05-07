import SwiftUI

struct SettingsGalleryPage: View {
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

extension SettingsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.settings",
        title: "Settings",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: ["Settings", "swiftui.scenes.settings"],
        blurb: "A scene that renders itself as the standard macOS Settings window for an app. Declare it once at the top level of an App's body to provide the user-facing preferences UI invoked by the Settings menu item.",
        signature: "struct Settings<Content> where Content : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/scenes/settings.md",
        page: { AnyView(SettingsGalleryPage()) }
    )
}

#Preview {
    SettingsGalleryPage()
        .frame(width: 900, height: 700)
}
