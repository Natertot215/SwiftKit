import SwiftUI

// SwiftUI `ScrollPhaseChangeContext` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollphasechangecontext.md
// macOS 15.0+. Context value passed to the 3-argument form of onScrollPhaseChange.

struct ScrollPhaseChangeContextDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollPhaseChangeContext",
            docPath: "Documentation/SwiftUI/scroll-views/scrollphasechangecontext.md",
            availability: "macOS 15.0+",
            blurb: """
            A value type SwiftUI hands to the optional third argument of \
            onScrollPhaseChange(_:). It captures the scroll view's situation \
            at the exact moment the phase transitioned.

            Two properties:
            \u{2022} geometry \u{2014} a ScrollGeometry snapshot taken at the transition.
            \u{2022} velocity \u{2014} the current scroll velocity (CGVector?), available during user-driven phases.

            Use this to react to direction (compare successive .interacting \
            geometries), enter momentum mode at a known offset, or know how \
            fast the user was flicking when their finger lifted.

            You don't construct this type yourself.

            For a working demo, see View/onScrollPhaseChange(_:).
            """,
            signatures: [
                "struct ScrollPhaseChangeContext",
                "var geometry: ScrollGeometry",
                "var velocity: CGVector?",
                "// usage:",
                ".onScrollPhaseChange { oldPhase, newPhase, context in … }"
            ],
            notes: [
                "Only the 3-argument onScrollPhaseChange closure receives a context. The 2-argument form gives you (old, new) only.",
                "velocity may be nil \u{2014} for example, the transition into .idle from .animating doesn't carry user velocity.",
                "geometry is the same ScrollGeometry value you'd see from onScrollGeometryChange, snapshotted at the transition.",
                "Don't store the context across frames; capture only the primitives you need (offset, velocity components) into your own state."
            ]
        )
    }
}

#Preview {
    ScrollPhaseChangeContextDescribePage().frame(width: 900, height: 700)
}
