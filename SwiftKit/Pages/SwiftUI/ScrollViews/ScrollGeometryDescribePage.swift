import SwiftUI

// SwiftUI `ScrollGeometry` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollgeometry.md
// macOS 15.0+. Value type passed into onScrollGeometryChange / onScrollPhaseChange contexts.

struct ScrollGeometryDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollGeometry",
            docPath: "Documentation/SwiftUI/scroll-views/scrollgeometry.md",
            availability: "macOS 15.0+",
            blurb: """
            A value type that snapshots the geometry of a scroll view at a moment \
            in time. SwiftUI gives you an instance of this type from \
            onScrollGeometryChange(for:of:action:) and from a ScrollPhaseChangeContext \
            inside onScrollPhaseChange(_:).

            ScrollGeometry exposes everything you need to reason about position \
            and size:
            \u{2022} contentOffset \u{2014} the current scroll position (CGPoint).
            \u{2022} contentSize \u{2014} the full scrollable content size (CGSize).
            \u{2022} containerSize \u{2014} the size of the visible viewport (CGSize).
            \u{2022} contentInsets \u{2014} EdgeInsets the scroll view applies inside the container.
            \u{2022} bounds \u{2014} the current visible content rectangle (CGRect).
            \u{2022} visibleRect \u{2014} the rect of content actually visible in the viewport.

            Project these into a narrower Equatable type when reading them in \
            onScrollGeometryChange so the action only fires on meaningful changes.

            For a working demo, see View/onScrollGeometryChange(for:of:action:).
            """,
            signatures: [
                "struct ScrollGeometry",
                "init(contentOffset: CGPoint, contentSize: CGSize, contentInsets: EdgeInsets, containerSize: CGSize)",
                "var contentOffset: CGPoint",
                "var contentSize: CGSize",
                "var containerSize: CGSize",
                "var contentInsets: EdgeInsets",
                "var bounds: CGRect",
                "var visibleRect: CGRect"
            ],
            notes: [
                "Conforms to Equatable and Sendable. Equality lets onScrollGeometryChange diff projected values cheaply.",
                "contentOffset is in the scroll view's content coordinate space \u{2014} (0, 0) is the natural origin per the default scroll anchor.",
                "containerSize and contentSize together let you compute the maximum scrollable distance: contentSize - containerSize.",
                "Don't store ScrollGeometry across frames; SwiftUI reuses instances. Capture only the projected primitive (CGFloat, Bool, etc.) you need.",
                "Pre-15: not available \u{2014} no equivalent on earlier macOS."
            ]
        )
    }
}

#Preview {
    ScrollGeometryDescribePage().frame(width: 900, height: 700)
}
