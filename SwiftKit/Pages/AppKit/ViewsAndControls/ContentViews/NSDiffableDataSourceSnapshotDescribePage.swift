import SwiftUI

// Describe-track page for NSDiffableDataSourceSnapshot.
// Source: Documentation/AppKit/views-and-controls/nsdiffabledatasourcesnapshot.md
// A value-type snapshot of the section + item identifiers a diffable data
// source should display. Applied via NSCollectionViewDiffableDataSource.apply.

struct NSDiffableDataSourceSnapshotDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSDiffableDataSourceSnapshot",
            docPath: "Documentation/AppKit/views-and-controls/nsdiffabledatasourcesnapshot.md",
            availability: "macOS 10.15.1+",
            blurb: """
            NSDiffableDataSourceSnapshot is a generic struct representing \
            the state of the data a view should display at a specific \
            point in time. It holds an ordered list of section identifiers \
            and the item identifiers within each section.

            Two construction paths:

              \u{2022} Empty snapshot — \
            var snap = NSDiffableDataSourceSnapshot<Section, Item>(), \
            then append sections and items.
              \u{2022} Mutate the current snapshot — read \
            dataSource.snapshot(), modify, re-apply.

            Operations: appendSections, appendItems, insertSections / \
            insertItems(before:), deleteSections, deleteItems, \
            moveSection(_:after:), moveItem(_:before:), reloadSections, \
            reloadItems, reconfigureItems.

            Section and item identifiers must be Hashable. Use Swift value \
            types (Int, String, UUID, struct, enum) — if you must use a \
            class, subclass NSObject.
            """,
            signatures: [
                "struct NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType> where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable",
                "init()",
                "mutating func appendSections(_ identifiers: [SectionIdentifierType])",
                "mutating func appendItems(_ identifiers: [ItemIdentifierType], toSection: SectionIdentifierType?)",
                "mutating func deleteItems(_ identifiers: [ItemIdentifierType])",
                "mutating func reconfigureItems(_ identifiers: [ItemIdentifierType])"
            ],
            notes: [
                "Doc kind: struct. Value type — copies cheaply, applies atomically.",
                "Identifiers carry identity, not display data. Bind identifier -> model in your item provider closure.",
                "reconfigureItems triggers the cell-provider closure without doing a full reload — preferred when only the displayed values change.",
                "Bridges from NSDiffableDataSourceSnapshotReference for Objective-C interop."
            ]
        )
    }
}

#Preview {
    NSDiffableDataSourceSnapshotDescribePage().frame(width: 900, height: 700)
}
