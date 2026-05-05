import SwiftUI

// SwiftUI `HorizontalEdge` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/horizontaledge.md
// macOS 12.0+. Enum + HorizontalEdge.Set OptionSet.

struct HorizontalEdgeDescribePage: View {
    var body: some View {
        DescribePage(
            title: "HorizontalEdge",
            docPath: "Documentation/SwiftUI/layout-adjustments/horizontaledge.md",
            availability: "macOS 12.0+",
            blurb: """
            An enum that names one horizontal edge of a rectangle. The two-axis subset of Edge \u{2014} \
            modifiers that only accept a horizontal edge (e.g., the HorizontalEdge overload of \
            safeAreaInset) take this instead of full Edge to make the API more precise.

            Cases:
            \u{2022} .leading \u{2014} the leading horizontal edge in the current layout direction.
            \u{2022} .trailing \u{2014} the trailing horizontal edge in the current layout direction.

            HorizontalEdge.Set is the matching OptionSet. Aggregate helpers: .all = both edges. \
            Combine via array literal or set algebra.

            When to use vs. Edge: prefer HorizontalEdge when the modifier doesn't make sense for \
            top/bottom (sidebar inset, leading/trailing-only padding sets) \u{2014} the type system \
            then rules out non-horizontal cases at compile time.
            """,
            signatures: [
                "@frozen enum HorizontalEdge { case leading, trailing }",
                "struct HorizontalEdge.Set: OptionSet",
                "static let all: HorizontalEdge.Set",
                ".safeAreaInset(edge: HorizontalEdge.trailing) { … }"
            ],
            notes: [
                "HorizontalEdge conforms to CaseIterable, Hashable, Sendable, RawRepresentable (Int8).",
                "HorizontalEdge.Set conforms to OptionSet, SetAlgebra, ExpressibleByArrayLiteral, BitwiseCopyable.",
                ".leading / .trailing honor layout direction.",
                "Companion type: VerticalEdge for the .top/.bottom counterpart."
            ]
        )
    }
}

#Preview {
    HorizontalEdgeDescribePage().frame(width: 900, height: 700)
}
