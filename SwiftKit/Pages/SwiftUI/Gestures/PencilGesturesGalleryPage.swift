import SwiftUI

struct PencilGesturesGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "View.onPencilDoubleTap(perform:)",
                signature: "func onPencilDoubleTap(perform: @escaping (PencilDoubleTapGestureValue) -> Void) -> some View",
                note: "Receives Apple Pencil double-tap events on supported hardware. The closure receives a PencilDoubleTapGestureValue describing where and when the tap landed.",
                badge: "iPadOS 17.5+"
            )

            ReferenceTile(
                name: "View.onPencilSqueeze(perform:)",
                signature: "func onPencilSqueeze(perform: @escaping (PencilSqueezeGestureValue) -> Void) -> some View",
                note: "Receives Apple Pencil Pro squeeze events. The PencilSqueezeGestureValue includes the squeeze phase (.began, .changed, .ended, .cancelled) and a hover pose.",
                badge: "iPadOS 17.5+"
            )

            ReferenceTile(
                name: "PencilDoubleTapGestureValue",
                signature: "struct PencilDoubleTapGestureValue { hoverPose: PencilHoverPose? }",
                note: "Holds metadata for a pencil double-tap event — currently a hover pose describing the pencil's location, altitude, and azimuth above the screen at the moment of the tap."
            )

            ReferenceTile(
                name: "PencilSqueezeGestureValue",
                signature: "struct PencilSqueezeGestureValue { phase: PencilSqueezeGesturePhase, hoverPose: PencilHoverPose? }",
                note: "Holds the squeeze gesture's phase and the pencil's hover pose at that moment. Inspect phase to drive UI that activates on squeeze begin, persists during change, and commits on end."
            )

            ReferenceTile(
                name: "PencilSqueezeGesturePhase",
                signature: "enum PencilSqueezeGesturePhase  ·  .active(SqueezeProgress)  ·  .ended  ·  .cancelled",
                note: "Reports the squeeze gesture's lifecycle. SqueezeProgress carries normalized progress 0…1 and a hoverPose during the active phase."
            )

            ReferenceTile(
                name: "PencilHoverPose",
                signature: "struct PencilHoverPose { location: CGPoint, altitude: Angle, azimuth: Angle, zOffset: CGFloat? }",
                note: "Describes the pencil's pose above the screen during pencil events: 2D location, vertical altitude angle, azimuth (rotation about the screen normal), and optional zOffset distance."
            )

            ReferenceTile(
                name: "PencilPreferredAction",
                signature: "enum PencilPreferredAction  ·  .ignore  ·  .switchEraser  ·  .switchPrevious  ·  .showColorPalette  ·  .showInkAttributes  ·  .runSystemShortcut",
                note: "The user's system-level preference for what a pencil double-tap should do. Honor this in art and note-taking apps so pencil behavior stays consistent across applications."
            )

            ReferenceTile(
                name: "macOS availability",
                signature: "macOS 14.5+ accepts the modifier; runtime events arrive only on iPadOS pencil hardware.",
                note: "SwiftKit ships a macOS-only target — these modifiers compile and accept callbacks but never fire here. Surface a no-op in your macOS code paths and exercise on iPadOS for live testing."
            )
        }
    }
}

extension PencilGesturesGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.pencilGestures",
        title: "PencilGestures",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onPencilDoubleTap(perform:)",
            "View/onPencilSqueeze(perform:)",
            "PencilDoubleTapGestureValue",
            "PencilSqueezeGestureValue",
            "PencilSqueezeGesturePhase",
            "PencilHoverPose",
            "PencilPreferredAction"
        ],
        blurb: "Apple Pencil interaction modifiers and value types. onPencilDoubleTap and onPencilSqueeze deliver double-tap and squeeze events; the companion value types describe each gesture's phase, location, and preferred action.",
        signature: nil,
        availability: "macOS 14.5+",
        docPath: "Documentation/SwiftUI/gestures/onpencildoubletap(perform:).md",
        page: { AnyView(PencilGesturesGalleryPage()) }
    )
}

#Preview {
    PencilGesturesGalleryPage()
        .frame(width: 900, height: 700)
}
