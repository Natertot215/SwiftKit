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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
