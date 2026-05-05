import SwiftUI

// SwiftUI `ScrollBounceBehavior` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollbouncebehavior.md
// macOS 13.3+.

struct ScrollBounceBehaviorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollBounceBehavior",
            docPath: "Documentation/SwiftUI/scroll-views/scrollbouncebehavior.md",
            availability: "macOS 13.3+",
            blurb: """
            A struct describing how a scrollable view bounces when the user \
            scrolls past the end of its content. You pass values of this type \
            to scrollBounceBehavior(_:axes:) (or to the \
            horizontalScrollBounceBehavior / verticalScrollBounceBehavior \
            environment keys for finer control).

            Three cases:
            \u{2022} automatic \u{2014} the platform's default. On macOS, scroll views \
              typically bounce only when content exceeds the container.
            \u{2022} always \u{2014} the scroll view rubber-bands at every edge \
              regardless of content size.
            \u{2022} basedOnSize \u{2014} bounce only when content is actually larger \
              than the container; short or empty content stays put.

            For a working demo, see View/scrollBounceBehavior(_:axes:).
            """,
            signatures: [
                "struct ScrollBounceBehavior",
                "static let automatic: ScrollBounceBehavior",
                "static let always: ScrollBounceBehavior",
                "static let basedOnSize: ScrollBounceBehavior"
            ],
            notes: [
                "Conforms to Sendable. Stored as an environment value, so wrapping a screen with .scrollBounceBehavior cascades to descendants.",
                "basedOnSize is the standard fix for List bouncing when only one or two rows are present.",
                "Each axis can carry its own bounce behavior \u{2014} the modifier and the horizontal/verticalScrollBounceBehavior environment keys are axis-specific.",
                "Pre-13.3: not available \u{2014} earlier scroll views always bounced (iOS-style)."
            ]
        )
    }
}

#Preview {
    ScrollBounceBehaviorDescribePage().frame(width: 900, height: 700)
}
