import SwiftUI

// Describe-track page for NSGridRow.
// Source: Documentation/AppKit/views-and-controls/nsgridrow.md
// Companion to NSGridColumn — the row-side model helper owned by NSGridView.
// Created by the grid when rows are added; vended through row(at:). No public
// initializer beyond init(coder:); cannot be rendered on its own.

struct NSGridRowDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSGridRow",
            docPath: "Documentation/AppKit/views-and-controls/nsgridrow.md",
            availability: "macOS 10.12+",
            blurb: """
            A row within a grid view. NSGridRow is the row-side counterpart to \
            NSGridColumn — a model-style helper owned by NSGridView, created \
            when rows are added, and vended through row(at:). The only public \
            initializer is init(coder:); cells inside the row are accessed via \
            cell(at:). You read the row's gridView back-reference and \
            numberOfCells, iterate cells with cell(at:), and write \
            height (a fixed point value or NSGridView.sizedForContent), \
            topPadding / bottomPadding (vertical space around the row's content), \
            isHidden (skip the row during layout), rowAlignment (the per-row \
            override of the grid's rowAlignment), and yPlacement (the per-row \
            override of the grid's yPlacement).

            rowAlignment uses NSGridRow.Alignment — the most useful value is \
            .firstBaseline, which aligns the first text baselines of cells in \
            the row so labels and controls in adjacent columns share a baseline. \
            mergeCells(in:) merges a column range within the row into one cell, \
            mirroring NSGridColumn.mergeCells(in:) on the perpendicular axis.
            """,
            signatures: [
                "@MainActor class NSGridRow",
                "var gridView: NSGridView? { get }",
                "var numberOfCells: Int { get }",
                "var height: CGFloat",
                "var topPadding: CGFloat",
                "var bottomPadding: CGFloat",
                "var isHidden: Bool",
                "var rowAlignment: NSGridRow.Alignment",
                "var yPlacement: NSGridCell.Placement",
                "func cell(at index: Int) -> NSGridCell",
                "func mergeCells(in range: NSRange)",
                "init(coder: NSCoder)"
            ],
            notes: [
                "Owned by NSGridView. Created by the grid, vended by row(at:). No public initializer beyond init(coder:).",
                "Inherits NSObject. Not a renderable view — describes the geometry the grid uses when laying out cells in this row.",
                "height: assign a fixed CGFloat for a fixed-height row, or NSGridView.sizedForContent to revert to auto-sized.",
                "rowAlignment cases (NSGridRow.Alignment): .inherited, .none, .firstBaseline, .lastBaseline. .firstBaseline is the typical choice when labels and controls share a row.",
                "Per-row rowAlignment / yPlacement override the grid view's grid-wide values; per-cell overrides on NSGridCell shadow the row.",
                "isHidden hides the row without removing it — recomputes layout for everything that remains visible.",
                "mergeCells(in:) merges the supplied column range into a single spanning cell within this row."
            ]
        )
    }
}

#Preview {
    NSGridRowDescribePage()
        .frame(width: 900, height: 700)
}
