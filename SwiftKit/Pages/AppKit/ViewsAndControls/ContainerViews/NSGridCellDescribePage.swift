import SwiftUI

// Describe-track page for NSGridCell.
// Source: Documentation/AppKit/views-and-controls/nsgridcell.md
// NSGridCell represents one row-column intersection inside an NSGridView.
// It's a model-style helper: the grid creates cells when its dimensions change
// and vends them through cell(atColumnIndex:rowIndex:). The only public
// initializer is init(coder:) — there's no user-facing way to instantiate a
// standalone cell, so it can't be rendered on its own.

struct NSGridCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSGridCell",
            docPath: "Documentation/AppKit/views-and-controls/nsgridcell.md",
            availability: "macOS 10.12+",
            blurb: """
            An individual content area within a grid view, typically at the \
            intersection of a row and a column. NSGridCell is a model-style \
            helper owned by NSGridView — the grid creates cells when its \
            dimensions change and exposes them through accessors like \
            cell(atColumnIndex:rowIndex:) and cell(for:). Apple's documentation \
            lists init(coder:) as the only public initializer; you don't \
            instantiate cells in user code, you ask the grid for them and \
            configure their contentView, placement, and constraints.

            A cell carries three things you typically read or write: \
            contentView (the NSView the cell hosts; assign nil to clear or set \
            an emptyContentView placeholder for missing content), \
            xPlacement / yPlacement / rowAlignment (placement overrides that \
            shadow the grid-wide defaults set on NSGridView), and \
            customPlacementConstraints (an array of NSLayoutConstraint that lets \
            the cell pin its content with finer control than the placement \
            enums allow). Reading row and column gives the cell's NSGridRow / \
            NSGridColumn, useful for navigating the grid programmatically.
            """,
            signatures: [
                "@MainActor class NSGridCell",
                "var contentView: NSView?",
                "var emptyContentView: NSView { get }",
                "var row: NSGridRow? { get }",
                "var column: NSGridColumn? { get }",
                "var xPlacement: NSGridCell.Placement",
                "var yPlacement: NSGridCell.Placement",
                "var rowAlignment: NSGridRow.Alignment",
                "var customPlacementConstraints: [NSLayoutConstraint]",
                "init(coder: NSCoder)"
            ],
            notes: [
                "Owned by NSGridView — the grid creates and vends cells. There is no public init for standalone cells; init(coder:) is the only documented initializer.",
                "Inherits NSObject (not NSView). NSGridCell is not itself a renderable view — it positions a contentView inside the grid's bounds.",
                "Placement enum (NSGridCell.Placement): .inherited, .none, .leading, .trailing, .center, .fill, .top, .bottom. .inherited defers to the column's xPlacement / row's yPlacement, which in turn fall back to the grid view's defaults.",
                "Per-cell placement overrides the grid-wide xPlacement / yPlacement set on NSGridView.",
                "Use customPlacementConstraints when the placement enum isn't precise enough — pin to leading/trailing/centerY anchors of the cell with explicit NSLayoutConstraint values.",
                "emptyContentView is the placeholder the grid draws when contentView is nil — handy when a cell is intentionally blank but you still want to reserve space."
            ]
        )
    }
}

#Preview {
    NSGridCellDescribePage()
        .frame(width: 900, height: 700)
}
