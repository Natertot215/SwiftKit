import SwiftUI

// SwiftUI `View/scrollTransition(_:axis:transition:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrolltransition(_:axis:transition:).md
// macOS 14.0+. Animates a view across ScrollTransitionPhase values as it enters/exits the visible region.

struct ScrollTransitionPage: View {
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
            Text("View/scrollTransition(_:axis:transition:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Applies a transition to each child of a ScrollView, animating between phases as the view enters and exits the visible region. The transition closure reads ScrollTransitionPhase to drive a VisualEffect.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrolltransition(_:axis:transition:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            APICallout(
"""
.scrollTransition { effect, phase in
    effect.opacity(phase.isIdentity ? 1 : 0)
}
"""
            )
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(0..<14) { i in
                        card(index: i)
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
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Scale + opacity") {
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
                            card(index: i)
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

            VariantRow(title: "phase.value parametric") {
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
                            card(index: i)
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
                    .font(.caption).foregroundStyle(.tertiary)
            }

            VariantRow(title: "configuration: .animated(.easeInOut)") {
                APICallout(".scrollTransition(.animated(.easeInOut)) { effect, phase in \u{2026} }")
                Text("Pass a ScrollTransitionConfiguration as the first parameter to swap interactive (default, drag-driven) for animated (timed, eased) transitions.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "axis: .vertical override") {
            APICallout(".scrollTransition(axis: .vertical) { effect, phase in \u{2026} }")
            Text("By default the axis matches the innermost scroll view; pass an explicit axis when the scroll view scrolls in both directions and you want the transition driven by only one of them.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Identity phase = no visual change.", "Apple's docs are explicit: at .identity, the transition should leave the view alone. Visual changes belong in .topLeading and .bottomTrailing where they animate to .identity.", "circle"),
        ("Symmetric \u{2014} same effect in/out.", "This single-configuration variant uses one configuration for both edges. For different in/out behavior, use scrollTransition(topLeading:bottomTrailing:axis:transition:).", "arrow.left.and.right"),
        ("EmptyVisualEffect input.", "The effect parameter is an EmptyVisualEffect you chain modifiers onto (.opacity, .scaleEffect, .offset, .blur, .rotation3DEffect). The closure returns 'some VisualEffect'.", "wand.and.stars"),
        ("Default config is .interactive.", "The default ScrollTransitionConfiguration is .interactive, which ties the transition's progress to the scroll position. Pass .animated(_:) for time-based transitions instead.", "slider.horizontal.3"),
        ("axis: nil follows innermost ScrollView.", "If you don't pass an axis, SwiftUI uses the innermost containing ScrollView's axis (or .vertical when both are scrollable).", "arrow.up.arrow.down")
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
            Text("scrollTransition").font(.caption).foregroundStyle(.tertiary)
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
    ScrollTransitionPage().frame(width: 1100, height: 1100)
}
