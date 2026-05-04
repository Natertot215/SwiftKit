import SwiftUI

// Gesture overview articles and platform-specific/non-renderable gesture APIs.
// Covers: Adding interactivity with gestures, Composing SwiftUI gestures,
//         Chirality, HandGestureShortcut, SpatialEventGesture, SpatialTapGesture,
//         SpatialEventCollection, PencilDoubleTapGestureValue, PencilHoverPose,
//         PencilPreferredAction, PencilSqueezeGesturePhase, PencilSqueezeGestureValue

struct GestureDocsPage: View {
    var body: some View {
        DescribePage(
            title: "Gesture Guides & Platform-Specific APIs",
            docPath: "Documentation/SwiftUI/gestures/",
            availability: "macOS 10.15+ (guides); iOS/visionOS (Pencil/Spatial APIs)",
            blurb: """
            Several gesture-related APIs are not directly renderable as gallery demos — either \
            because they are articles, visionOS-spatial APIs, or Apple Pencil hardware APIs.

            Guide articles (macOS-available context):
            • "Adding interactivity with gestures" — overview of the SwiftUI gesture system, \
            recognition lifecycle, and composing recognizers.
            • "Composing SwiftUI gestures" — deep-dive on SequenceGesture, ExclusiveGesture, \
            SimultaneousGesture, and how SwiftUI resolves competing recognizers.

            Chirality (visionOS 1.0+): an enum indicating left/right hand in hand tracking.

            HandGestureShortcut (visionOS 2.0+): attaches a visionOS system hand gesture \
            (thumbs up, etc.) to a control via handGestureShortcut(_:isEnabled:). Not \
            available on macOS.

            SpatialEventGesture / SpatialTapGesture / SpatialEventCollection (visionOS 1.0+): \
            visionOS-only gesture types that track hand/eye spatial input. \
            SpatialEventCollection is the value type carrying spatial events.

            Pencil APIs (iOS/iPadOS): PencilDoubleTapGestureValue, PencilHoverPose, \
            PencilPreferredAction, PencilSqueezeGesturePhase, PencilSqueezeGestureValue — \
            all require Apple Pencil hardware and have no macOS availability.
            """,
            signatures: [
                "Chirality.left  //  .right  (visionOS hand tracking)",
                ".handGestureShortcut(.thumbsUp, isEnabled: true)  (visionOS 2.0+)",
                "SpatialEventGesture()  (visionOS 1.0+)",
                "SpatialTapGesture(coordinateSpace: .local)  (visionOS 1.0+)",
                "SpatialEventCollection  (visionOS 1.0+)",
                "PencilSqueezeGesturePhase: .active / .ended / .cancelled  (iOS 17.5+)",
                "PencilHoverPose.altitude  /  .azimuth  (iOS 17.5+)"
            ],
            notes: [
                "Chirality, HandGestureShortcut, and all Spatial*Gesture types are visionOS-only.",
                "Pencil types require physical Apple Pencil hardware on iPad — no macOS support.",
                "Guide articles are at Documentation/SwiftUI/gestures/ in the local mirror."
            ]
        )
    }
}

#Preview {
    GestureDocsPage().frame(width: 900, height: 700)
}
