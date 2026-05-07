import SwiftUI

struct VolumeViewpointGalleryPage: View {
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

extension VolumeViewpointGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.volumeViewpoint",
        title: "VolumeViewpoint",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "Viewpoint3D",
            "SquareAzimuth",
            "VolumeViewpointUpdateStrategy",
            "View/onVolumeViewpointChange(updateStrategy:initial:_:)",
            "View/supportedVolumeViewpoints(_:)",
            "WorldAlignmentBehavior",
            "Scene/volumeWorldAlignment(_:)",
            "WorldScalingBehavior",
            "Scene/defaultWorldScaling(_:)",
            "WorldScalingCompensation",
            "EnvironmentValues/worldTrackingLimitations",
            "WorldTrackingLimitation",
            "SurfaceSnappingInfo"
        ],
        blurb: "Volumetric-scene viewpoint configuration — types, modifiers, and environment values for tracking how a volume is viewed, world alignment, scaling behavior, and tracking limitations. Primarily visionOS-relevant.",
        signature: "struct Viewpoint3D",
        availability: "macOS 26.0+ / visionOS 1.0+",
        docPath: "Documentation/SwiftUI/windows/viewpoint3d.md",
        page: { AnyView(VolumeViewpointGalleryPage()) }
    )
}

#Preview {
    VolumeViewpointGalleryPage()
        .frame(width: 900, height: 700)
}
