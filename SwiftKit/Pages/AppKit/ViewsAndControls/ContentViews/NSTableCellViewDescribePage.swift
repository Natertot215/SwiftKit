import SwiftUI

// Describe-track page for NSTableCellView.
// Source: Documentation/AppKit/views-and-controls/nstablecellview.md
// Container view returned by NSTableViewDelegate's tableView(_:viewFor:row:).
// The renderable surface lives on the NSTableView page where each row's
// cell view is an NSTableCellView with a textField.

struct NSTableCellViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTableCellView",
            docPath: "Documentation/AppKit/views-and-controls/nstablecellview.md",
            availability: "macOS 10.7+",
            blurb: """
            A reusable container view shown for a particular cell in a \
            table view that uses rows for content. NSTableCellView is the \
            canonical view returned from \
            NSTableViewDelegate.tableView(_:viewFor:row:) in modern \
            view-based tables and outline views.

            Why the class exists separately from NSView:

              \u{2022} It carries two outlets — imageView and textField — \
            that Interface Builder wires automatically and that the system \
            updates with the cell's objectValue. Subclasses can add \
            additional outlets and connect them programmatically or in \
            Interface Builder.
              \u{2022} It carries objectValue, the represented model object \
            for the row. The default tableView(_:objectValueFor:row:) \
            data-source method feeds this through to the cell view.
              \u{2022} It carries backgroundStyle, an NSView.BackgroundStyle \
            value AppKit toggles between .normal and .emphasized as the row \
            is selected. Stock controls inside the cell pick up the right \
            text color automatically; custom drawing should observe this \
            value.
              \u{2022} It carries draggingImageComponents — a \
            customization point for what the cell looks like during a drag.

            Reuse is via NSTableView.makeView(withIdentifier:owner:). The \
            standard pattern: ask the table for a view by identifier; if \
            non-nil, reuse it; otherwise create a new NSTableCellView, give \
            it that identifier, build out subviews, and return it. The \
            renderable surface on the NSTableView page follows exactly that \
            pattern.
            """,
            signatures: [
                "class NSTableCellView : NSView",
                "var objectValue: Any?",
                "@IBOutlet weak var imageView: NSImageView?",
                "@IBOutlet weak var textField: NSTextField?",
                "var backgroundStyle: NSView.BackgroundStyle",
                "var rowSizeStyle: NSTableView.RowSizeStyle",
                "var draggingImageComponents: [NSDraggingImageComponent]"
            ],
            notes: [
                "Inherits NSView. Available macOS 10.7+ — predates view-based table views, which arrived in the same release.",
                "imageView and textField are outlets, not strict requirements. They exist for the common \"icon + label\" cell layout; subclasses can ignore them and add their own outlets.",
                "objectValue is set automatically when the data source implements tableView(_:objectValueFor:row:). For purely view-based tables, the delegate's viewFor:row: usually mutates the cell directly and objectValue is unused.",
                "backgroundStyle flips between .normal and .emphasized as the row's selection state changes. Use it to choose foreground colors in custom subviews.",
                "Reuse via NSTableView.makeView(withIdentifier:owner:). Always set an NSUserInterfaceItemIdentifier on the cell view so the table can recycle it."
            ]
        )
    }
}

#Preview {
    NSTableCellViewDescribePage()
        .frame(width: 900, height: 700)
}
