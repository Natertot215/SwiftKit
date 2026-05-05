import SwiftUI

// Describe-track page for NSBrowserCell.
// Source: Documentation/AppKit/views-and-controls/nsbrowsercell.md
// Cell type used internally by NSBrowser to draw rows; subclassing is rare.
// The renderable surface is on the NSBrowser page where rows are drawn by
// NSBrowserCell instances created automatically by the browser.

struct NSBrowserCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSBrowserCell",
            docPath: "Documentation/AppKit/views-and-controls/nsbrowsercell.md",
            availability: "macOS",
            blurb: """
            The user interface of a browser. NSBrowserCell is the NSCell \
            subclass that NSBrowser uses by default to display each row in \
            each column — an NSMatrix per column is populated with \
            NSBrowserCell instances at load time.

            Each cell carries the small per-row state NSBrowser needs:

              \u{2022} title — the visible text, typically supplied by the \
            delegate via objectValueForItem:.
              \u{2022} image / alternateImage — optional leading icon and \
            its highlighted variant.
              \u{2022} branchImage / highlightedBranchImage — the chevron-style \
            indicator drawn at the trailing edge for non-leaf rows.
              \u{2022} isLeaf — whether to draw the branch image; flipped per-row \
            from browser(_:isLeafItem:).
              \u{2022} isLoaded — whether the cell's contents have been \
            populated yet (NSBrowser uses this for column lazy-load).

            Direct instantiation is rare. Apps customize an NSBrowser by \
            (a) implementing NSBrowserDelegate's \
            browser(_:willDisplayCell:atRow:column:) to mutate the default \
            NSBrowserCell before display, or (b) providing a custom NSCell \
            subclass via NSBrowser.setCellClass(_:) when fundamentally \
            different per-row rendering is needed.
            """,
            signatures: [
                "class NSBrowserCell : NSCell",
                "var image: NSImage?",
                "var alternateImage: NSImage?",
                "class var branchImage: NSImage?",
                "class var highlightedBranchImage: NSImage?",
                "var isLeaf: Bool",
                "var isLoaded: Bool",
                "func reset()",
                "func set()",
                "func highlightColor(in controlView: NSView?) -> NSColor?"
            ],
            notes: [
                "Apple's docs: \"Each column contains an NSMatrix object filled with NSBrowserCell objects.\" The renderable surface lives on the NSBrowser page.",
                "Inherits NSCell. The four most common entry points are title (text), image (leading), isLeaf (drives branch chevron drawing), and isLoaded (column lazy-load bookkeeping).",
                "Customization typically happens via NSBrowserDelegate's browser(_:willDisplayCell:atRow:column:) — modify the default cell at draw time rather than subclassing.",
                "branchImage / highlightedBranchImage are class properties — overrides apply globally to every NSBrowser using the default cell class.",
                "When per-row rendering needs to diverge fundamentally, supply a custom NSCell subclass via NSBrowser.setCellClass(_:) or the legacy NSBrowser.cellPrototype."
            ]
        )
    }
}

#Preview {
    NSBrowserCellDescribePage()
        .frame(width: 900, height: 700)
}
