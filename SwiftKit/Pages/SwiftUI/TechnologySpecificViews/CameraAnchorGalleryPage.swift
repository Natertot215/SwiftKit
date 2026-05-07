import SwiftUI

struct CameraAnchorGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "cameraAnchor(isActive:)",
                signature: "func cameraAnchor(isActive: Bool = true) -> some View",
                note: "Anchors the modified view to the camera transform inside an immersive RealityView scene. The view stays locked to the user's head pose while active.",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "Required import",
                signature: "import RealityKit",
                note: "Use inside a RealityView whose content is presented in an ImmersiveSpace. The modifier is a no-op outside an immersive scene."
            )

            ReferenceTile(
                name: "Use case",
                signature: "HUDs, reticles, persistent overlays in mixed/full reality",
                note: "Pin debug HUDs or always-visible UI to the user's view. Toggle isActive to detach the anchor when the player should be free to look around without the overlay following."
            )
        }
    }
}

extension CameraAnchorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.cameraAnchor",
        title: "CameraAnchor",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/cameraAnchor(isActive:)"
        ],
        blurb: "RealityKit modifier that anchors a SwiftUI view's transform to the user's camera in an immersive scene.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/cameraanchor(isactive:).md",
        page: { AnyView(CameraAnchorGalleryPage()) }
    )
}

#Preview {
    CameraAnchorGalleryPage()
        .frame(width: 900, height: 700)
}
