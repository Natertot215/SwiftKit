import SwiftUI

// Layout Adjustments conceptual doc pages — grouped describe page.
// Covers: Aligning views across stacks, Aligning views within a stack.
// (Laying out a simple view, Inspecting view layout, and Making fine
//  adjustments to a view's position now have dedicated describe pages.)
// macOS 10.15+

struct LayoutAdjustmentsDocsPage: View {
    var body: some View {
        DescribePage(
            title: "Layout Adjustments — Guides",
            docPath: "Documentation/SwiftUI/layout-adjustments/",
            availability: "macOS 10.15+",
            blurb: """
            Apple's layout-adjustments guide articles cover alignment, position fine-tuning, \
            and inspecting how SwiftUI resolves sizes at runtime.

            "Aligning views within a stack" explains HorizontalAlignment and VerticalAlignment \
            — the built-in cases and how to use them with VStack/HStack initializers.

            "Aligning views across stacks" shows custom AlignmentID to thread an invisible \
            alignment guide through multiple sibling stacks so elements in different stacks \
            line up at the same named guide value.

            "Laying out a simple view" is the canonical tutorial showing how SwiftUI's \
            three-step propose → report → place layout algorithm works bottom-up.

            "Making fine adjustments to a view's position" compares offset() vs position(), \
            and when to reach for each.

            "Inspecting view layout" covers GeometryReader and GeometryProxy to read resolved \
            sizes and positions at runtime without breaking the layout pass.
            """,
            signatures: [
                "HStack(alignment: .firstTextBaseline) { … }",
                "VStack(alignment: .leading) { … }",
                "alignment guide: custom AlignmentID via struct conforming to AlignmentID",
                ".alignmentGuide(.leading) { d in d[.trailing] }",
                "GeometryReader { proxy in proxy.size / proxy.frame(in: .global) }"
            ],
            notes: [
                "These are guide articles — the renderable primitives are wired as separate gallery pages.",
                "AlignmentPage covers alignment APIs; PositionXYPage / PositionPointPage / OffsetXYPage / OffsetSizePage cover position and offset modifiers."
            ]
        )
    }
}

#Preview {
    LayoutAdjustmentsDocsPage().frame(width: 900, height: 600)
}
