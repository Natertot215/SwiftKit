import SwiftUI

struct CameraCaptureDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Camera Capture Button Events (iOS)",
            docPath: "Documentation/SwiftUI/input-events/",
            availability: "iOS 18.0+",
            blurb: """
            onCameraCaptureEvent(isEnabled:action:) and its two-action variant respond to the \
            hardware Camera Control button introduced on iPhone 15 Pro (iOS 18.0). The \
            single-action form fires on any button press — both half-press and full-press deliver \
            the same callback. The two-action form separates primaryAction (half-press, for \
            locking focus/exposure) from secondaryAction (full-press, for capture). The event \
            parameter carries metadata about which button state triggered the callback. This \
            modifier is useful for camera apps that want to support the native hardware shutter \
            button experience. Both overloads are iOS 18.0+ only; no macOS counterpart exists.
            """,
            signatures: [
                ".onCameraCaptureEvent(isEnabled: true) { event in … } — single-action form",
                ".onCameraCaptureEvent(isEnabled: true, primaryAction: { _ in … }, secondaryAction: { _ in … }) — half/full press"
            ],
            notes: [
                "Camera Control is available on iPhone 15 Pro and later.",
                "isEnabled: false temporarily disables the callback without removing the modifier."
            ]
        )
    }
}

#Preview {
    CameraCaptureDescribePage()
        .frame(width: 900, height: 700)
}
