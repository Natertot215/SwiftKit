import SwiftUI

// Describe-track page for NSCollectionViewDataSource.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewdatasource.md
// The classic data-source protocol for NSCollectionView. Two required
// methods (numberOfItemsInSection, itemForRepresentedObjectAt) plus a small
// set of optional methods for sections and supplementary views.

struct NSCollectionViewDataSourceDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewDataSource",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewdatasource.md",
            availability: "macOS",
            blurb: """
            NSCollectionViewDataSource is the protocol an object adopts to \
            provide the information and view objects an NSCollectionView \
            requires to present content.

            Two required methods:

              \u{2022} collectionView(_:numberOfItemsInSection:) — count of \
            items per section.
              \u{2022} collectionView(_:itemForRepresentedObjectAt:) — vend a \
            configured NSCollectionViewItem for an index path. Implementations \
            call collectionView.makeItem(withIdentifier:for:) to recycle items.

            Optional methods cover sections and supplementary views:

              \u{2022} numberOfSections(in:) — multi-section data sources.
              \u{2022} collectionView(_:viewForSupplementaryElementOfKind:at:) \
            — vend a supplementary view (header / footer / decoration) for \
            an index path.

            For modern code, prefer the generic class \
            NSCollectionViewDiffableDataSource<Section, Item> — it conforms \
            to this protocol and automates the diff/animate cycle.
            """,
            signatures: [
                "protocol NSCollectionViewDataSource : NSObjectProtocol",
                "func collectionView(_ cv: NSCollectionView, numberOfItemsInSection: Int) -> Int  // required",
                "func collectionView(_ cv: NSCollectionView, itemForRepresentedObjectAt: IndexPath) -> NSCollectionViewItem  // required",
                "func numberOfSections(in cv: NSCollectionView) -> Int  // optional",
                "func collectionView(_ cv: NSCollectionView, viewForSupplementaryElementOfKind: NSCollectionView.SupplementaryElementKind, at: IndexPath) -> NSView  // optional"
            ],
            notes: [
                "Doc kind: protocol. Inherits NSObjectProtocol.",
                "Two required methods provide the basic count + view-vending machinery; the rest are optional.",
                "NSCollectionViewDiffableDataSource conforms to this protocol — reach for diffable in new code unless you have a specific reason for the manual implementation.",
                "Demoed in context on the NSCollectionView page (CVDemoCoordinator) and the NSCollectionViewFlowLayout page (FlowDataSource)."
            ]
        )
    }
}

#Preview {
    NSCollectionViewDataSourceDescribePage().frame(width: 900, height: 700)
}
