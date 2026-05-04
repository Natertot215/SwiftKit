import SwiftUI

// Describe-track page for visionOS Scene Anchors & Tabletop.
// Source: Documentation/SwiftUI/technology-specific-views/
// visionOS 2.0+. These APIs have no macOS counterpart.

struct VisionOSScenesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "visionOS Scene Anchors & Tabletop",
            docPath: "Documentation/SwiftUI/technology-specific-views/",
            availability: "visionOS 2.0+",
            blurb: """
            cameraAnchor(isActive:) marks a view as the anchor for a visionOS ARKit-based camera anchoring \
            session (visionOS 2.0). When isActive is true, the system uses the view's position as the origin \
            for the camera anchor entity — useful for AR experiences that need to align a SwiftUI view with a \
            real-world detected surface or image target.

            tabletopGame(_:parent:automaticUpdate:) and its interaction: variant integrate a TabletopKit game \
            entity into a visionOS scene, connecting SwiftUI layout to the physical tabletop surface detected \
            by ARKit. The parent entity defines where in 3D space the SwiftUI view is placed; \
            automaticUpdate: true lets SwiftUI drive the entity's position automatically.

            Both APIs are visionOS 2.0-only — no macOS counterpart exists.
            """,
            signatures: [
                ".cameraAnchor(isActive: true) — spatial camera anchoring (visionOS 2.0)",
                ".tabletopGame(game, parent: entity, automaticUpdate: true) — TabletopKit integration",
                ".tabletopGame(game, parent: entity, automaticUpdate: true, interaction: interactionDelegate) — with interaction"
            ],
            notes: [
                "Both APIs require visionOS 2.0 (macOS 26 SDK era) — not available in visionOS 1.x.",
                "tabletopGame requires TabletopKit framework and ARKit tabletop detection entitlement.",
                "cameraAnchor requires an active ARSession with a camera-tracking configuration."
            ]
        )
    }
}

#Preview {
    VisionOSScenesDescribePage()
        .frame(width: 900, height: 700)
}
