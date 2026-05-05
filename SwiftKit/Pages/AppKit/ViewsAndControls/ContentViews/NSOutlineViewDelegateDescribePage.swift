import SwiftUI

// Describe-track page for NSOutlineViewDelegate.
// Source: Documentation/AppKit/views-and-controls/nsoutlineviewdelegate.md
// Protocol — has no on-screen surface of its own. The renderable demo lives
// on NSOutlineView, where a sample delegate supplies view-based row cells.

struct NSOutlineViewDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSOutlineViewDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nsoutlineviewdelegate.md",
            availability: "macOS",
            blurb: """
            A set of optional methods implemented by delegates of \
            NSOutlineView objects. Where the data source supplies the tree's \
            shape and per-item values, the delegate supplies behavior and \
            view rendering.

            For modern view-based outline views, two delegate methods do \
            most of the work:

              \u{2022} outlineView(_:viewFor:item:) — return an NSView \
            (typically an NSTableCellView) for a column + item. This is \
            where text fields, image views, accessory controls, and any \
            per-row layout live.
              \u{2022} outlineView(_:rowViewForItem:) — optionally return a \
            custom NSTableRowView for a row when row-wide chrome \
            (selection look, separator, group-row treatment) needs to \
            diverge from the default.

            Beyond rendering, the delegate is the home for:

              \u{2022} Expand/collapse policy — \
            outlineView(_:shouldExpandItem:), \
            outlineView(_:shouldCollapseItem:), and the four notifications \
            outlineViewItemWillExpand:, outlineViewItemDidExpand:, \
            outlineViewItemWillCollapse:, outlineViewItemDidCollapse:.
              \u{2022} Selection policy — outlineView(_:shouldSelectItem:), \
            outlineView(_:selectionIndexesForProposedSelection:), \
            outlineViewSelectionDidChange:.
              \u{2022} Sizing — outlineView(_:heightOfRowByItem:) and \
            outlineView(_:sizeToFitWidthOfColumn:).
              \u{2022} Group rows — outlineView(_:isGroupItem:) drives the \
            section-header look used by sidebars.
              \u{2022} Per-item tint — outlineView(_:tintConfigurationForItem:) \
            applies an NSTintConfiguration (e.g., a fixed-color sidebar item \
            in Mail).

            NSOutlineViewDelegate inherits from NSControlTextEditingDelegate, \
            so text-editing callbacks for inline editing of cells also \
            arrive on the delegate.
            """,
            signatures: [
                "protocol NSOutlineViewDelegate : NSControlTextEditingDelegate",
                "func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView?",
                "func outlineView(_ outlineView: NSOutlineView, rowViewForItem item: Any) -> NSTableRowView?",
                "func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool",
                "func outlineView(_ outlineView: NSOutlineView, shouldExpandItem item: Any) -> Bool",
                "func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat",
                "func outlineView(_ outlineView: NSOutlineView, tintConfigurationForItem item: Any) -> NSTintConfiguration?"
            ],
            notes: [
                "Protocol — nothing renders on its own. The NSOutlineView page hosts a working delegate that returns NSTableCellView instances for each row.",
                "Inherits NSControlTextEditingDelegate. Text-editing callbacks (controlTextDidChange:, etc.) for inline cell editing land on the delegate alongside the outline-specific methods.",
                "Two-protocol split: data source = tree shape + values + drag accept/validate + sort. Delegate = views + selection + expand/collapse + sizing + group rows + tint.",
                "outlineView(_:viewFor:item:) is the modern path. Cell-based outlines (the dataCellFor:item: family) are legacy.",
                "NSOutlineView holds the delegate weakly — own it elsewhere (typically the same coordinator that owns the data source) so it isn't released while the outline is alive."
            ]
        )
    }
}

#Preview {
    NSOutlineViewDelegateDescribePage()
        .frame(width: 900, height: 700)
}
