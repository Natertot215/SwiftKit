import SwiftUI

// SwiftUI `AlignmentID` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/alignmentid.md
// macOS 10.15+. Protocol for custom alignment guides.

struct AlignmentIDDescribePage: View {
    var body: some View {
        DescribePage(
            title: "AlignmentID",
            docPath: "Documentation/SwiftUI/layout-adjustments/alignmentid.md",
            availability: "macOS 10.15+",
            blurb: """
            A type that you use to create custom alignment guides. Conform a private nested struct \
            to AlignmentID, then wrap it in a static let on HorizontalAlignment or VerticalAlignment.

            The protocol has one requirement:

                static func defaultValue(in context: ViewDimensions) -> CGFloat

            The default value is what views report for this guide when they haven't been opted in \
            via .alignmentGuide. Common patterns: forward to an existing built-in guide \
            (d[HorizontalAlignment.center], d[.bottom], d[.firstTextBaseline]) or compute from \
            d.width / d.height.

            Pair AlignmentID with .alignmentGuide(_:computeValue:) on individual children to thread \
            a custom guide through a hierarchy \u{2014} this is the mechanism that aligns siblings \
            across separate stacks.
            """,
            signatures: [
                "protocol AlignmentID { static func defaultValue(in context: ViewDimensions) -> CGFloat }",
                "private struct MyAlignment: AlignmentID { static func defaultValue(in d: ViewDimensions) -> CGFloat { d[.bottom] } }",
                "extension VerticalAlignment { static let myAlign = VerticalAlignment(MyAlignment.self) }"
            ],
            notes: [
                "AlignmentID conforms to nothing other than itself \u{2014} it has no concrete storage.",
                "The defaultValue is consulted only when a view doesn't explicitly set the guide via .alignmentGuide.",
                "Subscript ViewDimensions with a built-in guide to read its current resolved offset and forward it."
            ]
        )
    }
}

#Preview {
    AlignmentIDDescribePage().frame(width: 900, height: 700)
}
