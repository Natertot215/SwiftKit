import SwiftUI

// SwiftUI `HorizontalAlignment` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/horizontalalignment.md
// macOS 10.15+. Named guide on the horizontal axis.

struct HorizontalAlignmentDescribePage: View {
    var body: some View {
        DescribePage(
            title: "HorizontalAlignment",
            docPath: "Documentation/SwiftUI/layout-adjustments/horizontalalignment.md",
            availability: "macOS 10.15+",
            blurb: """
            An alignment position along the horizontal axis. Use HorizontalAlignment values to \
            initialize a VStack or to override a child's horizontal guide via the alignmentGuide \
            modifier.

            Built-in guides:
            \u{2022} .leading \u{2014} the view's leading edge in the current layout direction.
            \u{2022} .center \u{2014} the view's horizontal centerline.
            \u{2022} .trailing \u{2014} the view's trailing edge in the current layout direction.

            Add custom horizontal guides by extending HorizontalAlignment with a static let backed \
            by a private struct conforming to AlignmentID. Used with the alignmentGuide modifier, \
            this enables aligning views across separate sibling stacks (see \"Aligning views \
            across stacks\").
            """,
            signatures: [
                "struct HorizontalAlignment",
                "VStack(alignment: .leading) { ... }",
                "extension HorizontalAlignment { static let custom = HorizontalAlignment(MyID.self) }",
                "private struct MyID: AlignmentID { static func defaultValue(in d: ViewDimensions) -> CGFloat { d[HorizontalAlignment.center] } }"
            ],
            notes: [
                "Conforms to Equatable, Sendable.",
                "Honors layout direction \u{2014} .leading flips to the right edge in right-to-left locales.",
                "Custom HorizontalAlignment can be combined with a VerticalAlignment to form a custom Alignment."
            ]
        )
    }
}

#Preview {
    HorizontalAlignmentDescribePage().frame(width: 900, height: 700)
}
