import SwiftUI

// Describe-track page for NSGridColumn.
// Source: Documentation/AppKit/views-and-controls/nsgridcolumn.md
// NSGridColumn is a model-style helper owned by NSGridView. The grid creates
// columns when its dimensions change and vends them through column(at:).
// init(coder:) is the only public initializer — there's no way to render a
// standalone column outside its grid.

struct NSGridColumnDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSGridColumn",
            docPath: "Documentation/AppKit/views-and-controls/nsgridcolumn.md",
            availability: "macOS 10.12+",
            blurb: """
            A column within a grid view. NSGridColumn is a model-style helper \
            owned by NSGridView — the grid creates and vends columns through \
            column(at:); the only public initializer is init(coder:). You read \
            the column's gridView back-reference, its numberOfCells, and \
            iterate cell(at:) to walk the column's rows; you write width \
            (a fixed point value or NSGridView.sizedForContent), \
            leadingPadding / trailingPadding (extra horizontal space around the \
            column's content), isHidden (skip the column during layout without \
            removing it), and xPlacement (the per-column placement override \
            that shadows the grid-wide xPlacement).

            mergeCells(in:) merges the supplied range of rows in this column \
            into a single cell — useful for column headers that span multiple \
            row groups. The merged cell takes the contentView of the first \
            cell in the range; the remaining cells become inaccessible until \
            the merge is undone.
            """,
            signatures: [
                "@MainActor class NSGridColumn",
                "var gridView: NSGridView? { get }",
                "var numberOfCells: Int { get }",
                "var width: CGFloat",
                "var leadingPadding: CGFloat",
                "var trailingPadding: CGFloat",
                "var isHidden: Bool",
                "var xPlacement: NSGridCell.Placement",
                "func cell(at index: Int) -> NSGridCell",
                "func mergeCells(in range: NSRange)",
                "init(coder: NSCoder)"
            ],
            notes: [
                "Owned by NSGridView — created by the grid, vended by column(at:). No public initializer beyond init(coder:).",
                "Inherits NSObject. Not a renderable view — the grid positions cells, the column object describes their geometry.",
                "width: assign a fixed CGFloat for a fixed-width column, or NSGridView.sizedForContent (a sentinel constant) to revert to auto-sized behavior.",
                "leadingPadding / trailingPadding add space around the column's content area, before and after Auto Layout resolves the column width.",
                "Per-column xPlacement overrides the grid view's grid-wide xPlacement; per-cell xPlacement on NSGridCell overrides the column's value.",
                "isHidden hides the column without removing it — useful when a column should disappear conditionally without rebuilding the grid.",
                "mergeCells(in:) merges the supplied row range into a single spanning cell. The merged cell takes the contentView of the first cell in the range."
            ]
        )
    }
}

#Preview {
    NSGridColumnDescribePage()
        .frame(width: 900, height: 700)
}
