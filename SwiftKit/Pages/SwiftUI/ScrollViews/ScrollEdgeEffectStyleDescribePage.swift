import SwiftUI

// SwiftUI `ScrollEdgeEffectStyle` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrolledgeeffectstyle.md
// macOS 26.0+.

struct ScrollEdgeEffectStyleDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollEdgeEffectStyle",
            docPath: "Documentation/SwiftUI/scroll-views/scrolledgeeffectstyle.md",
            availability: "macOS 26.0+",
            blurb: """
            A struct describing the visual style of the soft pocket / fade a \
            scroll view renders at its edges. SwiftUI uses an automatic edge \
            effect by default; this type is the value you pass to \
            scrollEdgeEffectStyle(_:for:) to override it.

            Three styles:
            \u{2022} automatic \u{2014} the platform's default, typically a soft fade.
            \u{2022} soft \u{2014} explicit gentle feather.
            \u{2022} hard \u{2014} crisp cut with no feather; the content terminates \
              at a sharp boundary instead of fading.

            Combine with scrollEdgeEffectHidden(_:for:) when you want no edge \
            treatment at all; combine with safeAreaBar to make a sidebar / \
            inspector and the scroll content share a coordinated boundary.

            For a working demo, see View/scrollEdgeEffectStyle(_:for:).
            """,
            signatures: [
                "struct ScrollEdgeEffectStyle",
                "static let automatic: ScrollEdgeEffectStyle",
                "static let soft: ScrollEdgeEffectStyle",
                "static let hard: ScrollEdgeEffectStyle"
            ],
            notes: [
                "Conforms to Equatable, Hashable, Sendable. Compare values with == when reading from environment or state.",
                "The modifier signature accepts ScrollEdgeEffectStyle? \u{2014} pass nil to defer to inherited / system default for that edge.",
                "Each Edge.Set entry can carry a different style. Mixed styles per edge are common when a scroll view sits between two different adjacent surfaces.",
                "Pre-26: not available \u{2014} earlier macOS used the iOS-style scroll edge fade, with no public knob to override it."
            ]
        )
    }
}

#Preview {
    ScrollEdgeEffectStyleDescribePage().frame(width: 900, height: 700)
}
