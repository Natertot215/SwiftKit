import SwiftUI

// Describe-track page for NSTableViewDiffableDataSource.
// Source: Documentation/AppKit/views-and-controls/nstableviewdiffabledatasource.md
// Generic class. The renderable demo on the NSTableView page uses a hand-
// written NSTableViewDataSource for clarity; a production app would prefer
// this diffable variant for any table whose contents change over time.

struct NSTableViewDiffableDataSourceDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTableViewDiffableDataSource",
            docPath: "Documentation/AppKit/views-and-controls/nstableviewdiffabledatasource.md",
            availability: "macOS 11.0+",
            blurb: """
            The object you use to manage data and provide items for a table \
            view, snapshot-first. \
            NSTableViewDiffableDataSource is a generic class that conforms \
            to NSTableViewDataSource and lets you describe the table's \
            current contents as an NSDiffableDataSourceSnapshot — AppKit \
            handles diffing the snapshot against the previous one and \
            animating inserts, removes, moves, and reloads accordingly.

            The four-step usage:

              1. Connect a diffable data source to the table view via \
            init(tableView:cellProvider:). The cell provider is a closure \
            that takes the table view, the column, the row, and the item \
            identifier, and returns the configured NSView for that cell.
              2. Generate the current state of the data as a snapshot — \
            create an NSDiffableDataSourceSnapshot, append section \
            identifiers, and append item identifiers under each section.
              3. Display the data by calling \
            apply(_:animatingDifferences:completion:) on the data source. \
            The framework performs the row/column animations.
              4. To update the table later, build a new snapshot reflecting \
            the new state and call apply again — never call reloadData / \
            beginUpdates / endUpdates / insertRows / removeRows manually \
            when a diffable data source is in charge.

            The class also supplies optional providers for row views \
            (rowViewProvider) and section header views \
            (sectionHeaderViewProvider) so the same snapshot-driven model \
            covers row chrome and group rows. \
            NSTableViewDiffableDataSourceReference is the Objective-C \
            non-generic variant Swift code rarely interacts with directly.
            """,
            signatures: [
                "class NSTableViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType> where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable",
                "init(tableView: NSTableView, cellProvider: @escaping NSTableViewDiffableDataSource<S, I>.CellProvider)",
                "typealias CellProvider = (NSTableView, NSTableColumn, Int, ItemIdentifierType) -> NSView?",
                "func snapshot() -> NSDiffableDataSourceSnapshot<S, I>",
                "func apply(_ snapshot: NSDiffableDataSourceSnapshot<S, I>, animatingDifferences: Bool, completion: (() -> Void)?)",
                "var rowViewProvider: NSTableViewDiffableDataSource<S, I>.RowProvider?",
                "var sectionHeaderViewProvider: NSTableViewDiffableDataSource<S, I>.SectionHeaderViewProvider?",
                "var defaultRowAnimation: NSTableView.AnimationOptions"
            ],
            notes: [
                "Generic class. SectionIdentifierType and ItemIdentifierType must both conform to Hashable — typically Int, String, UUID, or a custom struct/enum.",
                "Conforms to NSTableViewDataSource. NSTableView holds it weakly through its dataSource property — keep a strong reference on the owning controller.",
                "Apple's recommended path for any table whose contents change. With a hand-written data source you call reloadData / beginUpdates / endUpdates / insertRows / removeRows manually — diffable replaces that whole choreography with one apply(snapshot:) call.",
                "The cell provider closure is invoked with the column and row index plus the item identifier — typically you look the item up in your model dictionary by identifier and configure the returned NSTableCellView from there.",
                "rowViewProvider returns NSTableRowView instances; sectionHeaderViewProvider drives group-row chrome. Both are optional — omit them and the table falls back to default row views and ungrouped rows."
            ]
        )
    }
}

#Preview {
    NSTableViewDiffableDataSourceDescribePage()
        .frame(width: 900, height: 700)
}
