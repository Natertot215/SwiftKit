import SwiftUI

// SwiftUI "Aligning views within a stack" article describe page.
// Source: Documentation/SwiftUI/layout-adjustments/aligning-views-within-a-stack.md
// Article — no platform availability stamp.

struct AligningViewsWithinAStackDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Aligning views within a stack",
            docPath: "Documentation/SwiftUI/layout-adjustments/aligning-views-within-a-stack.md",
            availability: "Article \u{2014} guide",
            blurb: """
            Stacks place their child views to match their alignment, which defaults to center. \
            Specify an alignment when initializing the stack to apply across child views, then \
            use View/alignmentGuide(_:computeValue:) to offset specific children from that base.

            Which alignment values a stack accepts:
            \u{2022} HStack uses VerticalAlignment guides (.top, .center, .bottom, .firstTextBaseline, .lastTextBaseline).
            \u{2022} VStack uses HorizontalAlignment guides (.leading, .center, .trailing).
            \u{2022} ZStack uses Alignment values \u{2014} HorizontalAlignment + VerticalAlignment combined.

            Use VerticalAlignment.firstTextBaseline on an HStack to align labels of differing \
            font sizes along the baseline of the first text, instead of the visual centerline. \
            Use the alignmentGuide modifier to override one child's reported guide value.
            """,
            signatures: [
                "HStack(alignment: .firstTextBaseline) { Image(\"microphone\"); Text(\"Connecting\").font(.caption); Text(\"Bryan\").font(.title) }",
                "VStack(alignment: .leading) { Text(\"row 1\"); Text(\"row 2\") }",
                ".alignmentGuide(.firstTextBaseline) { d in d[.bottom] }"
            ],
            notes: [
                "Default alignment for HStack is .center, for VStack is .center, for ZStack is .center.",
                "alignmentGuide closures receive a ViewDimensions with width/height plus subscript access to all named guides.",
                "For aligning items across separate stacks, see the companion article \"Aligning views across stacks\" and define a custom AlignmentID."
            ]
        )
    }
}

#Preview {
    AligningViewsWithinAStackDescribePage().frame(width: 900, height: 700)
}
