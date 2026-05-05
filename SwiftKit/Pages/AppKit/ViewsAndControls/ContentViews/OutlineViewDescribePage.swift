import SwiftUI

// Describe-track page for the "Outline View" overview article.
// Source: Documentation/AppKit/views-and-controls/outline-view.md
// "Outline View" is a collectionGroup overview page in Apple's docs — it
// groups NSOutlineView with its data-source and delegate protocols. The
// renderable demo lives on the NSOutlineView page; this page documents the
// grouping and how the pieces fit together.

struct OutlineViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Outline View",
            docPath: "Documentation/AppKit/views-and-controls/outline-view.md",
            availability: "macOS (NSOutlineView and supporting types)",
            blurb: """
            Apple's documentation groups three AppKit symbols under \
            "Outline View" — NSOutlineView and the two protocols that drive \
            it, NSOutlineViewDataSource and NSOutlineViewDelegate. Together \
            they display a list-based interface for hierarchical data, where \
            each level of hierarchy is indented from the previous one.

            How the pieces compose:

              \u{2022} NSOutlineView is the visible control. It inherits \
            NSTableView, so the entire row/column rendering surface from \
            tables is available — plus disclosure triangles, indentation, \
            expand/collapse, and outline-column persistence on top.
              \u{2022} NSOutlineViewDataSource supplies the tree shape: \
            number of children for an item, the child at an index, whether \
            an item is expandable, and the value to display for an item.
              \u{2022} NSOutlineViewDelegate supplies the per-row view (the \
            modern view-based outline pattern), expand/collapse policy, \
            selection policy, sizing, group rows, drag-and-drop \
            participation, and per-row tint configuration.

            Sidebars like Mail's mailbox list and Finder's source list are \
            classic NSOutlineView surfaces. Reach for NSOutlineView when \
            you have hierarchical data that lives in one indented column \
            rather than the column-stack metaphor of NSBrowser. SwiftUI's \
            equivalent is List with hierarchical children, or \
            NavigationSplitView's sidebar.
            """,
            signatures: [
                "class NSOutlineView : NSTableView",
                "protocol NSOutlineViewDataSource : NSObjectProtocol",
                "protocol NSOutlineViewDelegate : NSControlTextEditingDelegate"
            ],
            notes: [
                "Doc kind: collectionGroup. The article itself defines no API — it points to NSOutlineView (control), NSOutlineViewDataSource (data), and NSOutlineViewDelegate (behavior).",
                "NSOutlineView inherits NSTableView. Anything you can do on a table — selection, drag-and-drop, autosaving, column reordering, alternating row backgrounds — works on an outline view too.",
                "Hierarchy comes from the data source by relationship — there is no flat IndexPath; the outline asks numberOfChildrenOfItem and child:ofItem: as it walks the tree on demand.",
                "Each item identity must be stable across reloads — the same pointer (or NSObject.isEqual sameness) for the same item, or expand/collapse state can't be preserved.",
                "See Also targets in the doc: Browser View, Collection View, Table View, NSTextView — the four major content-view families in AppKit.",
                "The companion sample article is \"Navigating Hierarchical Data Using Outline and Split Views\"."
            ]
        )
    }
}

#Preview {
    OutlineViewDescribePage()
        .frame(width: 900, height: 700)
}
