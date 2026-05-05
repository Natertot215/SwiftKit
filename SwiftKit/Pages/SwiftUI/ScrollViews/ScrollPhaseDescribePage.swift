import SwiftUI

// SwiftUI `ScrollPhase` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollphase.md
// macOS 15.0+. Enum reporting the current state of a scroll gesture.

struct ScrollPhaseDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollPhase",
            docPath: "Documentation/SwiftUI/scroll-views/scrollphase.md",
            availability: "macOS 15.0+",
            blurb: """
            A frozen enum describing the state of a scroll gesture. SwiftUI \
            hands you a ScrollPhase value as the second argument of \
            onScrollPhaseChange(_:).

            Five cases, in order of typical lifecycle:
            \u{2022} idle \u{2014} no scrolling activity.
            \u{2022} tracking \u{2014} the user has started a touch but no movement yet.
            \u{2022} interacting \u{2014} active drag is in progress.
            \u{2022} decelerating \u{2014} the user released; the scroll view is coasting.
            \u{2022} animating \u{2014} a programmatic scroll (ScrollPosition.scrollTo, ScrollViewReader) is animating to a target.

            isScrolling collapses .tracking, .interacting, .decelerating, and \
            .animating into a single Bool when you don't care which kind of \
            non-idle state is in play.

            For a working demo, see View/onScrollPhaseChange(_:).
            """,
            signatures: [
                "@frozen enum ScrollPhase",
                "case idle",
                "case tracking",
                "case interacting",
                "case decelerating",
                "case animating",
                "var isScrolling: Bool"
            ],
            notes: [
                "Conforms to Equatable, Hashable, Sendable, BitwiseCopyable, CustomDebugStringConvertible.",
                "tracking is brief \u{2014} it's the gap between touch-down and the first movement update.",
                "decelerating only fires after a real-world drag that built up velocity; trackpad flicks always go through it.",
                "animating means scrollPosition.scrollTo or ScrollViewProxy.scrollTo with animation drove the change \u{2014} not the user.",
                "Pre-15: not available."
            ]
        )
    }
}

#Preview {
    ScrollPhaseDescribePage().frame(width: 900, height: 700)
}
