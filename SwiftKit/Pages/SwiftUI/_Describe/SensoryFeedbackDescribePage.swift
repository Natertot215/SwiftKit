import SwiftUI

// Describe-track page for SensoryFeedback.
// Source: Documentation/SwiftUI/controls-and-indicators/sensoryfeedback.md
// macOS 14.0+. Cross-platform haptic/audio feedback API — hardware-dependent on macOS.

struct SensoryFeedbackDescribePage: View {
    var body: some View {
        DescribePage(
            title: "SensoryFeedback",
            docPath: "Documentation/SwiftUI/controls-and-indicators/sensoryfeedback.md",
            availability: "macOS 14.0+",
            blurb: """
            SensoryFeedback is SwiftUI's cross-platform haptic and audio feedback API. Attaching \
            .sensoryFeedback(_:trigger:) to a view plays a haptic pattern or sound whenever the trigger \
            value changes. The optional condition: closure receives old and new values and returns a Bool \
            — feedback fires only when the condition is true. SwiftUI ships semantic feedback types: \
            .success, .warning, .error (for outcomes), .selection (for picker changes), .increase / \
            .decrease (for stepper-like controls), .start / .stop (for media), .alignment and .levelChange \
            (for precise interactions), and .impact(weight:intensity:) / .impact(flexibility:intensity:) \
            for physical impact simulation. On macOS, most SensoryFeedback values play no haptic (no \
            Taptic Engine), though some may trigger NSHapticFeedbackManager events on supported MacBook \
            Pro trackpads. The modifier is macOS 14.0+ but the haptic response is hardware-dependent.
            """,
            notes: [
                "On macOS, haptic output depends on hardware — MacBook Pro with Force Touch trackpad only.",
                "Audio feedback (.selection, .success) may still play on macOS as system sounds.",
                "SensoryFeedback is an enum value — pass directly to .sensoryFeedback(_:trigger:)."
            ]
        )
    }
}

#Preview {
    SensoryFeedbackDescribePage()
        .frame(width: 900, height: 700)
}
