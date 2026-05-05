import SwiftUI

// Describe-track page for NSCollectionViewDiffableDataSource.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewdiffabledatasource.md
// The modern generic data-source class for NSCollectionView — pairs with
// NSDiffableDataSourceSnapshot for declarative state-driven updates.

struct NSCollectionViewDiffableDataSourceDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewDiffableDataSource",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewdiffabledatasource.md",
            availability: "macOS 10.15.1+",
            blurb: """
            NSCollectionViewDiffableDataSource is a specialized generic \
            data-source class for NSCollectionView. It implements the \
            NSCollectionViewDataSource protocol on your behalf and handles \
            the diff-and-animate cycle when the data changes.

            Lifecycle:

              1. Construct: \
            NSCollectionViewDiffableDataSource<Section, Item>(\
            collectionView:itemProvider:) where Section and Item are \
            Hashable identifier types (struct / enum / Int / String / UUID, \
            or NSObject-subclass). The itemProvider closure configures \
            and returns an NSCollectionViewItem for a given identifier.
              2. Build a snapshot: \
            NSDiffableDataSourceSnapshot<Section, Item>(), \
            appendSections([...]), appendItems([...]).
              3. Apply: dataSource.apply(snapshot, animatingDifferences: \
            true).

            For supplementary views (headers / footers / decoration), set \
            supplementaryViewProvider — a closure typed \
            NSCollectionViewDiffableDataSource.SupplementaryViewProvider.

            Bridges to identifiers via itemIdentifier(for:) and \
            indexPath(for:).
            """,
            signatures: [
                "class NSCollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType> where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable",
                "init(collectionView:itemProvider:)",
                "func apply(_ snapshot: NSDiffableDataSourceSnapshot<...>, animatingDifferences: Bool, completion: (() -> Void)?)",
                "var supplementaryViewProvider: SupplementaryViewProvider?",
                "func itemIdentifier(for indexPath: IndexPath) -> ItemIdentifierType?",
                "func indexPath(for itemIdentifier: ItemIdentifierType) -> IndexPath?"
            ],
            notes: [
                "Doc kind: class. Generic over Hashable Section / Item identifier types.",
                "Conforms to NSCollectionViewDataSource — there's no separate registration step.",
                "Identifier guidance: use Swift value types (struct / enum / Int / String / UUID). NSObject subclasses are also valid.",
                "The non-diffable path (manual NSCollectionViewDataSource) remains supported, but diffable is the recommended modern approach."
            ]
        )
    }
}

#Preview {
    NSCollectionViewDiffableDataSourceDescribePage().frame(width: 900, height: 700)
}
