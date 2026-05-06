import SwiftUI

// Dense ScrollTransition reference page. Consolidates four previously-separate leaves:
//   • View/scrollTransition(_:axis:transition:)                                   (this file — rewritten)
//   • View/scrollTransition(topLeading:bottomTrailing:axis:transition:)
//   • ScrollTransitionPhase                                                       (describe-only @frozen enum)
//   • ScrollTransitionConfiguration                                               (describe-only struct)
//
// Source docs:
//   Documentation/SwiftUI/scroll-views/scrolltransition(_:axis:transition:).md
//   Documentation/SwiftUI/scroll-views/scrolltransition(topleading:bottomtrailing:axis:transition:).md
//   Documentation/SwiftUI/scroll-views/scrolltransitionphase.md
//   Documentation/SwiftUI/scroll-views/scrolltransitionconfiguration.md
//
// Mirrors TypographyPage / SafeAreaPage / PaddingPage's dense rhythm: one
// ScrollView, one VStack, one PageSection per topic. Reference subsections
// (ScrollTransitionPhase + ScrollTransitionConfiguration describe content) are
// placed ABOVE demo subsections per the describe-track placement rule. All
// demos compose Apple primitives directly — no custom wrapper views.

struct ScrollTransitionPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                phaseReferenceSection
                configurationReferenceSection
                defaultScrollTransitionSection
                topBottomVariantSection
                higNotesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/scrollTransition")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Animates each child of a ScrollView across ScrollTransitionPhase values as it enters and exits the visible region. The transition closure reads a phase to drive a VisualEffect; ScrollTransitionConfiguration controls the timing.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/ \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text(".scrollTransition(_:axis:transition:)  \u{00b7}  .scrollTransition(topLeading:bottomTrailing:axis:transition:)  \u{00b7}  ScrollTransitionPhase  \u{00b7}  ScrollTransitionConfiguration")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (ScrollTransitionPhase enum)
    //
    // Describe-track content placed above demos per the describe-track placement
    // rule. Open the page, see the type definition first, then scroll into demos.

    private var phaseReferenceSection: some View {
        PageSection("Reference (ScrollTransitionPhase)", subtitle: "@frozen enum ScrollTransitionPhase \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Blurb.
                Text("The phases that a view transitions between when it scrolls among other views. Inside the closure passed to .scrollTransition(_:axis:transition:), this enum tells you which edge of the scroll view's visible region the view is in or approaching from.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                // Cases listing.
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".topLeading")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 150, alignment: .leading)
                        Text("The view is entering / exiting the top (vertical) or leading (horizontal) edge of the visible region.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".identity")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 150, alignment: .leading)
                        Text("The view is fully inside the visible region. Apple's guidance: don't apply visual changes here \u{2014} the closure should leave the view alone.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".bottomTrailing")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 150, alignment: .leading)
                        Text("The view is entering / exiting the bottom (vertical) or trailing (horizontal) edge of the visible region.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }

                // Derived properties.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Derived properties")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".isIdentity")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 150, alignment: .leading)
                        Text("Bool. Convenience for matching only the .identity case \u{2014} drives simple opacity / scale toggles.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".value")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 150, alignment: .leading)
                        Text("Double. Normalized to -1 (.topLeading) / 0 (.identity) / +1 (.bottomTrailing) for parametric effects like .offset or .rotation3DEffect.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }

                // Signatures.
                VStack(alignment: .leading, spacing: 4) {
                    APICallout("@frozen enum ScrollTransitionPhase")
                    APICallout("case topLeading")
                    APICallout("case identity")
                    APICallout("case bottomTrailing")
                    APICallout("var isIdentity: Bool")
                    APICallout("var value: Double")
                }

                // Conformances.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Equatable, Hashable, BitwiseCopyable")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.separator, lineWidth: 1)
                        )
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Conforms to Equatable, Hashable, BitwiseCopyable.",
                        detail: "Trivially copyable; safe to capture in closures and stash inside @State.",
                        symbol: "checkmark.seal"
                    )
                    noteRow(
                        title: "At .identity the closure should not change the view.",
                        detail: "Apple's docs are explicit: visual changes belong in .topLeading and .bottomTrailing where they animate to .identity. Identity = no visual change, full stop.",
                        symbol: "circle"
                    )
                    noteRow(
                        title: "phase.value is the parametric form.",
                        detail: "Drives effects like .offset(y: phase.value * 40), .rotation3DEffect(.degrees(phase.value * 30), axis: ...). Use isIdentity for the simplest opacity / scale toggle.",
                        symbol: "slider.horizontal.3"
                    )
                    noteRow(
                        title: "isIdentity returns true only for .identity.",
                        detail: "Both .topLeading and .bottomTrailing return false \u{2014} so `phase.isIdentity ? 1 : 0` collapses both edges to the same off-state in one expression.",
                        symbol: "function"
                    )
                    noteRow(
                        title: "Pair with EmptyVisualEffect inside the closure.",
                        detail: "The closure's first parameter is an EmptyVisualEffect; chain .opacity, .scaleEffect, .offset, .blur, or .rotation3DEffect onto it and return 'some VisualEffect'.",
                        symbol: "wand.and.stars"
                    )
                }
            }
        }
    }

    // MARK: Reference (ScrollTransitionConfiguration struct)

    private var configurationReferenceSection: some View {
        PageSection("Reference (ScrollTransitionConfiguration)", subtitle: "struct ScrollTransitionConfiguration \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Blurb.
                Text("The configuration of a scroll transition. Controls how a transition is applied as a view is scrolled through the visible region of a containing scroll view. Pass values of this type to .scrollTransition as the first parameter (or the topLeading / bottomTrailing parameters of the asymmetric form).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                // Factory entry points.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Factory entry points")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".interactive")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 170, alignment: .leading)
                        Text("Default. Ties the transition's progress directly to the scroll position; the user 'scrubs' through phases.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".animated")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 170, alignment: .leading)
                        Text("The transition plays as a timed animation from .topLeading / .bottomTrailing toward .identity, ignoring scroll velocity.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".identity")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 170, alignment: .leading)
                        Text("No-op configuration; mostly for completeness when one edge of an asymmetric pair shouldn't transition.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }

                // Parameterized variants.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Parameterized variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("static func animated(_ animation: Animation) -> ScrollTransitionConfiguration")
                    APICallout("static func interactive(timingCurve: UnitCurve) -> ScrollTransitionConfiguration")
                    Text("animated(_:) accepts a custom timing curve (.easeInOut, .spring, .bouncy). interactive(timingCurve:) tunes how scroll position maps to phase progression.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Tuning methods.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Tuning methods")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("func animation(_ animation: Animation) -> ScrollTransitionConfiguration")
                    APICallout("func threshold(_ threshold: Threshold) -> ScrollTransitionConfiguration")
                    Text("animation(_:) replaces the animation on an animated config. threshold(_:) shifts when the transition triggers \u{2014} ScrollTransitionConfiguration.Threshold values include .visible, .visible(_:), .centered, .hidden.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Signatures.
                VStack(alignment: .leading, spacing: 4) {
                    APICallout("struct ScrollTransitionConfiguration")
                    APICallout("static var identity: ScrollTransitionConfiguration")
                    APICallout("static var animated: ScrollTransitionConfiguration")
                    APICallout("static func animated(_ animation: Animation) -> ScrollTransitionConfiguration")
                    APICallout("static var interactive: ScrollTransitionConfiguration")
                    APICallout("static func interactive(timingCurve: UnitCurve) -> ScrollTransitionConfiguration")
                    APICallout("func animation(_ animation: Animation) -> ScrollTransitionConfiguration")
                    APICallout("func threshold(_ threshold: Threshold) -> ScrollTransitionConfiguration")
                    APICallout("struct ScrollTransitionConfiguration.Threshold")
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".interactive is the default.",
                        detail: "Omitting a configuration (`.scrollTransition { effect, phase in \u{2026} }`) uses .interactive \u{2014} progress is tied to scroll position. Pass an explicit value to swap to time-based animation.",
                        symbol: "hand.draw"
                    )
                    noteRow(
                        title: ".animated plays time-based.",
                        detail: "Pair with .easeInOut, .spring, .bouncy, or any other Animation. The transition plays at its own pace once triggered, independent of how the user scrolls.",
                        symbol: "timer"
                    )
                    noteRow(
                        title: "Threshold values: .visible, .visible(_:), .centered, .hidden.",
                        detail: "Consult the .Threshold nested type. Different thresholds on each edge of an asymmetric pair produce intentional in/out asymmetry.",
                        symbol: "ruler"
                    )
                    noteRow(
                        title: "Use the asymmetric form to mix .interactive with .animated.",
                        detail: "Common pattern: `topLeading: .interactive, bottomTrailing: .animated(.easeOut)` \u{2014} entrance scrubs with the drag, exit eases out cleanly.",
                        symbol: "arrow.left.and.right"
                    )
                    noteRow(
                        title: ".identity is a no-op.",
                        detail: "Useful when one edge of an asymmetric pair shouldn't transition at all \u{2014} pin one side to identity and the closure runs only on the other.",
                        symbol: "circle"
                    )
                }
            }
        }
    }

    // MARK: Default scrollTransition(_:axis:transition:)

    private var defaultScrollTransitionSection: some View {
        PageSection("Default scrollTransition", subtitle: "View/scrollTransition(_:axis:transition:) \u{00b7} symmetric form \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default: opacity demo.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(
"""
.scrollTransition { effect, phase in
    effect.opacity(phase.isIdentity ? 1 : 0.2)
}
"""
                    )
                    Text("The single-configuration form: one closure, one ScrollTransitionConfiguration applied to both edges. Drag horizontally \u{2014} cards fade as they cross the visible region's edges.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(0..<14) { i in
                                card(index: i, label: "scrollTransition")
                                    .scrollTransition { effect, phase in
                                        effect.opacity(phase.isIdentity ? 1 : 0.2)
                                    }
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    .frame(height: 140)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                // Variant: scale + opacity.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Scale + opacity")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.scrollTransition { effect, phase in
    effect
        .opacity(phase.isIdentity ? 1 : 0.3)
        .scaleEffect(phase.isIdentity ? 1 : 0.8)
}
"""
                    )
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(0..<14) { i in
                                card(index: i, label: "scale + opacity")
                                    .scrollTransition { effect, phase in
                                        effect
                                            .opacity(phase.isIdentity ? 1 : 0.3)
                                            .scaleEffect(phase.isIdentity ? 1 : 0.8)
                                    }
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    .frame(height: 140)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                // Variant: phase.value parametric.
                VStack(alignment: .leading, spacing: 8) {
                    Text("phase.value parametric")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.scrollTransition { effect, phase in
    effect.offset(y: phase.value * 40)
}
"""
                    )
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(0..<14) { i in
                                card(index: i, label: "offset y")
                                    .scrollTransition { effect, phase in
                                        effect.offset(y: phase.value * 40)
                                    }
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    .frame(height: 160)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("phase.value is in [-1, 0, +1] across the topLeading, identity, bottomTrailing phases.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                // Variant: configuration: .animated(.easeInOut).
                VStack(alignment: .leading, spacing: 8) {
                    Text("configuration: .animated(.easeInOut)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".scrollTransition(.animated(.easeInOut)) { effect, phase in \u{2026} }")
                    Text("Pass a ScrollTransitionConfiguration as the first parameter to swap interactive (default, drag-driven) for animated (timed, eased) transitions.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // States: axis: .vertical override.
                VStack(alignment: .leading, spacing: 8) {
                    Text("axis: .vertical override")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".scrollTransition(axis: .vertical) { effect, phase in \u{2026} }")
                    Text("By default the axis matches the innermost scroll view; pass an explicit axis when the scroll view scrolls in both directions and you want the transition driven by only one of them.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Identity phase = no visual change.",
                        detail: "Apple's docs are explicit: at .identity, the transition should leave the view alone. Visual changes belong in .topLeading and .bottomTrailing where they animate to .identity.",
                        symbol: "circle"
                    )
                    noteRow(
                        title: "Symmetric \u{2014} same effect in/out.",
                        detail: "This single-configuration variant uses one configuration for both edges. For different in/out behavior, use the asymmetric topLeading / bottomTrailing form below.",
                        symbol: "arrow.left.and.right"
                    )
                    noteRow(
                        title: "EmptyVisualEffect input.",
                        detail: "The effect parameter is an EmptyVisualEffect you chain modifiers onto (.opacity, .scaleEffect, .offset, .blur, .rotation3DEffect). The closure returns 'some VisualEffect'.",
                        symbol: "wand.and.stars"
                    )
                    noteRow(
                        title: "Default config is .interactive.",
                        detail: "The default ScrollTransitionConfiguration is .interactive, which ties the transition's progress to the scroll position. Pass .animated(_:) for time-based transitions instead.",
                        symbol: "slider.horizontal.3"
                    )
                    noteRow(
                        title: "axis: nil follows innermost ScrollView.",
                        detail: "If you don't pass an axis, SwiftUI uses the innermost containing ScrollView's axis (or .vertical when both are scrollable).",
                        symbol: "arrow.up.arrow.down"
                    )
                }
            }
        }
    }

    // MARK: Top/bottom variant — scrollTransition(topLeading:bottomTrailing:axis:transition:)

    private var topBottomVariantSection: some View {
        PageSection("Top/bottom variant", subtitle: "View/scrollTransition(topLeading:bottomTrailing:axis:transition:) \u{00b7} asymmetric form \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default: interactive entrance / animated exit.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(
"""
.scrollTransition(
    topLeading: .interactive,
    bottomTrailing: .animated(.easeOut(duration: 0.5))
) { effect, phase in
    effect
        .opacity(phase.isIdentity ? 1 : 0.3)
        .scaleEffect(phase.isIdentity ? 1 : 0.8)
}
"""
                    )
                    Text("Like the symmetric form but takes two ScrollTransitionConfiguration values \u{2014} one for the leading edge and one for the trailing edge \u{2014} so the entrance and exit can use different timings.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(0..<14) { i in
                                card(index: i, label: "asym")
                                    .scrollTransition(
                                        topLeading: .interactive,
                                        bottomTrailing: .animated(.easeOut(duration: 0.5))
                                    ) { effect, phase in
                                        effect
                                            .opacity(phase.isIdentity ? 1 : 0.3)
                                            .scaleEffect(phase.isIdentity ? 1 : 0.8)
                                    }
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    .frame(height: 140)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("Entrance is interactive (drag-driven); exit is animated (eased). Drag back and forth to feel the asymmetry.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                // Variant: asymmetric scale.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Asymmetric scale")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.scrollTransition(
    topLeading: .animated,
    bottomTrailing: .interactive
) { effect, phase in
    effect.scaleEffect(phase.isIdentity ? 1 : 0.6)
}
"""
                    )
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(0..<14) { i in
                                card(index: i, label: "scale")
                                    .scrollTransition(
                                        topLeading: .animated,
                                        bottomTrailing: .interactive
                                    ) { effect, phase in
                                        effect.scaleEffect(phase.isIdentity ? 1 : 0.6)
                                    }
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    .frame(height: 140)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                // Variant: asymmetric thresholds via configuration.threshold(_:).
                VStack(alignment: .leading, spacing: 8) {
                    Text("Asymmetric thresholds via configuration.threshold(_:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.scrollTransition(
    topLeading: .interactive.threshold(.visible(0.9)),
    bottomTrailing: .interactive.threshold(.visible(0.1))
) { effect, phase in \u{2026} }
"""
                    )
                    Text("ScrollTransitionConfiguration.threshold(_:) tunes when the transition triggers \u{2014} different thresholds on each edge produce intentional asymmetry.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // States: axis override.
                VStack(alignment: .leading, spacing: 8) {
                    Text("axis override")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.scrollTransition(
    topLeading: .interactive,
    bottomTrailing: .interactive,
    axis: .horizontal
) { effect, phase in \u{2026} }
"""
                    )
                    Text("As with the symmetric form, the optional axis: parameter pins the transition to one direction in scroll views that scroll in both.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Top/leading vs bottom/trailing.",
                        detail: "topLeading governs entrance from the top edge of a vertical scroll view (or leading edge of a horizontal one); bottomTrailing governs the opposite edge.",
                        symbol: "arrow.left.arrow.right"
                    )
                    noteRow(
                        title: "Both edges use the same closure.",
                        detail: "There's only one transition closure; the asymmetry is purely in the two ScrollTransitionConfiguration values that drive its phase progression.",
                        symbol: "function"
                    )
                    noteRow(
                        title: "Asymmetric in/out is the whole point.",
                        detail: "If both configurations are identical, prefer scrollTransition(_:axis:transition:) \u{2014} the single-configuration form is shorter.",
                        symbol: "scissors"
                    )
                    noteRow(
                        title: "Identity-pinned visual rules still apply.",
                        detail: "At .identity the closure should leave the view alone. The configurations control timing/threshold; the closure controls the visual change.",
                        symbol: "circle"
                    )
                    noteRow(
                        title: "Pairs with .scrollTargetLayout().",
                        detail: "Inside a ScrollView with a marked layout, scrollTransition modifiers attach to each child and the per-edge configurations animate cleanly through the visible window.",
                        symbol: "rectangle.split.3x1"
                    )
                }
            }
        }
    }

    // MARK: HIG notes (consolidated)

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on scroll transitions, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Identity is the still point of the transition.",
                    detail: "Visual changes belong on the entering and exiting edges; the moment a view is fully visible it should rest at its natural appearance. Closures that change the view at .identity create a jittery 'always-animating' look.",
                    symbol: "circle"
                )
                noteRow(
                    title: "Pick .interactive or .animated by feel.",
                    detail: ".interactive ties progress to scroll position \u{2014} the user 'scrubs' through the transition. .animated plays a timed curve regardless of scroll velocity. Mix them in the asymmetric form when entrance and exit need different feels.",
                    symbol: "slider.horizontal.3"
                )
                noteRow(
                    title: "phase.value for parametric, phase.isIdentity for binary.",
                    detail: "Use .value when the effect should ramp continuously (.offset, .rotation3DEffect). Use .isIdentity when the effect just toggles between visible and not-visible (.opacity, .scaleEffect).",
                    symbol: "function"
                )
                noteRow(
                    title: "Pair with .scrollTargetLayout for snappy windows.",
                    detail: "Inside a ScrollView with a marked layout, the system threads each child through the visible window cleanly \u{2014} scrollTransition closures fire in lockstep with the scroll target behavior.",
                    symbol: "rectangle.split.3x1"
                )
                noteRow(
                    title: "Don't pile on \u{2014} one or two effects per closure.",
                    detail: "Stacking opacity + scale + offset + blur in one closure obscures the per-row content and reads as motion noise. Pick the one or two that carry the meaning of 'this row is leaving' best.",
                    symbol: "minus.circle"
                )
                noteRow(
                    title: "Thresholds tune trigger timing.",
                    detail: "ScrollTransitionConfiguration.threshold(_:) shifts where the transition starts. Use larger thresholds on the entrance to stage the effect later, smaller thresholds on the exit to pin views in place longer.",
                    symbol: "ruler"
                )
                noteRow(
                    title: "Respects Reduce Motion.",
                    detail: "Like other SwiftUI transitions, scroll transitions honor the system Reduce Motion accessibility setting \u{2014} effects gated by phase.value smoothly degrade because the framework dampens the underlying motion.",
                    symbol: "figure.walk"
                )
            }
        }
    }

    // MARK: Card helper

    private func card(index: Int, label: String) -> some View {
        VStack(alignment: .leading) {
            Text("\(index)")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Spacer()
            Text(label)
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .padding(12)
        .frame(width: 120, height: 90)
        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 8))
    }

    // MARK: Note row helper

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

#Preview {
    ScrollTransitionPage()
        .frame(width: 1100, height: 1100)
}
