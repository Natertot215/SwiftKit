import SwiftUI

// Describe-track page for NSTableHeaderCell.
// Source: Documentation/AppKit/views-and-controls/nstableheadercell.md
// Cell type used internally by NSTableHeaderView to draw column headers.
// The renderable surface is on the NSTableView page; subclassing this cell
// is rare in modern code.

struct NSTableHeaderCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTableHeaderCell",
            docPath: "Documentation/AppKit/views-and-controls/nstableheadercell.md",
            availability: "macOS",
            blurb: """
            An object that a table header view uses to draw the content of \
            the column headers. NSTableHeaderCell is an NSTextFieldCell \
            subclass — by default it renders the column's title in the \
            standard small bold header font and, on the active sort column, \
            an ascending or descending sort indicator.

            Each NSTableColumn owns its own headerCell. To customize how a \
            single column's header looks (alignment, color, attributed \
            string), assign a configured NSTableHeaderCell (or a subclass) \
            to that column's headerCell:

              column.headerCell.title = "Name"
              column.headerCell.alignment = .center
              column.headerCell.textColor = .secondaryLabelColor

            The class also exposes the two methods AppKit uses to draw the \
            sort triangle — drawSortIndicator(withFrame:in:ascending:priority:) \
            and sortIndicatorRect(forBounds:). Override these in a subclass \
            to substitute a custom sort indicator or to position the \
            existing one differently.

            Subclassing is otherwise rare. The standard pattern for header \
            customization is to set per-column headerCell properties or to \
            replace headerCell with a configured instance, not to subclass \
            NSTableHeaderCell wholesale.
            """,
            signatures: [
                "class NSTableHeaderCell : NSTextFieldCell",
                "func drawSortIndicator(withFrame cellFrame: NSRect, in controlView: NSView, ascending: Bool, priority: Int)",
                "func sortIndicatorRect(forBounds bounds: NSRect) -> NSRect",
                "var title: String",
                "var alignment: NSTextAlignment",
                "var textColor: NSColor"
            ],
            notes: [
                "Inherits NSTextFieldCell. Each NSTableColumn carries one — assign a fresh configured NSTableHeaderCell (or subclass instance) to NSTableColumn.headerCell to customize per-column header rendering.",
                "Default behavior already handles standard sort indicators. Override drawSortIndicator(withFrame:in:ascending:priority:) only for custom sort glyphs.",
                "All NSCell drawing entry points (drawInterior(withFrame:in:), edit(withFrame:in:editor:delegate:event:), highlight(_:withFrame:in:)) are available for fully custom rendering when needed.",
                "Inherits NSTextFieldCell, so attributed strings and standard text-cell properties (alignment, font, textColor, attributedStringValue) work without ceremony.",
                "When the entire header strip should disappear (sidebar look), set NSTableView.headerView to nil rather than customizing this cell."
            ]
        )
    }
}

#Preview {
    NSTableHeaderCellDescribePage()
        .frame(width: 900, height: 700)
}
