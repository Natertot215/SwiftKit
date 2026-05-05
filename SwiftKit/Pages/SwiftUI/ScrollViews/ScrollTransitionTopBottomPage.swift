import SwiftUI

// SwiftUI `View/scrollTransition(topLeading:bottomTrailing:axis:transition:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrolltransition(topleading:bottomtrailing:axis:transition:).md
// macOS 14.0+. Like scrollTransition(_:) but configures the entering and exiting edges separately.

struct ScrollTransitionTopBottomPage: View {
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
            Text("View/scrollTransition(topLeading:bottomTrailing:axis:transition:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Like scrollTransition(_:axis:transition:) but takes two ScrollTransitionConfiguration values \u{2014} one for the leading edge and one for the trailing edge \u{2014} so the entrance and exit can use different timings.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrolltransition(topleading:bottomtrailing:axis:transition:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
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
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(0..<14) { i in
                        card(index: i)
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
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Asymmetric scale") {
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
                            card(index: i)
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

            VariantRow(title: "Asymmetric thresholds via configuration.threshold(_:)") {
                APICallout(
"""
.scrollTransition(
    topLeading: .interactive.threshold(.visible(0.9)),
    bottomTrailing: .interactive.threshold(.visible(0.1))
) { effect, phase in \u{2026} }
"""
                )
                Text("ScrollTransitionConfiguration.threshold(_:) tunes when the transition triggers \u{2014} different thresholds on each edge produce intentional asymmetry.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "axis override") {
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
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Top/leading vs bottom/trailing.", "topLeading governs entrance from the top edge of a vertical scroll view (or leading edge of a horizontal one); bottomTrailing governs the opposite edge.", "arrow.left.arrow.right"),
        ("Both edges use the same closure.", "There's only one transition closure; the asymmetry is purely in the two ScrollTransitionConfiguration values that drive its phase progression.", "function"),
        ("Asymmetric in/out is the whole point.", "If both configurations are identical, prefer scrollTransition(_:axis:transition:) \u{2014} the single-configuration form is shorter.", "scissors"),
        ("Identity-pinned visual rules still apply.", "At .identity the closure should leave the view alone. The configurations control timing/threshold; the closure controls the visual change.", "circle"),
        ("Pairs with .scrollTargetLayout().", "Inside a ScrollView with a marked layout, scrollTransition modifiers attach to each child and the per-edge configurations animate cleanly through the visible window.", "rectangle.split.3x1")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }

    private func card(index: Int) -> some View {
        VStack(alignment: .leading) {
            Text("\(index)").font(.title).fontWeight(.semibold).foregroundStyle(.primary)
            Spacer()
            Text("asym").font(.caption).foregroundStyle(.tertiary)
        }
        .padding(12)
        .frame(width: 120, height: 90)
        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 8))
    }

    private struct VariantRow<Content: View>: View {
        let title: String
        @ViewBuilder var content: () -> Content
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.headline).foregroundStyle(.primary)
                content()
            }
        }
    }
}

#Preview {
    ScrollTransitionTopBottomPage().frame(width: 1100, height: 1100)
}
