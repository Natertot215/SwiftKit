import SwiftUI

struct VisionOSVolumesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "visionOS Volumetric Window APIs",
            docPath: "Documentation/SwiftUI/windows/",
            availability: "visionOS 1.0+",
            blurb: """
            This cluster covers visionOS-specific volume and world-tracking APIs for volumetric windows. Viewpoint3D represents a 3D viewpoint (azimuth + elevation). SquareAzimuth quantizes viewpoints to 4 cardinal directions. SurfaceSnappingInfo describes how the window snaps to a physical surface. VolumeViewpointUpdateStrategy controls how the content adapts as the user moves around the volume. The Scene modifiers defaultWorldScaling(_:) and volumeWorldAlignment(_:) configure real-world scale and orientation. The View modifiers supportedVolumeViewpoints(_:) and onVolumeViewpointChange(...) let content adapt to viewing angle. WorldAlignmentBehavior, WorldScalingBehavior, WorldScalingCompensation, WorldTrackingLimitation, and worldTrackingLimitations (environment value) describe hardware constraints. All are visionOS-only; macOS does not support volumetric windows.
            """,
            signatures: [
                "WindowGroup { … }.defaultWorldScaling(.dynamic)",
                "WindowGroup { … }.volumeWorldAlignment(.camera)",
                "View.supportedVolumeViewpoints(.front)",
                "View.onVolumeViewpointChange(updateStrategy: .matching) { ctx in … }",
                "Viewpoint3D, SquareAzimuth, SurfaceSnappingInfo",
                "VolumeViewpointUpdateStrategy, WorldAlignmentBehavior",
                "WorldScalingBehavior, WorldScalingCompensation, WorldTrackingLimitation"
            ],
            notes: [
                "All APIs require visionOS 1.0 or later; none are available on macOS.",
                "Volumetric windows are created with WindowGroup { … }.windowStyle(.volumetric) in the App scene."
            ]
        )
    }
}

#Preview {
    VisionOSVolumesDescribePage()
        .frame(width: 900, height: 700)
}
