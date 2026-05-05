import SwiftUI

// Describe-track page for NSCollectionViewFlowLayoutInvalidationContext.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewflowlayoutinvalidationcontext.md
// Subclass of NSCollectionViewLayoutInvalidationContext specific to
// NSCollectionViewFlowLayout — adds toggles for delegate-metric and
// flow-attribute invalidation.

struct NSCollectionViewFlowLayoutInvalidationContextDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewFlowLayoutInvalidationContext",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewflowlayoutinvalidationcontext.md",
            availability: "macOS 10.11+",
            blurb: """
            NSCollectionViewFlowLayoutInvalidationContext is the \
            flow-layout-specific subclass of \
            NSCollectionViewLayoutInvalidationContext. It adds two \
            properties for fine-grained invalidation of \
            NSCollectionViewFlowLayout:

              \u{2022} invalidateFlowLayoutDelegateMetrics — true when \
            the delegate's per-item / per-section sizing methods \
            (NSCollectionViewDelegateFlowLayout) might return different \
            values; the layout will re-ask the delegate for everything.
              \u{2022} invalidateFlowLayoutAttributes — true when only \
            the layout's own attributes (itemSize / spacing / inset) \
            changed; lighter than invalidating delegate metrics.

            Construct one, set the flags appropriate to your change, \
            then pass to layout.invalidateLayout(with:).

                let ctx = NSCollectionViewFlowLayoutInvalidationContext()
                ctx.invalidateFlowLayoutDelegateMetrics = true
                layout.invalidateLayout(with: ctx)
            """,
            signatures: [
                "class NSCollectionViewFlowLayoutInvalidationContext : NSCollectionViewLayoutInvalidationContext",
                "var invalidateFlowLayoutDelegateMetrics: Bool",
                "var invalidateFlowLayoutAttributes: Bool"
            ],
            notes: [
                "Doc kind: class. Subclass of NSCollectionViewLayoutInvalidationContext, inherited properties (invalidateEverything etc) still apply.",
                "Pair the two flow-specific flags with the change you actually made: delegate metrics for sizing-method changes, flow attributes for itemSize / spacing changes.",
                "NSCollectionViewFlowLayout.invalidationContextClass returns this class — you can fetch the right subclass dynamically.",
                "Most apps don't touch invalidation contexts — they call invalidateLayout() with no argument. Use a context when you measure that the full invalidation is too expensive."
            ]
        )
    }
}

#Preview {
    NSCollectionViewFlowLayoutInvalidationContextDescribePage().frame(width: 900, height: 700)
}
