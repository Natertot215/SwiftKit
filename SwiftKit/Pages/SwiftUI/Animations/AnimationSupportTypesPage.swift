import SwiftUI

// SwiftUI Animation support types bundle.
// Covers:
//   Spring                         — physics spring descriptor (macOS 14+)
//   UnitCurve                      — Bezier curve for custom timing (macOS 14+)
//   AnimationCompletionCriteria    — controls when withAnimation completion fires (macOS 14+)
//   AnimationContext               — passed to CustomAnimation (macOS 17+)
//   AnimationState                 — per-animation state storage (macOS 17+)
//   AnimationStateKey              — key type for AnimationState (macOS 17+)
//   AnimatableModifier             — (deprecated, use Animatable + ViewModifier)
//   AnimatablePair                 — pairs two Animatable values
//   AnimatableValues               — variadic Animatable tuple (macOS 26+)
//   EmptyAnimatableData            — no-op Animatable for non-animatable types
//   EmptyMatchedTransitionSourceConfiguration — default MatchedTransitionSourceConfiguration
//   GeometryEffect                 — protocol for geometry-based modifiers (deprecated)
//   View/geometryGroup()           — pins a view's geometry to its parent (macOS 14+)
//   PlaceholderContentView         — placeholder used in VisualEffect closures
//   NavigationTransition           — navigation push/pop transition type (macOS 26+)
//   View/navigationTransition(_:)  — applies a navigation transition (macOS 26+)
// Source: Documentation/SwiftUI/animations/

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 160

