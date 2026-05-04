import SwiftUI

// "Composing custom layouts with SwiftUI" guide article page.
// Also covers: LayoutProperties, ViewSpacing in a narrative context.

struct ComposingCustomLayoutsPage: View {
    var body: some View {
        DescribePage(
            title: "Composing Custom Layouts with SwiftUI",
            docPath: "Documentation/SwiftUI/custom-layout/",
            availability: "macOS 13.0+",
            blurb: """
            "Composing custom layouts with SwiftUI" is Apple's guide article walking through \
            the complete Layout protocol implementation workflow.

            The article starts with a simple EquallySized layout that makes all children the \
            same size, then progresses through layouts that use ViewSpacing.distance(to:along:) \
            to respect per-view preferred spacing, and finally shows how AnyLayout enables \
            animated transitions between layout types.

            Key steps in implementing Layout:
            1. Declare a struct conforming to Layout.
            2. Implement sizeThatFits(proposal:subviews:cache:) — return the total size for \
            the given proposal.
            3. Implement placeSubviews(in:proposal:subviews:cache:) — call subview.place(at:anchor:proposal:) \
            for every child.
            4. Optionally implement makeCache(subviews:) to precompute per-subview sizes.

            LayoutProperties.stackOrientation declares to SwiftUI whether the layout is \
            primarily horizontal or vertical — used for spacing hints from the enclosing context.

            ViewSpacing returned by subview.spacing encapsulates the preferred gap that view \
            wants from each of its four edges. Use .distance(to: nextSpacing, along: .horizontal) \
            to get the minimum inter-view gap SwiftUI recommends.
            """,
            signatures: [
                "struct MyLayout: Layout { func sizeThatFits(…) → CGSize; func placeSubviews(…) }",
                "static var layoutProperties: LayoutProperties { .init() }",
                "subview.spacing.distance(to: other.spacing, along: .horizontal)",
                "AnyLayout(HStackLayout()).callAsFunction { content }",
                "ProposedViewSize(width: w, height: h)  //  .zero  //  .infinity  //  .unspecified"
            ],
            notes: [
                "The full article is at Documentation/SwiftUI/custom-layout/ in the local mirror.",
                "Live examples of Layout, AnyLayout, and LayoutValueKey are in LayoutProtocolPage and AnyLayoutPage."
            ]
        )
    }
}

#Preview {
    ComposingCustomLayoutsPage().frame(width: 900, height: 600)
}
