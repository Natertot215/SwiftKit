import SwiftUI

// Describe-track page for NSTableHeaderView.
// Source: Documentation/AppKit/views-and-controls/nstableheaderview.md
// NSTableView creates and manages this view automatically when its
// headerView property is non-nil; the renderable surface is on the
// NSTableView page where the headers are visible above the three columns.

struct NSTableHeaderViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTableHeaderView",
            docPath: "Documentation/AppKit/views-and-controls/nstableheaderview.md",
            availability: "macOS",
            blurb: """
            An object that draws headers over a table view's columns and \
            handles mouse events in those headers. NSTableHeaderView uses \
            NSTableHeaderCell instances to draw the title and optional \
            sort indicator for each column.

            Most apps never instantiate NSTableHeaderView directly. The \
            standard pattern is:

              \u{2022} Set NSTableView.headerView to a fresh \
            NSTableHeaderView() instance to enable the header chrome.
              \u{2022} Set NSTableView.headerView to nil to hide the header \
            entirely (common for sidebar-style tables).
              \u{2022} Set NSTableColumn.title and NSTableColumn.headerCell \
            on each column to control text and per-column header rendering.

            Direct interactions with NSTableHeaderView are limited to:

              \u{2022} Hit-testing — column(at:) returns the column index \
            for a point in the header.
              \u{2022} Geometry — headerRect(ofColumn:) returns the rect of \
            a specific column's header.
              \u{2022} Drag/resize state — draggedColumn, draggedDistance, \
            and resizedColumn report the current in-flight column \
            manipulation while the user is dragging or resizing.
              \u{2022} Subclassing for fully custom headers (rare) — \
            override drawing to paint over the default rendering.

            Sort indicators are drawn by NSTableHeaderCell, not \
            NSTableHeaderView, but the click that toggles a sort goes \
            through the header view first and is forwarded to the \
            NSTableView via mouseDownInHeaderOf: on the delegate.
            """,
            signatures: [
                "class NSTableHeaderView : NSView",
                "var tableView: NSTableView?",
                "var draggedColumn: Int { get }",
                "var draggedDistance: CGFloat { get }",
                "var resizedColumn: Int { get }",
                "func column(at point: NSPoint) -> Int",
                "func headerRect(ofColumn column: Int) -> NSRect"
            ],
            notes: [
                "Inherits NSView. Created and managed automatically by NSTableView when headerView is non-nil — apps rarely instantiate the class themselves.",
                "Uses NSTableHeaderCell to draw each column header. Customize cell rendering by subclassing NSTableHeaderCell and assigning instances to NSTableColumn.headerCell.",
                "Set NSTableView.headerView to nil to hide the entire header strip — common pattern for source-list / sidebar tables where titles aren't visible.",
                "Drag and resize state (draggedColumn, draggedDistance, resizedColumn) is read-only — these are mid-gesture status values, not configuration knobs.",
                "Mouse events on the header forward through to the NSTableView delegate's tableView(_:mouseDownInHeaderOf:) for sort toggling and similar."
            ]
        )
    }
}

#Preview {
    NSTableHeaderViewDescribePage()
        .frame(width: 900, height: 700)
}
