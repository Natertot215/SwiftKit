import SwiftUI

// Describe-track page for NSTableViewDataSource.
// Source: Documentation/AppKit/views-and-controls/nstableviewdatasource.md
// Protocol — has no on-screen surface of its own. The renderable demo lives
// on NSTableView, where a sample data source returns five rows of static
// data.

struct NSTableViewDataSourceDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTableViewDataSource",
            docPath: "Documentation/AppKit/views-and-controls/nstableviewdatasource.md",
            availability: "macOS",
            blurb: """
            A set of methods that a table view uses to provide data to a \
            table view and to allow the editing of the table view's data \
            source object.

            For a non-bindings table, two methods are required:

              \u{2022} numberOfRows(in:) — total row count.
              \u{2022} tableView(_:objectValueFor:row:) — the value to \
            display in a column for a given row index.

            Cell-based tables additionally require \
            tableView(_:setObjectValue:for:row:) when editing is allowed. \
            View-based tables don't use that method — they let the cell \
            view's controls write back through bindings or target/action.

            Beyond row data, the data source is also where:

              \u{2022} Drag-and-drop participation lives — \
            tableView(_:writeRowsWith:to:), \
            tableView(_:validateDrop:proposedRow:proposedDropOperation:), \
            tableView(_:acceptDrop:row:dropOperation:), and the modern \
            pasteboard-writer pair tableView(_:pasteboardWriterForRow:) + \
            the dragging session lifecycle methods.
              \u{2022} Sorting lands — \
            tableView(_:sortDescriptorsDidChange:) is the data source's \
            cue to re-sort its model and call reloadData().

            For modern code, NSTableViewDiffableDataSource implements this \
            protocol generically — apps drive updates by applying \
            NSDiffableDataSourceSnapshot values and stop writing the four \
            methods above by hand.
            """,
            signatures: [
                "protocol NSTableViewDataSource : NSObjectProtocol",
                "func numberOfRows(in tableView: NSTableView) -> Int",
                "func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any?",
                "func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int)",
                "func tableView(_ tableView: NSTableView, sortDescriptorsDidChange oldDescriptors: [NSSortDescriptor])"
            ],
            notes: [
                "Protocol — nothing renders on its own. The NSTableView page hosts a working data source feeding five rows of static data.",
                "Apple: \"Some of the methods in this protocol ... are called frequently, so they must be efficient.\" Keep numberOfRows(in:) and objectValueFor:row: O(1).",
                "View-based tables must NOT use tableView(_:setObjectValue:for:row:) — that's a cell-based-only method. Views set their own values via bindings or target/action.",
                "NSTableView holds the data source weakly — own it elsewhere (typically a coordinator or view controller).",
                "Conforming types listed in the docs: NSTableViewDiffableDataSource and NSTableViewDiffableDataSourceReference. The diffable variant is the modern, snapshot-driven path."
            ]
        )
    }
}

#Preview {
    NSTableViewDataSourceDescribePage()
        .frame(width: 900, height: 700)
}
