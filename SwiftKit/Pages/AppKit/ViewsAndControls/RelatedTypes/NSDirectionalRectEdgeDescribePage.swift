import SwiftUI

// AppKit Views and Controls / Related types describe page.
// Covers: NSDirectionalRectEdge — an OptionSet identifying one or more
// directional edges of a rectangle (.top / .leading / .bottom / .trailing /
// .all). Mirrors UIRectEdge but with directional (RTL-aware) semantics.
// Source: Documentation/AppKit/views-and-controls/nsdirectionalrectedge.md
//
// Why describe rather than render: This is a value type — an OptionSet
// (struct conforming to OptionSet, RawRepresentable, ExpressibleByArrayLiteral).
// No visible representation on its own.

struct NSDirectionalRectEdgeDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSDirectionalRectEdge",
            docPath: "Documentation/AppKit/views-and-controls/nsdirectionalrectedge.md",
            availability: "macOS 10.15+",
            blurb: """
            An OptionSet identifying one or more directional edges of a \
            rectangle. Unlike NSRectEdge (which uses left/right), this type \
            uses leading/trailing so the same value flips correctly under \
            right-to-left layouts.

            Type properties (combinable):

              \u{2022} .top, .bottom — vertical edges.
              \u{2022} .leading, .trailing — horizontal edges, layout-direction \
            aware.
              \u{2022} .all — every edge, equivalent to [.top, .leading, \
            .bottom, .trailing].

            Use array-literal syntax to combine: [.top, .leading]. Empty set \
            ([]) means "no edges."
            """,
            signatures: [
                "struct NSDirectionalRectEdge : OptionSet",
                "init(rawValue: UInt)",
                "static let top: NSDirectionalRectEdge",
                "static let leading: NSDirectionalRectEdge",
                "static let bottom: NSDirectionalRectEdge",
                "static let trailing: NSDirectionalRectEdge",
                "static let all: NSDirectionalRectEdge",
                "// Conforms to: OptionSet, ExpressibleByArrayLiteral, RawRepresentable, BitwiseCopyable, Equatable, SetAlgebra, Sendable"
            ],
            notes: [
                "OptionSet — combine cases with array literals: [.top, .leading]. Use SetAlgebra ops (insert, remove, union, intersection) for runtime composition.",
                "Sibling of NSRectAlignment and NSDirectionalEdgeInsets — together they form AppKit's directional layout primitives.",
                "Layout-direction aware: .leading is the left edge in LTR, right in RTL. Use NSRectEdge if you need absolute (left/right) edges instead.",
                "There's nothing to render for an OptionSet on its own. See AppKit APIs that consume directional rect edges for live examples."
            ]
        )
    }
}

#Preview {
    NSDirectionalRectEdgeDescribePage()
        .frame(width: 900, height: 700)
}
