import SwiftUI

struct RealityViewCameraControlsGalleryPage: View {
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

extension RealityViewCameraControlsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.realityViewCameraControls",
        title: "RealityViewCameraControls",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/realityViewCameraControls(_:)"
        ],
        blurb: "RealityKit modifier that configures the built-in camera controls of a RealityView, such as orbit and dolly.",
        signature: nil,
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/technology-specific-views/realityviewcameracontrols(_:).md",
        page: { AnyView(RealityViewCameraControlsGalleryPage()) }
    )
}

#Preview {
    RealityViewCameraControlsGalleryPage()
        .frame(width: 900, height: 700)
}
