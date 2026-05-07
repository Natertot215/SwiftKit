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
            ReferenceTile(
                name: "Declare in App body",
                signature: "@main struct MyApp: App { var body: some Scene { WindowGroup { … }; Settings { SettingsView() } } }",
                note: "Add a Settings scene at the top level of an App's body. The system wires it to the app's Settings… menu item and the standard ⌘, shortcut."
            )

            ReferenceTile(
                name: "Shape with TabView",
                signature: "Settings { TabView { GeneralPane().tabItem { Label(\"General\", systemImage: \"gearshape\") } } }",
                note: "Standard macOS preferences pattern: a TabView whose tabs each present a labelled pane. SwiftUI renders the tabs as the familiar pill-shaped segmented selector at the window's top."
            )

            ReferenceTile(
                name: "Form layout inside",
                signature: "Form { Section(\"Appearance\") { Toggle(\"Use system accent\", isOn: $useSystem) } }",
                note: "Inside each tab, a Form gives the standard macOS inspector look — labelled rows aligned in a single column with system-default spacing."
            )

            ReferenceTile(
                name: "Open programmatically",
                signature: "@Environment(\\.openSettings) private var openSettings  …  openSettings()",
                note: "macOS 14+: read the openSettings environment value to invoke the Settings scene from arbitrary code paths (custom menu items, button taps in onboarding flows)."
            )

            ReferenceTile(
                name: "SettingsLink convenience",
                signature: "SettingsLink { Label(\"Preferences…\", systemImage: \"gearshape\") }",
                note: "macOS 14+: a button-shaped link that opens Settings without needing the openSettings action — drop it into menus or any view that has affordances for navigation."
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
