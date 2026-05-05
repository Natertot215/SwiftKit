import SwiftUI

// Describe-track page for NSTableColumn.
// Source: Documentation/AppKit/views-and-controls/nstablecolumn.md
// Model object describing one column of an NSTableView. The renderable
// surface is on the NSTableView page where three NSTableColumn instances
// (Name / Role / Status) are configured and added to the table.

struct NSTableColumnDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTableColumn",
            docPath: "Documentation/AppKit/views-and-controls/nstablecolumn.md",
            availability: "macOS",
            blurb: """
            The display characteristics and identifier for a column in a \
            table view. NSTableColumn is the per-column model object — it \
            isn't a view itself; it owns a header cell (drawn by \
            NSTableHeaderView) and a data cell (legacy cell-based tables \
            only) and tells the table view how wide the column should be \
            and whether the user can resize it.

            Per-column responsibilities:

              \u{2022} Identifier — NSUserInterfaceItemIdentifier passed to \
            init(identifier:). Used to look up cell views via \
            NSTableView.makeView(withIdentifier:owner:) and to address the \
            column from data sources / delegates.
              \u{2022} Sizing — width, minWidth, maxWidth, sizeToFit(). \
            resizingMask is an NSTableColumn.ResizingOptions value that \
            decides whether the column participates in autoresizing and / \
            or is user-resizable.
              \u{2022} Header — title is the convenience accessor for \
            headerCell.title. headerCell is the NSTableHeaderCell that \
            renders the column header; reassign it for custom header \
            rendering. headerToolTip is the help-tag string shown over the \
            header.
              \u{2022} Sort descriptor prototype — \
            sortDescriptorPrototype provides the NSSortDescriptor the \
            table places into NSTableView.sortDescriptors when the user \
            clicks the header.
              \u{2022} Visibility — isHidden lets the user (or app code) \
            collapse a column without removing it from the table. Pairs \
            with NSTableViewDelegate.tableView(_:userCanChangeVisibilityOf:).
              \u{2022} Editability — isEditable controls whether \
            cell-based tables allow inline edits in this column. (View-based \
            tables get edit policy from their cell view's controls.)

            NSTableColumn is @MainActor — instantiate, configure, and \
            mutate it on the main thread.
            """,
            signatures: [
                "@MainActor class NSTableColumn : NSObject",
                "init(identifier: NSUserInterfaceItemIdentifier)",
                "var identifier: NSUserInterfaceItemIdentifier",
                "var title: String",
                "var headerCell: NSTableHeaderCell",
                "var headerToolTip: String?",
                "var width: CGFloat",
                "var minWidth: CGFloat",
                "var maxWidth: CGFloat",
                "var resizingMask: NSTableColumn.ResizingOptions",
                "func sizeToFit()",
                "var sortDescriptorPrototype: NSSortDescriptor?",
                "var isHidden: Bool",
                "var isEditable: Bool",
                "weak var tableView: NSTableView?"
            ],
            notes: [
                "@MainActor class. Instantiate on the main thread — typical pattern is to build columns inside makeNSView(context:) or the view controller.",
                "Identifier is critical for view-based tables — NSTableView.makeView(withIdentifier:owner:) uses it to recycle cell views, and the data source / delegate use it to disambiguate columns.",
                "resizingMask is an NSTableColumn.ResizingOptions OptionSet — combine .userResizingMask with .autoresizingMask to allow both interactive and proportional resizing.",
                "Setting title is a convenience that writes through to headerCell.title. For deeper header customization, replace headerCell with a configured NSTableHeaderCell instance.",
                "sortDescriptorPrototype + NSTableView.sortDescriptors is how column sorting is wired — set the prototype on each sortable column, then implement tableView(_:sortDescriptorsDidChange:) on the data source."
            ]
        )
    }
}

#Preview {
    NSTableColumnDescribePage()
        .frame(width: 900, height: 700)
}
