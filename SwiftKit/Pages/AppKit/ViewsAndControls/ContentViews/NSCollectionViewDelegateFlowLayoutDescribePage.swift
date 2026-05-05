import SwiftUI

// Describe-track page for NSCollectionViewDelegateFlowLayout.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewdelegateflowlayout.md
// Subprotocol of NSCollectionViewDelegate that adds per-item / per-section
// sizing methods specifically for NSCollectionViewFlowLayout.

struct NSCollectionViewDelegateFlowLayoutDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewDelegateFlowLayout",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewdelegateflowlayout.md",
            availability: "macOS",
            blurb: """
            NSCollectionViewDelegateFlowLayout is the subprotocol of \
            NSCollectionViewDelegate that adds the per-item and per-section \
            sizing methods specifically used by NSCollectionViewFlowLayout. \
            All methods are optional — implement only the ones whose \
            default values you need to override.

            Per-item sizing:

              \u{2022} sizeForItemAt: — return the NSSize for an item; \
            overrides the layout's itemSize / estimatedItemSize.
              \u{2022} insetForSectionAt: — return the NSEdgeInsets for a \
            section; overrides the layout's sectionInset.
              \u{2022} minimumLineSpacingForSectionAt: — overrides \
            minimumLineSpacing.
              \u{2022} minimumInteritemSpacingForSectionAt: — overrides \
            minimumInteritemSpacing.

            Per-supplementary sizing:

              \u{2022} referenceSizeForHeaderInSection:
              \u{2022} referenceSizeForFooterInSection:

            Implement on the same object you assign as the collection \
            view's delegate — there's no separate delegate slot.
            """,
            signatures: [
                "protocol NSCollectionViewDelegateFlowLayout : NSCollectionViewDelegate",
                "func collectionView(_:layout:sizeForItemAt:) -> NSSize",
                "func collectionView(_:layout:insetForSectionAt:) -> NSEdgeInsets",
                "func collectionView(_:layout:minimumLineSpacingForSectionAt:) -> CGFloat",
                "func collectionView(_:layout:minimumInteritemSpacingForSectionAt:) -> CGFloat",
                "func collectionView(_:layout:referenceSizeForHeaderInSection:) -> NSSize"
            ],
            notes: [
                "Doc kind: protocol. Inherits NSCollectionViewDelegate.",
                "Only consulted when the collection view's layout is an NSCollectionViewFlowLayout (or subclass) — other layouts ignore it.",
                "The same delegate object handles both behavior (NSCollectionViewDelegate) and flow sizing — pick which methods to implement.",
                "Compositional layouts encode per-section sizing in the layout itself (NSCollectionLayoutSection / NSCollectionLayoutGroup); the delegate-flow path is specific to flow layouts."
            ]
        )
    }
}

#Preview {
    NSCollectionViewDelegateFlowLayoutDescribePage().frame(width: 900, height: 700)
}
