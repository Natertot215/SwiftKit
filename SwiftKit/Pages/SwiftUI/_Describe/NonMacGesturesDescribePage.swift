import SwiftUI

struct NonMacGesturesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Platform-Specific Gestures",
            docPath: "Documentation/SwiftUI/gestures/",
            availability: "iOS / watchOS / visionOS",
            blurb: """
            Several gesture APIs are locked to non-macOS platforms. \
            onPencilDoubleTap(perform:) and onPencilSqueeze(perform:) respond to physical Apple Pencil \
            hardware attached to an iPad — iOS 17.5+ only, no macOS equivalent. RotateGesture3D \
            recognizes a visionOS two-handed rotation gesture in 3D space using hand tracking. \
            HandActivationBehavior fine-tunes how the visionOS hand-pointer activates elements — \
            .pinch requires an explicit pinch; .automatic uses platform defaults. \
            defersSystemGestures(on:) suppresses iOS system-edge swipe gestures (home indicator, \
            Control Center) on specified edges — meaningless on macOS. The \
            onLongPressGesture(minimumDuration:perform:onPressingChanged:) overload here is the \
            tvOS remote-surface variant (different from the macOS/iOS overload already wired). \
            onLongTouchGesture responds to a sustained touch on the Siri Remote touchpad (tvOS 16.0). \
            None are available on macOS 26.
            """,
            signatures: [
                ".onPencilDoubleTap(perform:) — Apple Pencil double-tap (iOS 17.5+)",
                ".onPencilSqueeze(perform:) — Apple Pencil squeeze (iOS 17.5+)",
                "RotateGesture3D() — visionOS hand-tracking rotation gesture",
                "HandActivationBehavior — .automatic, .pinch (visionOS 2.0)",
                ".defersSystemGestures(on: .bottom) — iOS edge-swipe deferral",
                "onLongPressGesture(minimumDuration:perform:onPressingChanged:) — tvOS overload",
                "onLongTouchGesture(minimumDuration:perform:onTouchingChanged:) — Siri Remote (tvOS 16.0)"
            ],
            notes: [
                "The macOS-available LongPressGesture and onLongPressGesture are wired in separate gesture pages.",
                "RotateGesture3D requires visionOS hand tracking — not available in the visionOS Simulator.",
                "HandActivationBehavior ships in visionOS 2.0 (macOS 26 SDK era) but targets visionOS only."
            ]
        )
    }
}

#Preview {
    NonMacGesturesDescribePage()
        .frame(width: 900, height: 700)
}