struct AnimationSupportTypesPage: View {
    @State private var springExpanded = false
    @State private var geometryGroupActive = false

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
            Text("Animation Support Types")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Supporting types for SwiftUI animations: Spring, UnitCurve, AnimationCompletionCriteria, AnimatablePair, EmptyAnimatableData, GeometryEffect, geometryGroup(), PlaceholderContentView, and NavigationTransition.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/animations/ \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "Animation.spring(Spring(duration: 0.4, bounce: 0.5))") {
            VStack(spacing: 12) {
                let spring = Spring(duration: 0.45, bounce: 0.55)
                RoundedRectangle(cornerRadius: 12)
                    .fill(.tint)
                    .frame(width: springExpanded ? 280 : 60, height: 48)
                    .animation(.spring(spring), value: springExpanded)
                HStack(spacing: 8) {
                    Text("Spring(duration: 0.45, bounce: 0.55)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                    Button(springExpanded ? "\u{25c4}" : "\u{25ba}") {
                        springExpanded.toggle()
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.small)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Spring \u{2014} physics spring parameters") {
                DemoFrame(api: "Spring(duration:bounce:) | Spring(mass:stiffness:damping:) | Spring(response:dampingRatio:)") {
                    HStack(spacing: 12) {
                        ForEach([
                            ("duration+bounce", Spring(duration: 0.4, bounce: 0.7)),
                            ("smooth",          Spring.smooth),
                            ("snappy",          Spring.snappy),
                            ("bouncy",          Spring.bouncy)
                        ], id: \.0) { name, _ in
                            VStack(spacing: 4) {
                                Circle()
                                    .fill(.tint)
                                    .frame(width: 20, height: 20)
                                Text(name)
                                    .font(.caption2)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "UnitCurve \u{2014} custom Bezier timing curve") {
                DemoFrame(api: "UnitCurve.bezier(startControlPoint:endControlPoint:)") {
                    VStack(spacing: 8) {
                        Text("UnitCurve defines a timing function as a unit Bezier curve. Use Animation.timingCurve(UnitCurve) or Animation.timingCurve(c0x:c0y:c1x:c1y:) for custom easing. Built-ins: .linear, .easeIn, .easeOut, .easeInOut, .circularIn, .circularOut, .circularInOut.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "AnimationCompletionCriteria \u{2014} controls withAnimation completion timing") {
                DemoFrame(api: "withAnimation(\u{2026}, completionCriteria: .logicallyComplete) { \u{2026} } completion: { \u{2026} }") {
                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(".logicallyComplete")
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.tint)
                                Text("fires when the animation's\n'logical' motion ends (spring settles)")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                            VStack(alignment: .leading, spacing: 2) {
                                Text(".removed")
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.tint)
                                Text("fires when the animation\nis fully removed from all views")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "AnimatablePair \u{2014} pairs two Animatable values") {
                DemoFrame(api: "AnimatablePair<First: VectorArithmetic, Second: VectorArithmetic>") {
                    VStack(spacing: 8) {
                        Text("AnimatablePair composes two Animatable values into one. Used as the animatableData for custom Animatable conformances that need to animate two properties simultaneously (e.g., width and height).")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "View/geometryGroup() \u{2014} stabilizes child geometry (macOS 14+)") {
                DemoFrame(api: ".geometryGroup()") {
                    VStack(spacing: 12) {
                        HStack(spacing: 16) {
                            VStack(spacing: 4) {
                                Text("Without geometryGroup")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Image(systemName: "exclamationmark.triangle")
                                    .foregroundStyle(.orange)
                            }
                            VStack(spacing: 4) {
                                Text("With .geometryGroup()")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Image(systemName: "checkmark.circle")
                                    .foregroundStyle(.green)
                                    .geometryGroup()
                            }
                        }
                        Text("geometryGroup() pins a view's geometry to its parent's coordinate space, preventing hitching when a parent animates its size.")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "NavigationTransition \u{2014} macOS 26+ navigation push/pop style") {
                DemoFrame(api: ".navigationTransition(.zoom(sourceID: id, in: ns))") {
                    VStack(spacing: 8) {
                        Text("NavigationTransition defines how a NavigationStack push or pop animates. Built-in values: .automatic (default), .zoom(sourceID:in:) for hero-zoom. Applied via .navigationTransition(_:) on a destination view.")
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
            VariantBlock(title: "EmptyAnimatableData \u{2014} non-animatable types") {
                DemoFrame(api: "var animatableData: EmptyAnimatableData { get { .init() } set { } }") {
                    VStack(spacing: 8) {
                        Text("Types conforming to Animatable that have no animatable properties return EmptyAnimatableData as their animatableData. This satisfies the protocol requirement without any actual interpolation.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "PlaceholderContentView \u{2014} in VisualEffect closures") {
                DemoFrame(api: ".visualEffect { content, geometry in content.blur(radius: \u{2026}) }") {
                    VStack(spacing: 8) {
                        Text("PlaceholderContentView<Content> is the type of the content parameter in .visualEffect { } closures. It represents the view without its position \u{2014} you apply visual-only modifiers like .blur, .opacity, .colorEffect to it.")
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
        .init(title: "Spring is the new preferred way to specify spring parameters.",
              detail: "Spring(duration:bounce:) replaces the older .interpolatingSpring(mass:stiffness:damping:blendDuration:) family. 'duration' is the settling time; 'bounce' ranges from 0 (critically damped) to ~1 (very bouncy).",
              symbol: "scalemass"),
        .init(title: "AnimatableModifier is deprecated \u{2014} use Animatable + ViewModifier.",
              detail: "AnimatableModifier was a combination protocol in earlier SDKs. Conform separately to Animatable (for the interpolated data) and ViewModifier (for the rendering). The compiler enforces this split in macOS 26.",
              symbol: "xmark.circle"),
        .init(title: "AnimationContext and AnimationState are for CustomAnimation implementors.",
              detail: "These types are passed to/returned from CustomAnimation.shouldMerge(previous:value:time:context:) and CustomAnimation.animate(value:time:context:). They store per-animation data across frames.",
              symbol: "wrench.and.screwdriver"),
        .init(title: "AnimatableValues is a variadic Animatable tuple (macOS 26+).",
              detail: "AnimatableValues<each T: VectorArithmetic> composes an arbitrary number of Animatable values into one, replacing nested AnimatablePair chains for types with three or more animated properties.",
              symbol: "number.square")
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
    AnimationSupportTypesPage()
        .frame(width: 1100, height: 900)
}
