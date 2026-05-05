import SwiftUI

// SwiftUI `ScrollTargetBehaviorContext` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrolltargetbehaviorcontext.md
// macOS 14.0+. Read-only context passed to ScrollTargetBehavior.updateTarget(_:context:).

struct ScrollTargetBehaviorContextDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollTargetBehaviorContext",
            docPath: "Documentation/SwiftUI/scroll-views/scrolltargetbehaviorcontext.md",
            availability: "macOS 14.0+",
            blurb: """
            The context in which a scroll target behavior updates its scroll target. \
            SwiftUI hands you a value of this type as the second parameter of \
            ScrollTargetBehavior.updateTarget(_:context:); read it to make decisions \
            about where to redirect the target.

            The context exposes:
            \u{2022} axes \u{2014} the Axis.Set the scroll view scrolls in.
            \u{2022} containerSize \u{2014} the visible region's CGSize.
            \u{2022} contentSize \u{2014} the underlying content's CGSize.
            \u{2022} originalTarget \u{2014} the target SwiftUI projected before your behavior ran.
            \u{2022} velocity \u{2014} the gesture's terminal velocity (CGVector).

            ScrollTargetBehaviorContext is also @dynamicMemberLookup, so you can read \
            EnvironmentValues directly off it (e.g., context.layoutDirection). It is \
            read-only \u{2014} the only mutation you make is to the inout ScrollTarget.

            See ScrollTargetBehavior for an example that snaps to a grid using containerSize.
            """,
            signatures: [
                "@dynamicMemberLookup struct ScrollTargetBehaviorContext",
                "var axes: Axis.Set",
                "var containerSize: CGSize",
                "var contentSize: CGSize",
                "var originalTarget: ScrollTarget",
                "var velocity: CGVector",
                "subscript<T>(dynamicMember: KeyPath<EnvironmentValues, T>) -> T"
            ],
            notes: [
                "Read-only \u{2014} all writes go to the inout ScrollTarget passed alongside it.",
                "originalTarget is what SwiftUI would have used without a custom behavior \u{2014} useful as a baseline.",
                "@dynamicMemberLookup forwards to EnvironmentValues so you can branch on size class, layout direction, etc.",
                "velocity is in points per second; sign reflects scroll direction.",
                "Pair with the inout ScrollTarget parameter to redirect; use containerSize to round to page boundaries."
            ]
        )
    }
}

#Preview {
    ScrollTargetBehaviorContextDescribePage().frame(width: 900, height: 700)
}
