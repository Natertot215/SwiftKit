import SwiftUI

/// Gallery page scaffold for AppKit Integration. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct AppKitIntegrationGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "NSViewRepresentable", api: nil) { Color.clear }
            VariantTile(name: "NSViewRepresentableContext", api: nil) { Color.clear }
            VariantTile(name: "NSViewControllerRepresentable", api: nil) { Color.clear }
            VariantTile(name: "NSViewControllerRepresentableContext", api: nil) { Color.clear }
            VariantTile(name: "NSHostingView", api: nil) { Color.clear }
            VariantTile(name: "NSHostingController", api: nil) { Color.clear }
            VariantTile(name: "NSHostingMenu", api: nil) { Color.clear }
            VariantTile(name: "NSHostingSizingOptions", api: nil) { Color.clear }
            VariantTile(name: "NSHostingSceneBridgingOptions", api: nil) { Color.clear }
            VariantTile(name: "NSHostingSceneRepresentation", api: nil) { Color.clear }
            VariantTile(name: "NSGestureRecognizerRepresentable", api: nil) { Color.clear }
            VariantTile(name: "NSGestureRecognizerRepresentableContext", api: nil) { Color.clear }
            VariantTile(name: "NSGestureRecognizerRepresentableCoordinateSpaceConverter", api: nil) { Color.clear }
        }
    }
}

extension AppKitIntegrationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appStructure.appkitIntegration",
        title: "AppKit Integration",
        folder: "App Structure",
        framework: .swiftUI,
        absorbedSymbols: ["AppKitIntegration", "NSViewControllerRepresentable", "NSViewRepresentable", "NSViewRepresentableContext"],
        blurb: "AppKit Integration — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(AppKitIntegrationGalleryPage()) }
    )
}
