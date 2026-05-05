import SwiftUI

// Describe-track page for NSCell.
// Source: Documentation/AppKit/views-and-controls/nscell.md
// NSCell is the abstract base class that historically provided most of the
// internal drawing, value-handling, and tracking machinery for AppKit's
// control hierarchy ("cells are used by most of the NSControl classes to
// implement their internal workings"). Modern macOS apps almost always use
// the cell-less initializers and the view-level APIs on NSControl /
// NSTableView / NSCollectionView; NSCell shows up directly only when
// implementing a custom cell-based control or interacting with legacy
// matrix / tableColumn APIs. Renderable on its own: no — the cell is drawn
// inside whatever NSControl owns it.

struct NSCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCell",
            docPath: "Documentation/AppKit/views-and-controls/nscell.md",
            availability: "macOS 10.0+",
            blurb: """
            A mechanism for displaying text or images in a view object without the overhead of a \
            full NSView subclass. NSCell predates the modern view-based AppKit control pipeline; it \
            was originally how a single NSControl could host many independently-rendered hit \
            regions (the canonical example is NSMatrix, which packs N cells into one view). Today, \
            most cell-based APIs have view-based replacements (NSTableView's view-based mode, \
            NSOutlineView, NSCollectionView) and the cell appears only as the implementation \
            detail of single-cell controls.

            Apple's docs require subclassers to implement all of NSCell's designated initializers: \
            init(), init(coder:), init(textCell:), and init(imageCell:). NSCell drives drawing via \
            draw(withFrame:in:), tracking via trackMouse(with:in:of:untilMouseUp:), value handling \
            via objectValue / stringValue / intValue, state via state and nextState, and a great \
            deal of legacy text-attribute storage that survives mostly for compatibility with \
            existing NSTextFieldCell / NSButtonCell behaviors.
            """,
            signatures: [
                "@MainActor class NSCell : NSObject",
                "init()",
                "init(coder: NSCoder)",
                "init(textCell: String)",
                "init(imageCell: NSImage?)",
                "var objectValue: Any?",
                "var stringValue: String",
                "var state: NSControl.StateValue",
                "var isEnabled: Bool",
                "var isBordered: Bool",
                "var isBezeled: Bool",
                "var alignment: NSTextAlignment",
                "var font: NSFont?",
                "var image: NSImage?",
                "var controlSize: NSControl.ControlSize",
                "func draw(withFrame cellFrame: NSRect, in controlView: NSView)",
                "func trackMouse(with event: NSEvent, in cellFrame: NSRect, of controlView: NSView, untilMouseUp flag: Bool) -> Bool",
                "func performClick(_ sender: Any?)"
            ],
            notes: [
                "Abstract base class — Apple's documentation lists NSActionCell, NSBrowserCell, NSImageCell, and NSTextAttachmentCell as the immediate concrete subclasses that ship with AppKit.",
                "Required designated initializers when subclassing: init(), init(coder:), init(textCell:), init(imageCell:).",
                "Modern alternatives: prefer view-based NSTableView / NSOutlineView / NSCollectionView over cell-based variants. Use NSControl directly for single-cell controls — the cell layer is an implementation detail.",
                "State values via NSControl.StateValue: .off, .on, .mixed.",
                "controlSize options: .mini, .small, .regular, .large.",
                "Tracking: trackMouse(with:in:of:untilMouseUp:) is invoked by the host NSControl during mouseDown(with:); subclasses can return early to short-circuit highlight / action behavior.",
                "Backing storage for cell text attributes (font, alignment, lineBreakMode, …) is mostly legacy — view-based equivalents exist on the corresponding NSControl subclasses.",
                "NSCell does not subclass NSView and has no own renderable surface. It is drawn by whatever NSControl (or NSMatrix row) owns it via draw(withFrame:in:)."
            ]
        )
    }
}

#Preview {
    NSCellDescribePage()
        .frame(width: 900, height: 700)
}
