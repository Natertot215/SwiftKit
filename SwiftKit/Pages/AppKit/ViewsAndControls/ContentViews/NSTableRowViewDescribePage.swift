import SwiftUI

// Describe-track page for NSTableRowView.
// Source: Documentation/AppKit/views-and-controls/nstablerowview.md
// View type that draws row-wide chrome under each row's cells. NSTableView
// supplies a default instance; subclassing is reserved for cases where
// selection, separator, or group-row drawing must diverge.

struct NSTableRowViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTableRowView",
            docPath: "Documentation/AppKit/views-and-controls/nstablerowview.md",
            availability: "macOS 10.7+",
            blurb: """
            The view shown for a row in a table view. NSTableRowView is the \
            container that sits behind each row's cell views and is \
            responsible for displaying attributes associated with the row \
            as a whole — selection highlight, alternating background, group \
            row look, and the separator line beneath.

            Where it sits in the hierarchy:

              \u{2022} NSTableView owns rows.
              \u{2022} Each row is an NSTableRowView.
              \u{2022} Each row contains one NSTableCellView per column \
            (in a view-based table).

            NSTableView provides a default NSTableRowView that handles all \
            standard chrome correctly — most apps never see this class \
            directly. The two reasons to return a custom NSTableRowView \
            from NSTableViewDelegate.tableView(_:rowViewForRow:) are:

              \u{2022} Custom selection look — override drawSelection(in:) \
            to paint a non-system selection highlight (a colored capsule, \
            for instance), or override drawBackground(in:) to paint a \
            row-wide background that ignores alternating colors.
              \u{2022} Custom separator or group-row look — override \
            drawSeparator(in:) to suppress or restyle the inter-row line, \
            or set isGroupRowStyle = true to render the row in the \
            sidebar-section-header look.

            Property surface that matters at runtime:

              \u{2022} isSelected, isEmphasized — read by drawSelection(in:) \
            to decide which highlight color to draw. AppKit toggles these \
            as the selection and window focus change.
              \u{2022} interiorBackgroundStyle — derived value (.normal or \
            .emphasized) that cell-view subclasses can read to choose \
            foreground colors for custom drawing.
              \u{2022} isFloating, isNextRowSelected, \
            isPreviousRowSelected — context flags used to draw correct \
            corner radii on adjacent selected rows.
              \u{2022} draggingDestinationFeedbackStyle, \
            isTargetForDropOperation, indentationForDropOperation — drag \
            visuals when this row is the drop target.
            """,
            signatures: [
                "class NSTableRowView : NSView",
                "var isSelected: Bool",
                "var isEmphasized: Bool",
                "var isFloating: Bool",
                "var isGroupRowStyle: Bool",
                "var interiorBackgroundStyle: NSView.BackgroundStyle",
                "var selectionHighlightStyle: NSTableView.SelectionHighlightStyle",
                "var draggingDestinationFeedbackStyle: NSTableView.DraggingDestinationFeedbackStyle",
                "func drawSelection(in dirtyRect: NSRect)",
                "func drawBackground(in dirtyRect: NSRect)",
                "func drawSeparator(in dirtyRect: NSRect)",
                "func drawDraggingDestinationFeedback(in dirtyRect: NSRect)"
            ],
            notes: [
                "Inherits NSView. Available macOS 10.7+, alongside the introduction of view-based table views.",
                "Default behavior is correct for almost every app. Return a custom NSTableRowView from tableView(_:rowViewForRow:) only when chrome must diverge.",
                "Override the four draw* methods (drawSelection, drawBackground, drawSeparator, drawDraggingDestinationFeedback) for tailored row chrome — never modify cell-level subviews from here, that's NSTableCellView's job.",
                "isGroupRowStyle = true is how the floating section-header look is achieved (paired with floatsGroupRows on the table itself).",
                "isNextRowSelected / isPreviousRowSelected let custom drawSelection() handle pill-style cumulative selection rendering correctly across adjacent rows."
            ]
        )
    }
}

#Preview {
    NSTableRowViewDescribePage()
        .frame(width: 900, height: 700)
}
