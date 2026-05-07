import SwiftUI

struct RotateGesture3DGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "RotateGesture3D",
                signature: "struct RotateGesture3D : Gesture  // visionOS",
                note: "Recognizes a free-hand rotation in 3D space. Succeeds once the rotation exceeds minimumAngleDelta. Live demo requires visionOS hardware.",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "RotateGesture3D.Value",
                signature: "rotation: Rotation3D  ·  velocity: Rotation3D  ·  startLocation3D: Point3D  ·  startInputDevicePose3D: …",
                note: "rotation is a Rotation3D from the Spatial framework expressing the cumulative angle and axis. velocity reports the angular rate at the most recent update."
            )

            ReferenceTile(
                name: "constrainedToAxis(_:)",
                signature: "func constrainedToAxis(_ axis: RotationAxis3D) -> RotateGesture3D",
                note: "Constrains the gesture to rotate only around the supplied 3D axis (e.g. .y for left-right twist). Other axes are ignored in the resulting Rotation3D."
            )

            ReferenceTile(
                name: "macOS availability",
                signature: "Compiles on macOS 15+ for SDK parity; rotates 3D content only on visionOS.",
                note: "SwiftKit's macOS target accepts the modifier so cross-platform code compiles, but the gesture never fires here. Validate on visionOS."
            )
        }
    }
}

extension RotateGesture3DGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.rotateGesture3D",
        title: "RotateGesture3D",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "RotateGesture3D"
        ],
        blurb: "A gesture that recognizes 3D rotation motion and tracks the angle and axis of the rotation. Constrainable to a specific axis with constrainedToAxis:.",
        signature: "struct RotateGesture3D",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/gestures/rotategesture3d.md",
        page: { AnyView(RotateGesture3DGalleryPage()) }
    )
}

#Preview {
    RotateGesture3DGalleryPage()
        .frame(width: 900, height: 700)
}
