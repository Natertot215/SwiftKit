import SwiftUI

struct RotateGestureGalleryPage: View {
    @GestureState private var liveAngle: Angle = .zero
    @State private var committedAngle: Angle = .zero

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "RotateGesture — live angle",
                api: "RotateGesture().updating($angle) { value, state, _ in state = value.rotation }"
            ) {
                VStack(spacing: 8) {
                    Rectangle()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 80, height: 80)
                        .rotationEffect(liveAngle)
                        .gesture(
                            RotateGesture()
                                .updating($liveAngle) { value, state, _ in
                                    state = value.rotation
                                }
                        )
                    Text(String(format: "%.0f°", liveAngle.degrees))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "Commit on end",
                api: ".onEnded { committedAngle += $0.rotation }"
            ) {
                VStack(spacing: 8) {
                    Capsule()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 96, height: 36)
                        .rotationEffect(committedAngle + liveAngle)
                        .gesture(
                            RotateGesture()
                                .updating($liveAngle) { value, state, _ in
                                    state = value.rotation
                                }
                                .onEnded { value in
                                    committedAngle += value.rotation
                                }
                        )
                    Text(String(format: "committed %.0f°", committedAngle.degrees))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            ReferenceTile(
                name: "RotateGesture",
                signature: "struct RotateGesture : Gesture  // init(minimumAngleDelta: Angle = .degrees(1))",
                note: "Recognizes a two-finger rotation. Succeeds once the rotation exceeds minimumAngleDelta (default 1°)."
            )

            ReferenceTile(
                name: "RotateGesture.Value",
                signature: "rotation: Angle  ·  startLocation: CGPoint  ·  startAnchor: UnitPoint  ·  velocity: Angle  ·  time: Date",
                note: "rotation is the cumulative angle since the gesture began. startAnchor is the pinch midpoint as a UnitPoint, suitable for use with rotationEffect's anchor parameter."
            )

            ReferenceTile(
                name: "RotationGesture",
                signature: "struct RotationGesture  // deprecated in macOS 14",
                note: "Original (macOS 10.15) rotation gesture. Replaced by RotateGesture in macOS 14 with start location, anchor, velocity, and time."
            )
        }
    }
}

extension RotateGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.rotateGesture",
        title: "RotateGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "RotateGesture",
            "RotationGesture"
        ],
        blurb: "A gesture that recognizes a rotation motion and tracks the angle of the rotation. RotateGesture (macOS 14+) supersedes the deprecated RotationGesture.",
        signature: "struct RotateGesture",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/gestures/rotategesture.md",
        page: { AnyView(RotateGestureGalleryPage()) }
    )
}

#Preview {
    RotateGestureGalleryPage()
        .frame(width: 900, height: 700)
}
