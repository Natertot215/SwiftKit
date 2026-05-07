import SwiftUI

struct AppStoreOverlayGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "appStoreOverlay(isPresented:configuration:)",
                signature: "func appStoreOverlay(isPresented: Binding<Bool>, configuration: () -> SKOverlay.Configuration) -> some View",
                note: "Presents an SKOverlay over the current scene. The closure returns a configured SKOverlay.AppConfiguration (or AppClipConfiguration) describing which app to promote and the position style. iOS-only — overlays are not displayed on macOS.",
                badge: "iOS only"
            )

            ReferenceTile(
                name: "Required import",
                signature: "import StoreKit",
                note: "SKOverlay and SKOverlay.Configuration come from StoreKit. The modifier itself lives in the SwiftUI overlay-bridging layer."
            )

            ReferenceTile(
                name: "Configuration shape",
                signature: "SKOverlay.AppConfiguration(appIdentifier: String, position: SKOverlay.Position)",
                note: "Apple App Store ID is required. Position is typically .bottom or .bottomRaised so the overlay clears the home indicator."
            )

            ReferenceTile(
                name: "Use case",
                signature: "Cross-promote a sibling app or App Clip parent",
                note: "Use sparingly — Apple recommends overlays for genuine cross-promotion (companion app, parent app from an App Clip), not generic upsell."
            )
        }
    }
}

extension AppStoreOverlayGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.appStoreOverlay",
        title: "AppStoreOverlay",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/appStoreOverlay(isPresented:configuration:)"
        ],
        blurb: "StoreKit modifier that presents an App Store overlay for promoting another app from inside your app.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/appstoreoverlay(ispresented:configuration:).md",
        page: { AnyView(AppStoreOverlayGalleryPage()) }
    )
}

#Preview {
    AppStoreOverlayGalleryPage()
        .frame(width: 900, height: 700)
}
