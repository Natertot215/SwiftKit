import SwiftUI

// SwiftUI MagnifyGesture (MagnificationGesture), RotateGesture (RotationGesture) reference page.
// Source: Documentation/SwiftUI/gestures/magnifygesture.md
// MagnifyGesture: macOS 13.0+; MagnificationGesture: macOS 10.15+ (deprecated in macOS 29)
// RotateGesture: macOS 13.0+; RotationGesture: macOS 10.15+ (deprecated)

struct MagnifyRotateGesturePage: View {
    @State private var scale: CGFloat = 1.0
    @GestureState private var magnifyAmount: CGFloat = 1.0
    @State private var angle: Angle = .zero
    @GestureState private var rotationAmount: Angle = .zero

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("MagnifyGesture / RotateGesture")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Pinch-to-zoom (MagnifyGesture) and trackpad rotation (RotateGesture). MagnificationGesture and RotationGesture are the deprecated predecessors.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/gestures/magnifygesture.md · macOS 13.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout("MagnifyGesture().updating($magnifyAmount) { v, s, _ in s = v.magnification }")
                APICallout("RotateGesture().updating($rotationAmount) { v, s, _ in s = v.rotation }")
                Text("Pinch (trackpad) or rotate (trackpad twist gesture) the shape below:")
                    .font(.caption).foregroundStyle(.tertiary)

                HStack(spacing: 24) {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.tint.opacity(0.3))
                        .frame(width: 100, height: 100)
                        .scaleEffect(scale * magnifyAmount)
                        .rotationEffect(angle + rotationAmount)
                        .gesture(
                            MagnifyGesture()
                                .updating($magnifyAmount) { value, state, _ in
                                    state = value.magnification
                                }
                                .onEnded { value in
                                    scale *= value.magnification
                                }
                        )
                        .gesture(
                            RotateGesture()
                                .updating($rotationAmount) { value, state, _ in
                                    state = value.rotation
                                }
                                .onEnded { value in
                                    angle += value.rotation
                                }
                        )
                        .overlay(Text("Pinch / Rotate").font(.caption2).foregroundStyle(.tint).multilineTextAlignment(.center))

                    VStack(alignment: .leading, spacing: 4) {
                        Text("scale: \(String(format: "%.2f", scale * magnifyAmount))")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        Text("angle: \(Int((angle + rotationAmount).degrees))°")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        Button("Reset") {
                            scale = 1
                            angle = .zero
                        }
                        .font(.caption)
                    }
                }
                .frame(height: 140, alignment: .leading)
                .padding()
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("MagnifyGesture.Value properties").font(.headline).foregroundStyle(.primary)
                    APICallout("""
value.magnification   // CGFloat — scale factor since gesture began
value.velocity        // CGFloat — scale factor change per second
value.startAnchor     // UnitPoint — gesture origin in view space
value.startLocation   // CGPoint — actual pixel origin
""")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("RotateGesture.Value properties").font(.headline).foregroundStyle(.primary)
                    APICallout("""
value.rotation        // Angle — total rotation since gesture began
value.velocity        // Angle — rotation per second
value.startAnchor     // UnitPoint
value.startLocation   // CGPoint
""")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("MagnificationGesture / RotationGesture (deprecated)").font(.headline).foregroundStyle(.primary)
                    APICallout("MagnificationGesture(minimumScaleDelta: 0.01)  // deprecated → MagnifyGesture")
                    APICallout("RotationGesture(minimumAngleDelta: .degrees(1))  // deprecated → RotateGesture")
                    Text("MagnificationGesture and RotationGesture still compile on macOS 26 but are deprecated. Prefer MagnifyGesture and RotateGesture.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("minimumScaleDelta / minimumAngleDelta").font(.headline).foregroundStyle(.primary)
                    APICallout("MagnifyGesture(minimumScaleDelta: 0.1)")
                    Text("The gesture won't recognize until the scale or angle has changed by at least this threshold — prevents accidental activation.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Combined scale and rotation via SimultaneousGesture").font(.headline).foregroundStyle(.primary)
                APICallout(".gesture(SimultaneousGesture(MagnifyGesture(), RotateGesture()))")
                Text("Both gestures can fire at the same time. See SimultaneousGesture page for the composition API.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("MagnifyGesture responds to macOS trackpad pinch. No equivalent mouse gesture exists.", systemImage: "trackpad")
                    .font(.callout).foregroundStyle(.secondary)
                Label("RotateGesture responds to the macOS trackpad rotate gesture (two-finger twist).", systemImage: "rotate.3d")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Multiply the base scale by magnification in onEnded to accumulate across multiple gestures.", systemImage: "multiply")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    MagnifyRotateGesturePage().frame(width: 900, height: 900)
}
