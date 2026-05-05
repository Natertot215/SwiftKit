import SwiftUI

// SwiftUI "Aligning views across stacks" article describe page.
// Source: Documentation/SwiftUI/layout-adjustments/aligning-views-across-stacks.md
// Article — no platform availability stamp.

struct AligningViewsAcrossStacksDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Aligning views across stacks",
            docPath: "Documentation/SwiftUI/layout-adjustments/aligning-views-across-stacks.md",
            availability: "Article \u{2014} guide",
            blurb: """
            By default, the alignment you specify on a stack only applies to that stack's direct \
            children. To align child views that live in different sibling stacks, define a custom \
            AlignmentID, set it on the enclosing stack, and use alignmentGuide on the participating \
            children to opt them into the new guide.

            The pattern, in three steps:
            \u{2022} Extend HorizontalAlignment or VerticalAlignment with a static let backed by a \
              private struct conforming to AlignmentID. The struct's defaultValue(in:) returns the \
              fallback used by views that don't explicitly opt in.
            \u{2022} Initialize the enclosing stack with the new alignment.
            \u{2022} Apply .alignmentGuide(.yourCustomGuide) { d in d[.someBuiltInGuide] } to each \
              child you want to participate in the alignment.

            Common use case: lining up image titles across two VStacks of different child counts \
            inside an HStack \u{2014} so titles share a baseline even though images above them \
            have different heights.
            """,
            signatures: [
                "extension VerticalAlignment { static let imageTitle = VerticalAlignment(ImageTitleAlignment.self) }",
                "private struct ImageTitleAlignment: AlignmentID { static func defaultValue(in d: ViewDimensions) -> CGFloat { d[.bottom] } }",
                "HStack(alignment: .imageTitle) { ... }",
                ".alignmentGuide(.imageTitle) { d in d[.bottom] }"
            ],
            notes: [
                "AlignmentID is a protocol \u{2014} defaultValue(in:) is the only requirement.",
                "Custom HorizontalAlignment is initialized with HorizontalAlignment(YourAlignmentID.self); same form for VerticalAlignment.",
                "Only children that opt in via .alignmentGuide participate; the rest follow the stack's default alignment.",
                "For a single-stack version of this technique, see \"Aligning views within a stack\"."
            ]
        )
    }
}

#Preview {
    AligningViewsAcrossStacksDescribePage().frame(width: 900, height: 700)
}
