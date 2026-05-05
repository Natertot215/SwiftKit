import SwiftUI

// Describe-track page for NSTableViewRowAction.
// Source: Documentation/AppKit/views-and-controls/nstableviewrowaction.md
// Model object representing one swipe action. Returned by the delegate's
// tableView(_:rowActionsForRow:edge:); the table view draws and dispatches
// the resulting buttons.

struct NSTableViewRowActionDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTableViewRowAction",
            docPath: "Documentation/AppKit/views-and-controls/nstableviewrowaction.md",
            availability: "macOS 10.11+",
            blurb: """
            A single action to present when the user swipes horizontally on \
            a table row. NSTableViewRowAction is a small model object — \
            text, color, optional image, and a handler block — that an \
            NSTableViewDelegate returns from \
            tableView(_:rowActionsForRow:edge:) to populate the swipe \
            buttons.

            How it composes:

              \u{2022} The user swipes a row left or right (or invokes the \
            equivalent keyboard / accessibility action).
              \u{2022} NSTableView calls the delegate's \
            tableView(_:rowActionsForRow:edge:) with the row index and an \
            NSTableView.RowActionEdge (.leading or .trailing).
              \u{2022} The delegate returns an array of \
            NSTableViewRowAction values.
              \u{2022} NSTableView draws those values as buttons in the \
            edge gutter and invokes the corresponding handler when the \
            user clicks one.

            Per-action configuration:

              \u{2022} style — NSTableViewRowAction.Style. .regular for a \
            neutral action (Archive, Flag), .destructive for a red action \
            (Delete). Style influences the default background color.
              \u{2022} title — visible text on the button.
              \u{2022} image — optional NSImage shown above (or replacing) \
            the title. SF Symbols work well here.
              \u{2022} backgroundColor — overrides the style-derived \
            default. Use sparingly; the default colors match macOS \
            conventions.
              \u{2022} handler — closure invoked when the user clicks the \
            button. Receives the action and the row index.

            For row actions to be visible at all, NSTableView.rowActionsVisible \
            and the corresponding edge must be enabled and the delegate \
            method must return non-empty arrays.
            """,
            signatures: [
                "class NSTableViewRowAction : NSObject",
                "init(style: NSTableViewRowAction.Style, title: String, handler: @escaping (NSTableViewRowAction, Int) -> Void)",
                "var style: NSTableViewRowAction.Style",
                "var title: String",
                "var image: NSImage?",
                "var backgroundColor: NSColor?"
            ],
            notes: [
                "Inherits NSObject. Conforms to NSCopying — actions can be safely passed across threads / stored alongside the model.",
                "Returned from NSTableViewDelegate.tableView(_:rowActionsForRow:edge:). The delegate decides which actions appear on the leading vs trailing edge.",
                "Two styles: .regular and .destructive. Destructive renders red by default — reserved for irreversible actions like Delete.",
                "The handler closure receives the action itself plus the row index — useful for logging which action fired without capturing each row in a separate closure.",
                "The companion enum NSTableView.RowActionEdge identifies which edge the user swiped — pair leading vs trailing actions accordingly."
            ]
        )
    }
}

#Preview {
    NSTableViewRowActionDescribePage()
        .frame(width: 900, height: 700)
}
