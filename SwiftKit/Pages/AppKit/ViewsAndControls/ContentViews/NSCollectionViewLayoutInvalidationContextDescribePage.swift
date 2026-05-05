import SwiftUI

// Describe-track page for NSCollectionViewLayoutInvalidationContext.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewlayoutinvalidationcontext.md
// A configuration object describing which portions of a layout need to be
// recomputed. Lets you avoid invalidating the entire layout when only
// specific elements changed.

struct NSCollectionViewLayoutInvalidationContextDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewLayoutInvalidationContext",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewlayoutinvalidationcontext.md",
            availability: "macOS 10.11+",
            blurb: """
            NSCollectionViewLayoutInvalidationContext is a configuration \
            object that tells a layout which portions of itself need to \
            be updated. Pass one to \
            NSCollectionViewLayout.invalidateLayout(with:) to avoid \
            recomputing everything when only a subset of elements have \
            changed.

            Configurable scope:

              \u{2022} invalidateEverything — fast path that mirrors \
            invalidateLayout() with no context.
              \u{2022} invalidateDataSourceCounts — true when section / \
            item counts changed.
              \u{2022} contentOffsetAdjustment / contentSizeAdjustment — \
            patch-up values to apply alongside the invalidation.
              \u{2022} invalidateItems(at:) / \
            invalidateSupplementaryElements(ofKind:at:) / \
            invalidateDecorationElements(ofKind:at:) — restrict the \
            invalidation to specific index paths.

            Subclass NSCollectionViewLayoutInvalidationContext (or use a \
            ready-made subclass like \
            NSCollectionViewFlowLayoutInvalidationContext) when your \
            custom layout needs additional invalidation hints.
            """,
            signatures: [
                "@MainActor class NSCollectionViewLayoutInvalidationContext : NSObject",
                "var invalidateEverything: Bool { get }",
                "var invalidateDataSourceCounts: Bool { get }",
                "var contentOffsetAdjustment: NSPoint",
                "var contentSizeAdjustment: NSSize",
                "func invalidateItems(at indexPaths: [IndexPath])"
            ],
            notes: [
                "Doc kind: class. Pass to NSCollectionViewLayout.invalidateLayout(with:) instead of calling invalidateLayout() with no argument.",
                "Lets you mark just the items / supplementaries / decorations that changed — the layout can skip recomputing the rest.",
                "Custom layouts often subclass this — see NSCollectionViewFlowLayoutInvalidationContext for the flow-layout variant.",
                "invalidationContextClass on NSCollectionViewLayout returns the subclass appropriate to that layout."
            ]
        )
    }
}

#Preview {
    NSCollectionViewLayoutInvalidationContextDescribePage().frame(width: 900, height: 700)
}
