import SwiftUI

// Layout Fundamentals conceptual doc pages — grouped describe page.
// Covers: Building layouts with stack views, Creating performant scrollable stacks,
//         Grouping data with lazy stack views, Picking container views for your content,
//         Adding a background to your view
// macOS 10.15+

struct LayoutFundamentalsDocsPage: View {
    var body: some View {
        DescribePage(
            title: "Layout Fundamentals — Guides",
            docPath: "Documentation/SwiftUI/layout-fundamentals/",
            availability: "macOS 10.15+",
            blurb: """
            Apple publishes several conceptual layout guides alongside the API reference. \
            These articles walk through composing views with stacks and grids, choosing the \
            right container, and achieving good scroll performance.

            "Building layouts with stack views" explains HStack, VStack, ZStack alignment \
            and spacing fundamentals. \
            "Creating performant scrollable stacks" covers when to upgrade from VStack to \
            LazyVStack for long lists. \
            "Grouping data with lazy stack views" shows Section + pinned headers inside \
            LazyVStack. \
            "Picking container views for your content" is a decision guide: List vs Grid vs \
            Stack vs Table. \
            "Adding a background to your view" covers the full background()/overlay() API \
            surface including materials and shapes.

            All conceptual guides are readable at Documentation/SwiftUI/layout-fundamentals/ \
            in the local mirror.
            """,
            signatures: [
                "HStack / VStack / ZStack — fundamental stack containers",
                "LazyVStack(pinnedViews:) — performant large-list scrolling",
                "List vs Grid vs Table — container decision guide",
                ".background(.ultraThinMaterial, in: shape) — material backgrounds"
            ],
            notes: [
                "These are guide articles, not API types. The renderable primitives are wired as separate gallery pages.",
                "See HStackPage, LazyStackPage, GridPage, BackgroundOverlayPage for live demos."
            ]
        )
    }
}

#Preview {
    LayoutFundamentalsDocsPage().frame(width: 900, height: 600)
}
