import SwiftUI

// Describe-track page for the "Table View" overview article.
// Source: Documentation/AppKit/views-and-controls/table-view.md
// "Table View" is a collectionGroup overview page in Apple's docs — it
// groups eight AppKit classes/protocols/structs that make up the table
// machinery. The renderable demo lives on the NSTableView page; this page
// documents the grouping and how the pieces fit together.

struct TableViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Table View",
            docPath: "Documentation/AppKit/views-and-controls/table-view.md",
            availability: "macOS (NSTableView and supporting types)",
            blurb: """
            Apple's documentation groups eight AppKit symbols under "Table \
            View" — together they let you display custom data in rows and \
            columns. The members split naturally into three layers:

            Views (what shows up on screen):

              \u{2022} NSTableView — the visible control. Inherits NSControl \
            and is always wrapped in an NSScrollView.
              \u{2022} NSTableCellView — the per-cell view in the modern \
            view-based table model (macOS 10.7+). Carries an imageView and a \
            textField as conventional outlets.

            Management (data + behavior contracts):

              \u{2022} NSTableViewDataSource — supplies row count and \
            per-row values. Required for non-bindings tables.
              \u{2022} NSTableViewDelegate — supplies per-row views, \
            selection policy, sizing, group rows, drag-and-drop visuals.
              \u{2022} NSTableViewDiffableDataSource — generic class that \
            implements NSTableViewDataSource and lets you drive updates by \
            applying NSDiffableDataSourceSnapshot values (macOS 11+).

            Rows and columns (model objects, header chrome, cell types):

              \u{2022} NSTableHeaderView / NSTableHeaderCell — the header \
            chrome that draws above the table. NSTableView creates and \
            manages these for you when headerView is non-nil.
              \u{2022} NSTableRowView — the view for a row, in charge of \
            row-wide chrome (selection highlight, separator, group-row \
            treatment).
              \u{2022} NSTableColumn — the model object for a column \
            (identifier, width, min/max width, header cell, sort \
            descriptor, visibility).
              \u{2022} NSTableViewRowAction — a single swipe action (delete, \
            archive, etc.) returned from the delegate.
              \u{2022} NSTableColumn.ResizingOptions — option-set struct \
            that controls a column's resizing mask.

            For new code, prefer view-based tables driven by an \
            NSTableViewDiffableDataSource. Cell-based tables are legacy.
            """,
            signatures: [
                "class NSTableView : NSControl",
                "class NSTableCellView : NSView",
                "protocol NSTableViewDataSource : NSObjectProtocol",
                "protocol NSTableViewDelegate : NSControlTextEditingDelegate",
                "class NSTableViewDiffableDataSource<S, I> : NSObject",
                "class NSTableHeaderView : NSView",
                "class NSTableHeaderCell : NSTextFieldCell",
                "class NSTableRowView : NSView",
                "@MainActor class NSTableColumn : NSObject",
                "class NSTableViewRowAction : NSObject",
                "struct NSTableColumn.ResizingOptions : OptionSet"
            ],
            notes: [
                "Doc kind: collectionGroup. The article itself defines no API — it points to the eleven member types listed under Topics.",
                "NSOutlineView inherits NSTableView, so this entire family is also the foundation of AppKit's hierarchical-list machinery.",
                "View-based tables (NSTableCellView returned via tableView(_:viewFor:row:)) are the modern path. Cell-based tables and NSCell-driven rendering are legacy.",
                "An NSTableView is always inside an NSScrollView — use NSTableView.scrollableTableView() for a pre-wired pair.",
                "See Also targets in the doc: Browser View, Collection View, Outline View, NSTextView — the four major content-view families in AppKit."
            ]
        )
    }
}

#Preview {
    TableViewDescribePage()
        .frame(width: 900, height: 700)
}
