import SwiftUI

// Describe-track page for NSCollectionViewDelegate.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewdelegate.md
// The behavior protocol for NSCollectionView — selection, highlighting,
// and drag-and-drop. All methods optional. Subprotocols add more
// (NSCollectionViewDelegateFlowLayout for flow sizing).

struct NSCollectionViewDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewdelegate.md",
            availability: "macOS",
            blurb: """
            NSCollectionViewDelegate is the behavior surface for an \
            NSCollectionView — distinct from the data-source protocol that \
            supplies content. All methods are optional; adopt only the ones \
            relevant to your collection.

            Categories of methods:

              \u{2022} Highlight / selection — \
            collectionView(_:shouldChangeItemsAt:to:), \
            collectionView(_:didChangeItemsAt:to:), \
            collectionView(_:shouldSelectItemsAt:) — gate and observe \
            selection / highlight transitions.
              \u{2022} Drag and drop — \
            collectionView(_:pasteboardWriterForItemAt:), \
            collectionView(_:validateDrop:proposedIndexPath:dropOperation:), \
            collectionView(_:acceptDrop:indexPath:dropOperation:) for the \
            full drop cycle.
              \u{2022} Display — \
            collectionView(_:willDisplay:forRepresentedObjectAt:), \
            collectionView(_:didEndDisplaying:forRepresentedObjectAt:) for \
            tracking item visibility.

            Subprotocols extend this surface:

              \u{2022} NSCollectionViewDelegateFlowLayout — adds per-item \
            sizing, section insets, and spacing for flow layouts.
            """,
            signatures: [
                "protocol NSCollectionViewDelegate : NSObjectProtocol",
                "func collectionView(_:shouldSelectItemsAt:) -> Set<IndexPath>",
                "func collectionView(_:didSelectItemsAt:)",
                "func collectionView(_:pasteboardWriterForItemAt:) -> NSPasteboardWriting?",
                "func collectionView(_:validateDrop:proposedIndexPath:dropOperation:) -> NSDragOperation",
                "func collectionView(_:acceptDrop:indexPath:dropOperation:) -> Bool"
            ],
            notes: [
                "Doc kind: protocol. All methods optional — implement what you need.",
                "Drag-and-drop minimum: pasteboardWriterForItemAt:, validateDrop:..., acceptDrop:....",
                "NSCollectionViewDelegateFlowLayout extends this protocol with per-item / per-section sizing methods for flow layouts.",
                "Selection state itself lives on NSCollectionView (selectionIndexes / selectionIndexPaths); the delegate observes and gates changes."
            ]
        )
    }
}

#Preview {
    NSCollectionViewDelegateDescribePage().frame(width: 900, height: 700)
}
