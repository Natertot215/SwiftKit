import SwiftUI

/// Gallery page scaffold for App and Scenes. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct AppAndScenesGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "App", api: nil) { Color.clear }
            VariantTile(name: "Scene", api: nil) { Color.clear }
            VariantTile(name: "ScenePhase", api: nil) { Color.clear }
            VariantTile(name: "SceneBuilder", api: nil) { Color.clear }
            VariantTile(name: "WindowGroup", api: nil) { Color.clear }
            VariantTile(name: "Window", api: nil) { Color.clear }
            VariantTile(name: "Settings", api: nil) { Color.clear }
            VariantTile(name: "SettingsLink", api: nil) { Color.clear }
            VariantTile(name: "OpenSettingsAction", api: nil) { Color.clear }
            VariantTile(name: "MenuBarExtra", api: nil) { Color.clear }
            VariantTile(name: "MenuBarExtraStyle", api: nil) { Color.clear }
            VariantTile(name: "commands(content:)", api: nil) { Color.clear }
            VariantTile(name: "menuBarExtraStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "NSApplicationDelegateAdaptor", api: nil) { Color.clear }
            VariantTile(name: "UIApplicationDelegateAdaptor", api: nil) { Color.clear }
            VariantTile(name: "WKApplicationDelegateAdaptor", api: nil) { Color.clear }
            VariantTile(name: "WorldRecenterPhase", api: nil) { Color.clear }
        }
    }
}

extension AppAndScenesGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appStructure.appAndScenes",
        title: "App and Scenes",
        folder: "App Structure",
        framework: .swiftUI,
        absorbedSymbols: ["App", "AppandScenes", "Scene", "ScenePhase"],
        blurb: "App and Scenes — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(AppAndScenesGalleryPage()) }
    )
}
