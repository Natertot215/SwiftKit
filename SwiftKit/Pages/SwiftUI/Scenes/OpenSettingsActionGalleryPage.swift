import SwiftUI

struct OpenSettingsActionGalleryPage: View {
    @Environment(\.openSettings) private var openSettings

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "openSettings()",
                api: "@Environment(\\.openSettings) var openSettings  …  openSettings()"
            ) {
                Button {
                    openSettings()
                } label: {
                    Label("Open Settings", systemImage: "gearshape")
                }
                .buttonStyle(.bordered)
            }

            ReferenceTile(
                name: "Read from the environment",
                signature: "@Environment(\\.openSettings) private var openSettings",
                note: "Pull the action from the environment in any view. The closure has no parameters — invoking it pops the Settings scene to the front (or surfaces it if hidden)."
            )

            ReferenceTile(
                name: "Requires a Settings scene",
                signature: "Settings { SettingsView() }  // declared in App body",
                note: "openSettings is a no-op unless the App declares a Settings scene. Without one, there is nothing to present — pair the action with a Settings scene at the top level of the app."
            )

            ReferenceTile(
                name: "Compare to SettingsLink",
                signature: "SettingsLink { Label(\"Preferences…\", systemImage: \"gearshape\") }",
                note: "SettingsLink is the button-shaped equivalent — preferable for primary navigation surfaces. Use openSettings when you need to trigger from a custom button, menu command, or programmatic flow."
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
