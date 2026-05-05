import SwiftUI

// SwiftUI `ScrollTransitionConfiguration` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrolltransitionconfiguration.md
// macOS 14.0+. Configures how a scroll transition animates between phases.

struct ScrollTransitionConfigurationDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollTransitionConfiguration",
            docPath: "Documentation/SwiftUI/scroll-views/scrolltransitionconfiguration.md",
            availability: "macOS 14.0+",
            blurb: """
            The configuration of a scroll transition. Controls how a transition is applied \
            as a view is scrolled through the visible region of a containing scroll view.

            Two factory entry points:
            \u{2022} .interactive (default) \u{2014} ties the transition's progress directly \
              to the scroll position; the user 'scrubs' through phases.
            \u{2022} .animated \u{2014} the transition plays as a timed animation from \
              topLeading/bottomTrailing to identity, ignoring scroll velocity.

            Both factory entry points have parameterized variants:
            \u{2022} .animated(_: Animation) \u{2014} provide a custom timing curve.
            \u{2022} .interactive(timingCurve:) \u{2014} adjust how scroll position maps to phase.

            And two tuning methods:
            \u{2022} animation(_:) \u{2014} replace the animation on an animated config.
            \u{2022} threshold(_:) \u{2014} change when the transition triggers \
              (ScrollTransitionConfiguration.Threshold).

            See View/scrollTransition for working uses; this type is what you pass as the \
            first parameter (or the topLeading/bottomTrailing parameters).
            """,
            signatures: [
                "struct ScrollTransitionConfiguration",
                "static var identity: ScrollTransitionConfiguration",
                "static var animated: ScrollTransitionConfiguration",
                "static func animated(_ animation: Animation) -> ScrollTransitionConfiguration",
                "static var interactive: ScrollTransitionConfiguration",
                "static func interactive(timingCurve: UnitCurve) -> ScrollTransitionConfiguration",
                "func animation(_ animation: Animation) -> ScrollTransitionConfiguration",
                "func threshold(_ threshold: Threshold) -> ScrollTransitionConfiguration",
                "struct ScrollTransitionConfiguration.Threshold"
            ],
            notes: [
                ".interactive is the default \u{2014} omitting a configuration uses it.",
                ".animated plays time-based; pair with .easeInOut, .spring, .bouncy etc.",
                "Threshold values include .visible, .visible(_:), .centered, .hidden \u{2014} consult the .Threshold nested type.",
                "Use the asymmetric scrollTransition(topLeading:bottomTrailing:axis:transition:) form to mix .interactive entrance with .animated exit.",
                "The .identity static is mostly for completeness \u{2014} it makes the transition a no-op."
            ]
        )
    }
}

#Preview {
    ScrollTransitionConfigurationDescribePage().frame(width: 900, height: 700)
}
