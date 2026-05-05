import SwiftUI

// SwiftUI `ScrollTransitionPhase` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrolltransitionphase.md
// macOS 14.0+. Enum that drives a scroll-transition's progression across the visible region.

struct ScrollTransitionPhaseDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollTransitionPhase",
            docPath: "Documentation/SwiftUI/scroll-views/scrolltransitionphase.md",
            availability: "macOS 14.0+",
            blurb: """
            The phases that a view transitions between when it scrolls among other views. \
            Inside the closure passed to .scrollTransition(_:axis:transition:), this enum \
            tells you which edge of the scroll view's visible region the view is in or \
            approaching from.

            Three cases:
            \u{2022} topLeading \u{2014} the view is entering / exiting the top (vertical) or \
              leading (horizontal) edge.
            \u{2022} identity \u{2014} the view is fully inside the visible region. Apple's \
              guidance: don't apply visual changes here.
            \u{2022} bottomTrailing \u{2014} the view is entering / exiting the bottom \
              (vertical) or trailing (horizontal) edge.

            Two derived properties:
            \u{2022} isIdentity \u{2014} convenience for matching only the identity case.
            \u{2022} value \u{2014} a Double normalized to -1 (topLeading) / 0 (identity) / +1 \
              (bottomTrailing) for parametric effects.

            See View/scrollTransition(_:axis:transition:) for working closures that read this.
            """,
            signatures: [
                "@frozen enum ScrollTransitionPhase",
                "case topLeading",
                "case identity",
                "case bottomTrailing",
                "var isIdentity: Bool",
                "var value: Double"
            ],
            notes: [
                "Conforms to Equatable, Hashable, BitwiseCopyable.",
                "Apple's docs are explicit: at identity, the closure should not change the view.",
                "phase.value is the convenient parametric form: drives .offset(y: phase.value * 40) etc.",
                "isIdentity returns true only for .identity \u{2014} the simplest opacity/scale toggle.",
                "Pair with EmptyVisualEffect (the closure's first parameter) and chain .opacity, .scaleEffect, .offset, .blur, .rotation3DEffect."
            ]
        )
    }
}

#Preview {
    ScrollTransitionPhaseDescribePage().frame(width: 900, height: 700)
}
