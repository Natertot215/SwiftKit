import SwiftUI

// SwiftUI `Edge` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/edge.md
// macOS 10.15+. Enum + Edge.Set OptionSet.

struct EdgeDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Edge",
            docPath: "Documentation/SwiftUI/layout-adjustments/edge.md",
            availability: "macOS 10.15+",
            blurb: """
            An enum that names a single edge of a rectangle. Used by transition modifiers \
            (.move(edge:)), padding, safe-area APIs, and many others as either a single Edge or as \
            a member of the Edge.Set OptionSet.

            Cases:
            \u{2022} .top
            \u{2022} .bottom
            \u{2022} .leading \u{2014} the leading edge in the current layout direction (left in LTR, right in RTL)
            \u{2022} .trailing \u{2014} the trailing edge in the current layout direction

            Edge.Set is a nested OptionSet that combines edges. It exposes the same per-edge cases \
            plus aggregate helpers .horizontal ([.leading, .trailing]), .vertical ([.top, .bottom]), \
            and .all (all four). Modifiers that take a set of edges \u{2014} padding(_:_:), \
            ignoresSafeArea(_:edges:), border(_:width:), etc. \u{2014} accept Edge.Set values, \
            commonly via array literal: [.top, .leading].
            """,
            signatures: [
                "@frozen enum Edge { case top, leading, bottom, trailing }",
                "struct Edge.Set: OptionSet",
                "static let all: Edge.Set  //  .horizontal  .vertical  .top  .bottom  .leading  .trailing",
                ".padding([.top, .leading], 16)",
                ".transition(.move(edge: .trailing))"
            ],
            notes: [
                "Edge conforms to CaseIterable, Hashable, Sendable, RawRepresentable (Int8).",
                "Edge.Set conforms to OptionSet, SetAlgebra, ExpressibleByArrayLiteral, BitwiseCopyable.",
                ".leading / .trailing honor layout direction \u{2014} use them instead of .left / .right (which don't exist on Edge for this reason)."
            ]
        )
    }
}

#Preview {
    EdgeDescribePage().frame(width: 900, height: 700)
}
