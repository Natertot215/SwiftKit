import SwiftUI

struct OnCameraCaptureEventGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "View.onCameraCaptureEvent(isEnabled:action:)",
                signature: "func onCameraCaptureEvent(isEnabled: Bool = true, action: @escaping (AVCaptureEvent) -> Void) -> some View",
                note: "Receives hardware Capture Button events on devices that surface them — typically iPhone 15 Pro and later. The closure receives an AVCaptureEvent with phase and pressure information.",
                badge: "iOS 17.2+"
            )

            ReferenceTile(
                name: "View.onCameraCaptureEvent(isEnabled:primaryAction:secondaryAction:)",
                signature: "func onCameraCaptureEvent(isEnabled: Bool = true, primaryAction: …, secondaryAction: …) -> some View",
                note: "Two-handler overload for hardware that exposes a primary + secondary capture button (e.g. half-press vs. full-press). primaryAction handles the focus-press; secondaryAction handles the shutter.",
                badge: "iOS 17.2+"
            )

            ReferenceTile(
                name: "AVCaptureEvent",
                signature: "class AVCaptureEvent  ·  phase: Phase  ·  // .began, .cancelled, .ended",
                note: "AVFoundation's hardware-event payload. Inspect phase in the action closure to drive previewing on .began and capture on .ended."
            )

            ReferenceTile(
                name: "macOS availability",
                signature: "Compiles on macOS for SDK parity; events require iPhone hardware.",
                note: "SwiftKit ships macOS-only and won't fire camera-capture events. The modifier exists so multi-platform code can compile from a single source."
            )

            ReferenceTile(
                name: "Required entitlement",
                signature: "Info.plist: NSCameraUsageDescription",
                note: "Apps using camera capture must declare camera privacy strings. Hardware capture events still require the user to have granted camera access."
            )
        }
    }
}

extension OnCameraCaptureEventGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.onCameraCaptureEvent",
        title: "OnCameraCaptureEvent",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onCameraCaptureEvent(isEnabled:action:)",
            "View/onCameraCaptureEvent(isEnabled:primaryAction:secondaryAction:)"
        ],
        blurb: "Receives hardware camera-capture button events on devices that surface them — primary and secondary action overloads cover single- and dual-button hardware.",
        signature: "func onCameraCaptureEvent(isEnabled: Bool = true, action: @escaping (AVCaptureEvent) -> Void) -> some View",
        availability: "iOS 17.2+",
        docPath: "Documentation/SwiftUI/input-events/oncameracaptureevent(isenabled:action:).md",
        page: { AnyView(OnCameraCaptureEventGalleryPage()) }
    )
}

#Preview {
    OnCameraCaptureEventGalleryPage()
        .frame(width: 900, height: 700)
}
