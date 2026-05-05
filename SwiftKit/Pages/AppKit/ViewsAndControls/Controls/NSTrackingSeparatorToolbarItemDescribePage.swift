import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSTrackingSeparatorToolbarItem — an NSToolbarItem subclass that
// renders a vertical separator aligned with a split-view divider in the
// same window.
// Source: Documentation/AppKit/views-and-controls/nstrackingseparatortoolbaritem.md

struct NSTrackingSeparatorToolbarItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTrackingSeparatorToolbarItem",
            docPath: "Documentation/AppKit/views-and-controls/nstrackingseparatortoolbaritem.md",
            availability: "macOS 11.0",
            blurb: """
            An NSToolbarItem subclass that draws a vertical separator in the \
            toolbar and tracks the position of an NSSplitView divider in the \
            same window. As the user drags the split-view divider, the \
            separator slides to match — keeping the toolbar items above each \
            split-view pane visually aligned with that pane's content.

            This is the canonical shape for sidebar-plus-detail apps (Mail, \
            Notes, Music): items above the sidebar (e.g. the sidebar toggle, \
            mailbox controls) sit on the left of the separator; items above \
            the detail (e.g. compose, search, formatting) sit on the right.

            Configure:

              \u{2022} init(identifier:splitView:dividerIndex:) — the \
            tracking separator references an NSSplitView and the index of \
            the divider it should track.
              \u{2022} The split view must be in the same window as the \
            toolbar before the toolbar shows.
              \u{2022} dividerIndex / splitView are mutable — reassign if \
            the split-view layout changes.

            From SwiftUI, the equivalent is automatic: a \
            NavigationSplitView's toolbar items are split across the sidebar \
            and detail columns by SwiftUI's compositor, with the same \
            tracking-separator chrome under the hood.
            """,
            signatures: [
                "class NSTrackingSeparatorToolbarItem : NSToolbarItem",
                "init(identifier: NSToolbarItem.Identifier, splitView: NSSplitView, dividerIndex: Int)",
                "var splitView: NSSplitView",
                "var dividerIndex: Int"
            ],
            notes: [
                "Window-attached. Renders inside NSToolbar inside an NSWindow's title bar — no child-view host.",
                "The split view must be in the same window as the toolbar before the toolbar shows. Wire the separator after both are attached.",
                "From SwiftUI, NavigationSplitView synthesizes this for you — reach for NSTrackingSeparatorToolbarItem only when building the toolbar by hand from AppKit."
            ]
        )
    }
}

#Preview {
    NSTrackingSeparatorToolbarItemDescribePage()
        .frame(width: 900, height: 700)
}
