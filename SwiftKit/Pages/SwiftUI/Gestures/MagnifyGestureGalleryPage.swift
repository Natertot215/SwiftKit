import SwiftUI

struct MagnifyGestureGalleryPage: View {
    @GestureState private var liveScale: CGFloat = 1.0
    @State private var committedScale: CGFloat = 1.0
    @GestureState private var anchorReadout: UnitPoint = .center

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "MagnifyGesture — live scale",
                api: "MagnifyGesture().updating($scale) { value, state, _ in state = value.magnification }"
            ) {
                VStack(spacing: 8) {
                    Circle()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 64, height: 64)
                        .scaleEffect(liveScale)
                        .gesture(
                            MagnifyGesture()
                                .updating($liveScale) { value, state, _ in
                                    state = value.magnification
                                }
                        )
                    Text(String(format: "scale %.2f", liveScale))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "Commit on end",
                api: ".onEnded { committedScale *= $0.magnification }"
            ) {
                VStack(spacing: 8) {
                    Capsule()
                        .fill(Color.accentColor.opacity(0.3))
                        .frame(width: 96, height: 36)
                        .scaleEffect(committedScale * liveScale)
                        .gesture(
                            MagnifyGesture()
                                .updating($liveScale) { value, state, _ in
                                    state = value.magnification
                                }
                                .onEnded { value in
                                    committedScale *= value.magnification
                                }
                        )
                    Text(String(format: "committed %.2f", committedScale))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "Value.startAnchor",
                api: "value.startAnchor — UnitPoint of pinch start"
            ) {
                VStack(spacing: 8) {
                    Rectangle()
                        .fill(Color.accentColor.opacity(0.2))
                        .frame(width: 100, height: 60)
                        .gesture(
                            MagnifyGesture()
                                .updating($anchorReadout) { value, state, _ in
                                    state = value.startAnchor
                                }
                        )
                    Text(String(format: "anchor (%.2f, %.2f)", anchorReadout.x, anchorReadout.y))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            ReferenceTile(
                name: "MagnifyGesture",
                signature: "struct MagnifyGesture : Gesture  // Value == MagnifyGesture.Value",
                note: "Recognizes a pinch-to-zoom gesture. Succeeds once magnification crosses minimumScaleDelta (default 0.01)."
            )

            ReferenceTile(
                name: "MagnifyGesture.Value",
                signature: "magnification: CGFloat  ·  startLocation: CGPoint  ·  startAnchor: UnitPoint  ·  velocity: CGFloat  ·  time: Date",
                note: "magnification is the multiplicative scale change since the gesture began (1.0 = no change). startAnchor is the pinch midpoint as a UnitPoint useful for scaleEffect anchor parameter."
            )

            ReferenceTile(
                name: "MagnificationGesture",
                signature: "struct MagnificationGesture  // deprecated in macOS 14",
                note: "The original (macOS 10.15) magnification gesture. Replaced by MagnifyGesture in macOS 14 with a richer Value (start anchor, velocity, time)."
            )
        }
    }
}

extension MagnifyGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.magnifyGesture",
        title: "MagnifyGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "MagnifyGesture",
            "MagnificationGesture"
        ],
        blurb: "A gesture that recognizes a magnification motion and tracks the amount of magnification. MagnifyGesture (macOS 14+) supersedes the deprecated MagnificationGesture.",
        signature: "struct MagnifyGesture",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/gestures/magnifygesture.md",
        page: { AnyView(MagnifyGestureGalleryPage()) }
    )
}

#Preview {
    MagnifyGestureGalleryPage()
        .frame(width: 900, height: 700)
}
