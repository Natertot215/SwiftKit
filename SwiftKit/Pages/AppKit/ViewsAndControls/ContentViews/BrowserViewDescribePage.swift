import SwiftUI

// Describe-track page for the "Browser View" overview article.
// Source: Documentation/AppKit/views-and-controls/browser-view.md
// "Browser View" is a collectionGroup overview page in Apple's docs — it
// groups the three classes that make up AppKit's column-based hierarchical
// browser (NSBrowser, NSBrowserDelegate, NSBrowserCell). The renderable demo
// lives on the NSBrowser page; this page documents the grouping and how the
// pieces fit together.

struct BrowserViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Browser View",
            docPath: "Documentation/AppKit/views-and-controls/browser-view.md",
            availability: "macOS (NSBrowser and supporting types)",
            blurb: """
            Apple's documentation groups three AppKit classes under \
            "Browser View" — NSBrowser, NSBrowserDelegate, NSBrowserCell. \
            Together they provide a column-based interface for viewing and \
            navigating hierarchical information.

            How the pieces compose:

              \u{2022} NSBrowser is the visible control. It draws indexed \
            columns left-to-right; each successive column shows the next \
            level down in the data hierarchy. Internally each column hosts \
            an NSScrollView and an NSMatrix populated with cells.
              \u{2022} NSBrowserDelegate is the data + behavior contract. \
            The browser asks the delegate for the number of rows in each \
            column, the value at a given index path, child relationships, \
            preview view controllers for leaves, sizing, and drag-and-drop \
            participation.
              \u{2022} NSBrowserCell is the NSCell subclass used by default \
            for each row in each column — it draws the title, the optional \
            image / alternateImage, and the chevron-style branch-image when \
            an item has children.

            Browsers excel at the Finder column-view interaction model: a \
            user clicks a row, the next column slides in showing that row's \
            children, and the path is reflected back via path() / setPath. \
            Modern macOS apps more often reach for NSOutlineView (single \
            indented list) or SwiftUI's NavigationSplitView, but NSBrowser \
            remains the right tool when the column-stack metaphor is the \
            point — the macOS Finder column view is the canonical example.
            """,
            signatures: [
                "class NSBrowser : NSControl",
                "protocol NSBrowserDelegate : NSObjectProtocol",
                "class NSBrowserCell : NSCell"
            ],
            notes: [
                "Doc kind: collectionGroup. The article itself defines no API — it points to the three member types listed under Topics.",
                "NSBrowser inherits NSControl. Internally each column is an NSScrollView wrapping an NSMatrix of NSBrowserCell instances.",
                "The delegate is the data-source plus the behavior surface — NSBrowser does not publish a separate NSBrowserDataSource protocol the way NSTableView does.",
                "See Also targets in the doc: Collection View, Outline View, Table View, NSTextView — the four major content-view families in AppKit.",
                "Finder's column view is the canonical NSBrowser-style interaction; it isn't necessarily implemented as NSBrowser today, but the metaphor is what NSBrowser was designed to express."
            ]
        )
    }
}

#Preview {
    BrowserViewDescribePage()
        .frame(width: 900, height: 700)
}
