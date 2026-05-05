import SwiftUI

// Describe-track page for NSOutlineViewDataSource.
// Source: Documentation/AppKit/views-and-controls/nsoutlineviewdatasource.md
// Protocol — has no on-screen surface of its own. The renderable demo lives
// on NSOutlineView, where a sample data source supplies a static "Library"
// tree.

struct NSOutlineViewDataSourceDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSOutlineViewDataSource",
            docPath: "Documentation/AppKit/views-and-controls/nsoutlineviewdatasource.md",
            availability: "macOS",
            blurb: """
            A set of methods that an outline view calls to retrieve data and \
            information about it from the data source delegate, and — \
            optionally — to update data values.

            All methods are technically marked optional, but for a \
            programmatic data source (no Cocoa bindings), four are required \
            in practice:

              \u{2022} outlineView(_:numberOfChildrenOfItem:) — how many \
            children does this item have? Returns 0 for leaves and for the \
            data-source-not-yet-configured case.
              \u{2022} outlineView(_:child:ofItem:) — return the child at \
            index for a parent. NSOutlineView identifies items by pointer / \
            NSObject.isEqual, so this method must return the same object for \
            the same logical item across calls.
              \u{2022} outlineView(_:isItemExpandable:) — does this item have \
            children that can be disclosed? Drives whether a disclosure \
            triangle is drawn.
              \u{2022} outlineView(_:objectValueFor:byItem:) — what cell \
            value should be drawn for this item in this column? In modern \
            view-based outline views, the delegate's viewFor:item: usually \
            takes precedence.

            Beyond the basic four, the data source is also where \
            drag-and-drop is implemented (validateDrop:proposedItem:..., \
            acceptDrop:item:childIndex:, writeItems:to:), where sorting \
            descriptors land (sortDescriptorsDidChange:), and where state \
            persistence hooks live (persistentObjectForItem:, \
            itemForPersistentObject:).

            NSOutlineView keeps a weak reference to its data source — own \
            it elsewhere (typically a coordinator or view controller) so it \
            isn't released while the outline is alive.
            """,
            signatures: [
                "protocol NSOutlineViewDataSource : NSObjectProtocol",
                "func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int",
                "func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any",
                "func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool",
                "func outlineView(_ outlineView: NSOutlineView, objectValueFor tableColumn: NSTableColumn?, byItem item: Any?) -> Any?"
            ],
            notes: [
                "Protocol — nothing renders on its own. The NSOutlineView page hosts a working data source for a static Library tree.",
                "Apple's docs: \"Some of the methods in this protocol ... are called very frequently, so they must be efficient.\" Keep the four basic methods O(1) where possible.",
                "Item identity must be stable: returning a new object for the same logical item between calls breaks expand/collapse persistence.",
                "Cocoa bindings can replace these methods entirely — bind the outline view's content to an NSTreeController in a nib and the data-source methods become unnecessary.",
                "Drag-and-drop sits on the data source (write/validate/accept), while drag visuals and selection-during-drag sit on the delegate."
            ]
        )
    }
}

#Preview {
    NSOutlineViewDataSourceDescribePage()
        .frame(width: 900, height: 700)
}
