import SwiftUI

// SwiftUI KeyframeAnimator bundle.
// Covers:
//   KeyframeAnimator                                          — the view type (macOS 14+)
//   View/keyframeAnimator(initialValue:repeating:content:keyframes:)
//   View/keyframeAnimator(initialValue:trigger:content:keyframes:)
//   KeyframeTrack                                             — per-property track
//   KeyframeTrackContent                                      — protocol
//   KeyframeTrackContentBuilder                               — result builder
//   KeyframesBuilder                                          — result builder
//   Keyframes                                                 — type
//   KeyframeTimeline                                          — non-view evaluation
//   LinearKeyframe                                            — linear interpolation
//   CubicKeyframe                                             — smooth cubic interpolation
//   MoveKeyframe                                              — instant jump (no interpolation)
//   SpringKeyframe                                            — spring interpolation
// Source: Documentation/SwiftUI/animations/keyframe*.md
// macOS 14.0+

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 200

private struct RocketState {
    var offsetY: CGFloat = 0
    var scale: CGFloat = 1.0
    var rotation: Angle = .zero
    var opacity: Double = 1.0
}

struct KeyframeAnimatorPage: View {
    @State private var triggerCount = 0
    @State private var linearTrigger = 0
    @State private var springTrigger = 0

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

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("KeyframeAnimator")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Animates multiple properties of a value type along parallel tracks, each track using its own keyframe types (Linear, Cubic, Spring, Move). The view and modifier forms.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/animations/keyframeanimator.md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".keyframeAnimator(initialValue: RocketState(), trigger: count) { \u{2026} }") {
            VStack(spacing: 12) {
                Image(systemName: "airplane")
                    .font(.system(size: 36))
                    .foregroundStyle(.tint)
                    .keyframeAnimator(initialValue: RocketState(), trigger: triggerCount) { content, state in
                        content
                            .offset(y: state.offsetY)
                            .scaleEffect(state.scale)
                            .rotationEffect(state.rotation)
                            .opacity(state.opacity)
                    } keyframes: { _ in
                        KeyframeTrack(\.offsetY) {
                            LinearKeyframe(0, duration: 0.1)
                            SpringKeyframe(-60, duration: 0.4, spring: .bouncy)
                            SpringKeyframe(0, duration: 0.5, spring: .smooth)
                        }
                        KeyframeTrack(\.scale) {
                            LinearKeyframe(1.0, duration: 0.1)
                            CubicKeyframe(1.3, duration: 0.2)
                            CubicKeyframe(1.0, duration: 0.4)
                        }
                        KeyframeTrack(\.rotation) {
                            LinearKeyframe(.zero, duration: 0.1)
                            CubicKeyframe(.degrees(-15), duration: 0.2)
                            CubicKeyframe(.zero, duration: 0.4)
                        }
                    }
                Button("Launch") { triggerCount += 1 }
                    .buttonStyle(.bordered)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "LinearKeyframe \u{2014} constant-speed interpolation") {
                DemoFrame(api: "KeyframeTrack(\\.offsetY) { LinearKeyframe(100, duration: 0.5) }") {
                    VStack(spacing: 12) {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 28))
                            .foregroundStyle(.tint)
                            .keyframeAnimator(initialValue: RocketState(), trigger: linearTrigger) { c, s in
                                c.offset(y: s.offsetY)
                            } keyframes: { _ in
                                KeyframeTrack(\.offsetY) {
                                    LinearKeyframe(0, duration: 0.0)
                                    LinearKeyframe(-40, duration: 0.5)
                                    LinearKeyframe(0, duration: 0.5)
                                }
                            }
                        Button("Linear move") { linearTrigger += 1 }
                            .buttonStyle(.bordered)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "SpringKeyframe \u{2014} spring physics between keyframes") {
                DemoFrame(api: "SpringKeyframe(-60, duration: 0.4, spring: .bouncy)") {
                    VStack(spacing: 12) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(.tint)
                            .keyframeAnimator(initialValue: RocketState(), trigger: springTrigger) { c, s in
                                c.offset(y: s.offsetY).scaleEffect(s.scale)
                            } keyframes: { _ in
                                KeyframeTrack(\.offsetY) {
                                    SpringKeyframe(-50, duration: 0.4, spring: .bouncy)
                                    SpringKeyframe(0, duration: 0.5, spring: .smooth)
                                }
                                KeyframeTrack(\.scale) {
                                    SpringKeyframe(1.4, duration: 0.3, spring: .snappy)
                                    SpringKeyframe(1.0, duration: 0.5, spring: .smooth)
                                }
                            }
                        Button("Spring") { springTrigger += 1 }
                            .buttonStyle(.bordered)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "MoveKeyframe \u{2014} instant jump (no interpolation)") {
                DemoFrame(api: "MoveKeyframe(targetValue) \u{2014} value jumps immediately, no easing") {
                    VStack(spacing: 8) {
                        Text("MoveKeyframe jumps to the value immediately, with no interpolation. Useful for resetting state or switching modes mid-animation without a visible tween.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "CubicKeyframe \u{2014} smooth S-curve interpolation") {
                DemoFrame(api: "CubicKeyframe(value, duration:) \u{2014} smooth Bezier curve between keyframes") {
                    VStack(spacing: 8) {
                        Text("CubicKeyframe uses Catmull-Rom spline interpolation through consecutive keyframes, producing smooth motion that anticipates and follows through. Best for natural-feeling paths.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "KeyframeTimeline \u{2014} compute values without rendering") {
                DemoFrame(api: "KeyframeTimeline(initialValue: S()) { \u{2026} }.value(time: t)") {
                    VStack(spacing: 8) {
                        Text("KeyframeTimeline lets you evaluate keyframe animations at a specific time without attaching them to a view. Use it to drive non-view systems (audio, gestures, game logic) with the same keyframe definitions.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    private struct NoteItem {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NoteItem] = [
        .init(title: "KeyframeTrack drives a single property via a KeyPath.",
              detail: "Each KeyframeTrack targets one property on your value type (e.g., \\.offsetY). Multiple tracks run in parallel. The value type must be Animatable or contain Animatable properties.",
              symbol: "slider.horizontal.3"),
        .init(title: "Four keyframe types: Linear, Cubic, Spring, Move.",
              detail: "Mix them freely within a track. LinearKeyframe = constant speed. CubicKeyframe = smooth Catmull-Rom. SpringKeyframe = physics spring. MoveKeyframe = instant jump.",
              symbol: "chart.xyaxis.line"),
        .init(title: "The trigger variant plays once per trigger increment.",
              detail: "Use keyframeAnimator(initialValue:trigger:) for event-driven animations. Use the repeating: form or the PhaseAnimator alternative for continuous loops.",
              symbol: "bolt.fill"),
        .init(title: "KeyframeTrackContentBuilder and KeyframesBuilder are result builders.",
              detail: "These are the @resultBuilder types that power the keyframes { } and KeyframeTrack { } DSL closures. You rarely reference them directly.",
              symbol: "hammer")
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    KeyframeAnimatorPage()
        .frame(width: 1100, height: 900)
}
