import SwiftUI

struct SpatialContainerGalleryPage: View {
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

extension SpatialContainerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.spatialContainer",
        title: "SpatialContainer",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "SpatialContainer",
            "swiftui.layout-adjustments.spatialcontainer",
        ],
        blurb: "A container that lays out its children in three dimensions for spatial scenes. SpatialContainer extends stack-style layout into the depth axis on visionOS, with limited applicability on macOS.",
        signature: "struct SpatialContainer<Content> where Content : View",
        availability: "visionOS 1.0+",
        docPath: "Documentation/SwiftUI/layout-adjustments/spatialcontainer.md",
        page: { AnyView(SpatialContainerGalleryPage()) }
    )
}

#Preview {
    SpatialContainerGalleryPage()
        .frame(width: 900, height: 700)
}
