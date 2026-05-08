import SwiftUI

/// Gallery page scaffold for WindowGroup. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct WindowGroupGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "WindowGroup", api: nil) { Color.clear }
            VariantTile(name: "Window", api: nil) { Color.clear }
            VariantTile(name: "UtilityWindow", api: nil) { Color.clear }
            VariantTile(name: "WindowStyle", api: nil) { Color.clear }
            VariantTile(name: "WindowToolbarStyle", api: nil) { Color.clear }
            VariantTile(name: "WindowResizability", api: nil) { Color.clear }
            VariantTile(name: "WindowLevel", api: nil) { Color.clear }
            VariantTile(name: "WindowManagerRole", api: nil) { Color.clear }
            VariantTile(name: "WindowProxy", api: nil) { Color.clear }
            VariantTile(name: "WindowLayoutRoot", api: nil) { Color.clear }
            VariantTile(name: "WindowIdealSize", api: nil) { Color.clear }
            VariantTile(name: "WindowInteractionBehavior", api: nil) { Color.clear }
            VariantTile(name: "WindowPlacement", api: nil) { Color.clear }
            VariantTile(name: "WindowPlacementContext", api: nil) { Color.clear }
            VariantTile(name: "WindowToolbarFullScreenVisibility", api: nil) { Color.clear }
            VariantTile(name: "WindowVisibilityToggle", api: nil) { Color.clear }
            VariantTile(name: "DisplayProxy", api: nil) { Color.clear }
            VariantTile(name: "SceneLaunchBehavior", api: nil) { Color.clear }
            VariantTile(name: "SceneRestorationBehavior", api: nil) { Color.clear }
            VariantTile(name: "DismissWindowAction", api: nil) { Color.clear }
            VariantTile(name: "OpenWindowAction", api: nil) { Color.clear }
            VariantTile(name: "PushWindowAction", api: nil) { Color.clear }
            VariantTile(name: "DismissAction", api: nil) { Color.clear }
            VariantTile(name: "DismissBehavior", api: nil) { Color.clear }
            VariantTile(name: "ControlActiveState", api: nil) { Color.clear }
            VariantTile(name: "SurfaceSnappingInfo", api: nil) { Color.clear }
            VariantTile(name: "defaultSize(_:)", api: nil) { Color.clear }
            VariantTile(name: "defaultPosition(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowResizability(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowLevel(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowFullScreenBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowMinimizeBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowDismissBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowBackgroundDragBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowResizeBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowManagerRole(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowIdealSize(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowIdealPlacement(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowToolbarStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowToolbarFullScreenVisibility(_:)", api: nil) { Color.clear }
            VariantTile(name: "windowToolbarLabelStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "defaultWindowPlacement(_:)", api: nil) { Color.clear }
            VariantTile(name: "defaultLaunchBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "restorationBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "presentedWindowStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "presentedWindowToolbarStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "persistentSystemOverlays(_:)", api: nil) { Color.clear }
        }
    }
}

extension WindowGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appStructure.windowGroup",
        title: "WindowGroup",
        folder: "App Structure",
        framework: .swiftUI,
        absorbedSymbols: ["UtilityWindow", "Window", "WindowGroup"],
        blurb: "WindowGroup — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(WindowGroupGalleryPage()) }
    )
}
