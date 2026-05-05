import SwiftUI

// SwiftUI `VerticalAlignment` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/verticalalignment.md
// macOS 10.15+. Named guide on the vertical axis.

struct VerticalAlignmentDescribePage: View {
    var body: some View {
        DescribePage(
            title: "VerticalAlignment",
            docPath: "Documentation/SwiftUI/layout-adjustments/verticalalignment.md",
            availability: "macOS 10.15+",
            blurb: """
            An alignment position along the vertical axis. Use VerticalAlignment values to \
            initialize an HStack or to override a child's vertical guide via the alignmentGuide \
            modifier.

            Built-in guides:
            \u{2022} .top \u{2014} the view's top edge.
            \u{2022} .center \u{2014} the view's vertical centerline.
            \u{2022} .bottom \u{2014} the view's bottom edge.
            \u{2022} .firstTextBaseline \u{2014} the baseline of the first text in the view.
            \u{2022} .lastTextBaseline \u{2014} the baseline of the last text in the view.

            firstTextBaseline / lastTextBaseline are the right answer when aligning labels of \
            mixed font sizes \u{2014} they line up the type baselines, not the visual centers.

            Add custom vertical guides by extending VerticalAlignment with a static let backed by \
            a private struct conforming to AlignmentID.
            """,
            signatures: [
                "struct VerticalAlignment",
                "HStack(alignment: .firstTextBaseline) { ... }",
                "static let top, center, bottom, firstTextBaseline, lastTextBaseline",
                "extension VerticalAlignment { static let custom = VerticalAlignment(MyID.self) }"
            ],
            notes: [
                "Conforms to Equatable, Sendable.",
                "firstTextBaseline / lastTextBaseline only resolve through Text views \u{2014} a stack of plain images falls back to .center.",
                "Custom VerticalAlignment combines with a HorizontalAlignment via Alignment(horizontal:vertical:)."
            ]
        )
    }
}

#Preview {
    VerticalAlignmentDescribePage().frame(width: 900, height: 700)
}
