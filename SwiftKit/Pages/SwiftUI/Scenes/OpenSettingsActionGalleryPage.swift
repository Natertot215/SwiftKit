import SwiftUI

struct OpenSettingsActionGalleryPage: View {
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

extension OpenSettingsActionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.openSettingsAction",
        title: "OpenSettingsAction",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: [
            "OpenSettingsAction",
            "EnvironmentValues/openSettings",
            "swiftui.scenes.opensettingsaction",
            "swiftui.scenes.opensettings"
        ],
        blurb: "An action that presents the Settings scene for an app. Read the openSettings environment value inside any view to programmatically open the Settings window without an explicit SettingsLink.",
        signature: "struct OpenSettingsAction",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/scenes/opensettingsaction.md",
        page: { AnyView(OpenSettingsActionGalleryPage()) }
    )
}

#Preview {
    OpenSettingsActionGalleryPage()
        .frame(width: 900, height: 700)
}
