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
            ReferenceTile(
                name: "SpatialContainer",
                signature: "struct SpatialContainer<Content> where Content : View",
                note: "Lays out children in three dimensions for spatial scenes. visionOS-only — on macOS the type is unavailable at runtime, so this page documents the shape rather than rendering a live demo.",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "Initializer",
                signature: "init(alignment: Alignment3D = .center, @ViewBuilder content: () -> Content)",
                note: "Like a ZStack, but with a depth axis. Children receive an Alignment3D anchor and lay out front-to-back inside the container's bounds."
            )

            ReferenceTile(
                name: "Inside an ImmersiveSpace",
                signature: "ImmersiveSpace { SpatialContainer { Model3D(named: \"Mug\"); Text(\"Caption\").offset(z: 0.05) } }",
                note: "Pair with ImmersiveSpace or a volumetric WindowGroup — ordinary 2D scenes flatten the depth axis to zero."
            )

            ReferenceTile(
                name: "macOS fallback",
                signature: "Use ZStack on macOS",
                note: "If your codebase supports both macOS and visionOS, gate SpatialContainer behind #if os(visionOS) and fall back to a ZStack on macOS — the geometry collapses to two dimensions cleanly."
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
