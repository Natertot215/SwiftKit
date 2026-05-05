import SwiftUI

// Describe-track page for NSTableViewDelegate.
// Source: Documentation/AppKit/views-and-controls/nstableviewdelegate.md
// Protocol — has no on-screen surface of its own. The renderable demo lives
// on NSTableView, where a sample delegate returns NSTableCellView instances
// per row + column.

struct NSTableViewDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTableViewDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nstableviewdelegate.md",
            availability: "macOS",
            blurb: """
            A set of optional methods you implement in a table view delegate \
            to customize the behavior of the table view. Where the data \
            source supplies row count + per-row values, the delegate \
            supplies behavior, view rendering, and visual policy.

            For modern view-based tables, two delegate methods do most of \
            the work:

              \u{2022} tableView(_:viewFor:row:) — return an NSView \
            (typically an NSTableCellView) for a given column + row. The \
            entry point for view-based table rendering.
              \u{2022} tableView(_:rowViewForRow:) — optionally return a \
            custom NSTableRowView for a row when row-wide chrome (selection \
            highlight, separator, group-row treatment) needs to diverge \
            from the default.

            Beyond rendering, the delegate is the home for:

              \u{2022} Selection policy — \
            tableView(_:shouldSelectRow:), \
            tableView(_:selectionIndexesForProposedSelection:), \
            tableViewSelectionDidChange:, plus type-select methods.
              \u{2022} Sizing — tableView(_:heightOfRow:) and \
            tableView(_:sizeToFitWidthOfColumn:).
              \u{2022} Group rows — tableView(_:isGroupRow:) drives the \
            section-header look used by sidebars.
              \u{2022} Row actions — tableView(_:rowActionsForRow:edge:) \
            returns NSTableViewRowAction values for swipe-to-act buttons.
              \u{2022} Column reordering / resizing notifications — \
            tableViewColumnDidMove:, tableViewColumnDidResize:.
              \u{2022} Visibility changes (macOS 11+) — \
            tableView(_:userCanChangeVisibilityOf:), \
            tableView(_:userDidChangeVisibilityOf:).

            NSTableViewDelegate inherits from NSControlTextEditingDelegate, \
            so text-editing callbacks for inline editing of cells also \
            arrive on the delegate.
            """,
            signatures: [
                "protocol NSTableViewDelegate : NSControlTextEditingDelegate",
                "func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?",
                "func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView?",
                "func tableView(_ tableView: NSTableView, isGroupRow row: Int) -> Bool",
                "func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat",
                "func tableView(_ tableView: NSTableView, rowActionsForRow row: Int, edge: NSTableView.RowActionEdge) -> [NSTableViewRowAction]"
            ],
            notes: [
                "Protocol — nothing renders on its own. The NSTableView page hosts a working delegate that returns NSTableCellView instances for every row.",
                "Inherits NSControlTextEditingDelegate. Inline-editing callbacks (controlTextDidChange:, controlTextDidEndEditing:) land here alongside the table-specific methods.",
                "Two-protocol split: data source = row count + values + drag accept/validate + sort. Delegate = views + selection + sizing + group rows + row actions.",
                "tableView(_:viewFor:row:) is the modern path. Cell-based tables (the dataCellFor:row: family) are legacy.",
                "NSTableView holds the delegate weakly — own it elsewhere (typically the same coordinator that owns the data source)."
            ]
        )
    }
}

#Preview {
    NSTableViewDelegateDescribePage()
        .frame(width: 900, height: 700)
}
