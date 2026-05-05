import SwiftUI

// Describe-track page for NSBrowserDelegate.
// Source: Documentation/AppKit/views-and-controls/nsbrowserdelegate.md
// Protocol — has no on-screen surface of its own. The renderable demo lives
// on NSBrowser, where a sample delegate populates a static "Animals" tree.

struct NSBrowserDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSBrowserDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nsbrowserdelegate.md",
            availability: "macOS 10.0+",
            blurb: """
            A set of methods that a browser delegate implements to manage \
            selection, scrolling, sizing, and other behavior of an NSBrowser. \
            All methods are optional, but in practice an NSBrowser is useless \
            without a delegate that supplies the tree.

            Two equivalent ways to feed an NSBrowser via the delegate exist:

              \u{2022} Item-based methods (modern, recommended). The delegate \
            returns root and child Any-typed items by relationship; the \
            browser walks them one column at a time. The minimum set is \
            rootItem(for:), browser(_:numberOfChildrenOfItem:), \
            browser(_:child:ofItem:), browser(_:isLeafItem:), and \
            browser(_:objectValueForItem:).
              \u{2022} Matrix-based methods (legacy). The delegate populates \
            an NSMatrix per column directly via \
            browser(_:createRowsForColumn:in:). New code should not use this \
            path; it interacts with deprecated NSMatrix machinery.

            Beyond data, the delegate is also the place to wire selection \
            policy (selectionIndexesForProposedSelection:inColumn:), \
            type-select, drag-and-drop participation as both source and \
            destination, sizing (sizeToFitWidthOfColumn:, \
            shouldSizeColumn:forUserResize:toWidth:), and per-leaf preview \
            view controllers via previewViewControllerForLeafItem:.

            NSBrowserDelegate doubles as the data source — there is no \
            separate NSBrowserDataSource protocol the way NSTableView splits \
            data and behavior across two protocols.
            """,
            signatures: [
                "protocol NSBrowserDelegate : NSObjectProtocol",
                "func rootItem(for browser: NSBrowser) -> Any?",
                "func browser(_ browser: NSBrowser, numberOfChildrenOfItem item: Any?) -> Int",
                "func browser(_ browser: NSBrowser, child index: Int, ofItem item: Any?) -> Any",
                "func browser(_ browser: NSBrowser, isLeafItem item: Any?) -> Bool",
                "func browser(_ browser: NSBrowser, objectValueForItem item: Any?) -> Any?"
            ],
            notes: [
                "Protocol — nothing renders on its own. The NSBrowser page hosts a working delegate that walks a static Animals tree.",
                "Inherits NSObjectProtocol. Conform from a class (typically the view controller or a dedicated coordinator) — NSBrowser holds the delegate weakly.",
                "Item-based methods (rootItem(for:), child:ofItem:, isLeafItem:, objectValueForItem:) are the modern path. Matrix-based methods are legacy and tied to deprecated NSMatrix usage.",
                "Two non-data surfaces matter in modern apps: drag-and-drop (validateDrop:proposedRow:column:dropOperation:, acceptDrop:atRow:column:dropOperation:) and per-leaf previews (previewViewControllerForLeafItem:).",
                "selectionIndexesForProposedSelection:inColumn: is the gatekeeper for selection — return a different IndexSet to redirect or filter what the user just clicked."
            ]
        )
    }
}

#Preview {
    NSBrowserDelegateDescribePage()
        .frame(width: 900, height: 700)
}
