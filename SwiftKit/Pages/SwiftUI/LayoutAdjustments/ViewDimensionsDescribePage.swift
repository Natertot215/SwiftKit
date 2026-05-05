import SwiftUI

// SwiftUI `ViewDimensions` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/viewdimensions.md
// macOS 10.15+. Value type passed to alignmentGuide closures.

struct ViewDimensionsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ViewDimensions",
            docPath: "Documentation/SwiftUI/layout-adjustments/viewdimensions.md",
            availability: "macOS 10.15+",
            blurb: """
            A view's size and alignment-guide values, supplied to AlignmentID.defaultValue(in:) and \
            to the alignmentGuide modifier's compute closure. Use it to read the view's measured \
            width / height and to look up offsets of all named alignment guides.

            Properties:
            \u{2022} width: CGFloat \u{2014} the view's reported width.
            \u{2022} height: CGFloat \u{2014} the view's reported height.

            Subscripts:
            \u{2022} subscript(_: HorizontalAlignment) -> CGFloat
            \u{2022} subscript(_: VerticalAlignment) -> CGFloat
            \u{2022} subscript(explicit: HorizontalAlignment) -> CGFloat?
            \u{2022} subscript(explicit: VerticalAlignment) -> CGFloat?

            The non-optional subscript returns the resolved guide value (defaulting to the AlignmentID \
            default if not explicitly set). The explicit subscript returns nil unless the view has \
            been opted in via .alignmentGuide \u{2014} useful when a custom AlignmentID needs to \
            distinguish opted-in children from defaulted ones.
            """,
            signatures: [
                "struct ViewDimensions",
                "var width: CGFloat",
                "var height: CGFloat",
                "subscript(_ guide: HorizontalAlignment) -> CGFloat",
                "subscript(_ guide: VerticalAlignment) -> CGFloat",
                "subscript(explicit guide: HorizontalAlignment) -> CGFloat?",
                ".alignmentGuide(.leading) { d in d[.trailing] }  // d is ViewDimensions"
            ],
            notes: [
                "ViewDimensions is the value passed into AlignmentID.defaultValue(in:) and into alignmentGuide closures.",
                "The non-optional subscript always returns a CGFloat \u{2014} default values come from the guide's AlignmentID.",
                "The explicit subscript is the way to detect whether a child has set a custom guide \u{2014} non-nil means opted in."
            ]
        )
    }
}

#Preview {
    ViewDimensionsDescribePage().frame(width: 900, height: 700)
}
