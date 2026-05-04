import SwiftUI

// SwiftUI keyframe type reference page — family page covering all four types:
//   CubicKeyframe  — smooth cubic Bézier interpolation between values
//   LinearKeyframe — constant-velocity linear interpolation
//   MoveKeyframe   — instant jump to a value (no interpolation)
//   SpringKeyframe — spring physics interpolation
// Source: Documentation/SwiftUI/animations/
// macOS 14.0+. All four are used exclusively inside a KeyframeAnimator keyframes block.

private struct AnimationValues {
    var scale: CGFloat = 1.0
    var offsetY: CGFloat = 0.0
    var opacity: Double = 1.0
    var rotation: Double = 0.0
}

struct KeyframeTypesPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Keyframe Types")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("CubicKeyframe · LinearKeyframe · MoveKeyframe · SpringKeyframe — interpolation types used inside KeyframeAnimator.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/animations/ · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default — working KeyframeAnimator combining CubicKeyframe + SpringKeyframe

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Live demo — CubicKeyframe + SpringKeyframe")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            KeyframeAnimator(
                initialValue: AnimationValues(),
                repeating: true
            ) { values in
                RoundedRectangle(cornerRadius: 12)
                    .fill(.tint)
                    .frame(width: 80, height: 80)
                    .scaleEffect(values.scale)
                    .offset(y: values.offsetY)
                    .opacity(values.opacity)
            } keyframes: { _ in
                KeyframeTrack(\.scale) {
                    CubicKeyframe(1.2, duration: 0.3)
                    SpringKeyframe(0.9, duration: 0.4, spring: .bouncy)
                    CubicKeyframe(1.0, duration: 0.3)
                }
                KeyframeTrack(\.offsetY) {
                    CubicKeyframe(-30, duration: 0.3)
                    CubicKeyframe(10, duration: 0.2)
                    SpringKeyframe(0, duration: 0.5, spring: .bouncy)
                }
                KeyframeTrack(\.opacity) {
                    LinearKeyframe(0.6, duration: 0.3)
                    LinearKeyframe(1.0, duration: 0.7)
                }
            }
            .frame(width: 360, height: 160, alignment: .center)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout("KeyframeAnimator + CubicKeyframe + SpringKeyframe + LinearKeyframe")
        }
    }

    // MARK: Variants — one section per keyframe type

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 40) {

            // CubicKeyframe
            Group {
                Text("CubicKeyframe")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Smooth cubic Bézier interpolation between values. The curve passes through each keyframe value smoothly, computing tangents automatically from neighbors.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("CubicKeyframe<V>(_ to: V, duration: Double, timingCurve: UnitCurve = .easeInOut)")
                    KeyframeTypeCodeBlock(text:
                        """
                        KeyframeTrack(\\.scale) {
                            CubicKeyframe(1.5, duration: 0.4)
                            CubicKeyframe(1.0, duration: 0.4)
                        }
                        """)
                    Text("Use CubicKeyframe when values should glide smoothly through waypoints — position, scale, opacity arcs where abrupt acceleration changes would be noticeable.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            // LinearKeyframe
            Group {
                Text("LinearKeyframe")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Constant-velocity linear interpolation. The value moves at a fixed rate from the previous keyframe value to the target — no easing at either end.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("LinearKeyframe<V>(_ to: V, duration: Double, timingCurve: UnitCurve = .linear)")
                    KeyframeTypeCodeBlock(text:
                        """
                        KeyframeTrack(\\.opacity) {
                            LinearKeyframe(0.0, duration: 0.3)
                            LinearKeyframe(1.0, duration: 0.5)
                        }
                        """)
                    Text("Use LinearKeyframe for mechanical, machine-like motion (progress bars, readouts, audio levels) where constant velocity is intentional — not a sign of missing easing.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            // MoveKeyframe
            Group {
                Text("MoveKeyframe")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Instant jump to a value with no interpolation. The property changes to the target value immediately at the start of the keyframe's time slice.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("MoveKeyframe<V>(_ to: V)")
                    KeyframeTypeCodeBlock(text:
                        """
                        KeyframeTrack(\\.rotation) {
                            LinearKeyframe(90.0, duration: 0.4)
                            MoveKeyframe(0.0)           // snap back instantly
                            LinearKeyframe(90.0, duration: 0.4)
                        }
                        """)
                    Text("Use MoveKeyframe to snap a property to a new baseline without spending time in transition — e.g., resetting a rotation counter so subsequent keyframes don't accumulate.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            // SpringKeyframe
            Group {
                Text("SpringKeyframe")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Spring physics interpolation. The value overshoots the target and settles via a spring model. Duration controls the minimum time slice; the spring's natural oscillation determines the actual settling curve.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("SpringKeyframe<V>(_ to: V, duration: Double = 0.5, spring: Spring = .smooth, startVelocity: V? = nil)")
                    KeyframeTypeCodeBlock(text:
                        """
                        KeyframeTrack(\\.scale) {
                            SpringKeyframe(1.3, duration: 0.5, spring: .bouncy)
                            SpringKeyframe(1.0, duration: 0.5, spring: .smooth)
                        }
                        """)
                    Text("Use SpringKeyframe when the motion should feel physical — playful bounces, elastic snap-backs, or natural deceleration. Combine with .bouncy / .snappy / .smooth system springs.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    // MARK: States — comparison table

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Comparison: which type to reach for")
                .font(.headline)
                .foregroundStyle(.primary)
            VStack(alignment: .leading, spacing: 8) {
                comparisonRow(type: "CubicKeyframe", purpose: "Smooth arc through waypoints", when: "Position, scale, opacity curves — natural-feeling motion")
                Divider()
                comparisonRow(type: "LinearKeyframe", purpose: "Constant velocity", when: "Mechanical motion, progress, audio meters")
                Divider()
                comparisonRow(type: "MoveKeyframe", purpose: "Instant jump (no interpolation)", when: "Resetting accumulators, snapping to a baseline")
                Divider()
                comparisonRow(type: "SpringKeyframe", purpose: "Overshoot + settle (physics)", when: "Playful bounces, elastic snap-backs, natural deceleration")
            }
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    private func comparisonRow(type: String, purpose: String, when: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(type)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 160, alignment: .leading)
            VStack(alignment: .leading, spacing: 2) {
                Text(purpose)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.primary)
                Text(when)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private struct KFNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [KFNote] = [
        .init(title: "All four types live inside a KeyframeAnimator keyframes block.",
              detail: "You never instantiate these types outside KeyframeTrack closures. The KeyframesBuilder DSL expects them as the sole content of each track.",
              symbol: "curlybraces"),
        .init(title: "Mix types freely within one KeyframeTrack.",
              detail: "A single track can use CubicKeyframe for a slow rise, LinearKeyframe for a steady plateau, SpringKeyframe for a bouncy landing, and MoveKeyframe to reset — all in sequence.",
              symbol: "shuffle"),
        .init(title: "Duration is the minimum time slice, not a hard cap for spring keyframes.",
              detail: "SpringKeyframe's spring physics may extend past duration to reach rest if the spring parameters produce a long tail. The animator respects the full duration for sequencing subsequent keyframes.",
              symbol: "clock"),
        .init(title: "CubicKeyframe supports a custom timingCurve parameter.",
              detail: "Pass any UnitCurve to override the default Bézier — e.g., CubicKeyframe(1.0, duration: 0.4, timingCurve: .easeIn). LinearKeyframe accepts a timingCurve too but .linear is the only sensible default.",
              symbol: "function"),
        .init(title: "MoveKeyframe has no duration — it's a zero-time event.",
              detail: "The value snaps instantly. A MoveKeyframe in the middle of a track resets the starting point for the next interpolation; it does not consume real time.",
              symbol: "bolt")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

// MARK: - Page-local helper

private struct KeyframeTypeCodeBlock: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview {
    KeyframeTypesPage()
        .frame(width: 1100, height: 1000)
}
