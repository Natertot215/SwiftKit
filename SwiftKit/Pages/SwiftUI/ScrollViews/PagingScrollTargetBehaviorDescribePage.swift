import SwiftUI

// SwiftUI `PagingScrollTargetBehavior` describe page.
// Source: Documentation/SwiftUI/scroll-views/pagingscrolltargetbehavior.md
// macOS 14.0+. Concrete behavior that aligns scrolls to container-sized pages.

struct PagingScrollTargetBehaviorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "PagingScrollTargetBehavior",
            docPath: "Documentation/SwiftUI/scroll-views/pagingscrolltargetbehavior.md",
            availability: "macOS 14.0+",
            blurb: """
            The scroll behavior that aligns scroll targets to container-based geometry. \
            Each scroll gesture settles on the next container-sized 'page' \u{2014} useful \
            for full-screen-item carousels, onboarding flows, and image swipers.

            Apply via .scrollTargetBehavior(.paging). The behavior uses the geometry of \
            the scroll view itself (its container size) to decide where to land, so it \
            does NOT require .scrollTargetLayout() inside.

            Conforming to ChartScrollTargetBehavior makes it usable inside Swift Charts.

            For a working demo see View/scrollTargetBehavior(_:), variant '.paging \u{2014} \
            horizontal carousel'.
            """,
            signatures: [
                "struct PagingScrollTargetBehavior",
                "init()",
                "// usage: .scrollTargetBehavior(.paging)"
            ],
            notes: [
                "Conforms to ScrollTargetBehavior and ChartScrollTargetBehavior.",
                "Does NOT need .scrollTargetLayout() \u{2014} pages are container-sized, not view-sized.",
                "Each child should fill the scroll view's container in the scrolled axis (e.g., .frame(width: containerWidth)).",
                "For per-view alignment instead of per-container, use .viewAligned.",
                "Pair with .scrollPosition or .scrollViewReader for programmatic page jumps."
            ]
        )
    }
}

#Preview {
    PagingScrollTargetBehaviorDescribePage().frame(width: 900, height: 700)
}
