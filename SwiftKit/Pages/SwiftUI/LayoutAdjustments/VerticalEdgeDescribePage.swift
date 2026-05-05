import SwiftUI

// SwiftUI `VerticalEdge` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/verticaledge.md
// macOS 12.0+. Enum + VerticalEdge.Set OptionSet.

struct VerticalEdgeDescribePage: View {
    var body: some View {
        DescribePage(
            title: "VerticalEdge",
            docPath: "Documentation/SwiftUI/layout-adjustments/verticaledge.md",
            availability: "macOS 12.0+",
            blurb: """
            An enum that names one vertical edge of a rectangle. The two-axis subset of Edge \u{2014} \
            modifiers that only accept a vertical edge (e.g., the VerticalEdge overload of \
            safeAreaInset) take this instead of full Edge to make the API more precise.

            Cases:
            \u{2022} .top \u{2014} the upper edge.
            \u{2022} .bottom \u{2014} the lower edge.

            VerticalEdge.Set is the matching OptionSet. Aggregate helpers: .all = both edges. \
            Combine via array literal or set algebra.

            When to use vs. Edge: prefer VerticalEdge when the modifier doesn't make sense for \
            leading/trailing (top bars, bottom toolbars, vertical safeAreaInset) \u{2014} the type \
            system then rules out non-vertical cases at compile time.
            """,
            signatures: [
                "@frozen enum VerticalEdge { case top, bottom }",
                "struct VerticalEdge.Set: OptionSet",
                "static let all: VerticalEdge.Set",
                ".safeAreaInset(edge: VerticalEdge.bottom) { … }"
            ],
            notes: [
                "VerticalEdge conforms to CaseIterable, Hashable, Sendable, RawRepresentable (Int8).",
                "VerticalEdge.Set conforms to OptionSet, SetAlgebra, ExpressibleByArrayLiteral, BitwiseCopyable.",
                "Companion type: HorizontalEdge for the .leading/.trailing counterpart."
            ]
        )
    }
}

#Preview {
    VerticalEdgeDescribePage().frame(width: 900, height: 700)
}
