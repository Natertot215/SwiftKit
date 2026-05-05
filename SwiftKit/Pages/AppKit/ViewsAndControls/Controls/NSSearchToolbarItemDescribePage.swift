import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSSearchToolbarItem — an NSToolbarItem subclass that hosts a
// search field with collapse-on-tight behavior.
// Source: Documentation/AppKit/views-and-controls/nssearchtoolbaritem.md

struct NSSearchToolbarItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSSearchToolbarItem",
            docPath: "Documentation/AppKit/views-and-controls/nssearchtoolbaritem.md",
            availability: "macOS 11.0",
            blurb: """
            An NSToolbarItem subclass that contains a search field optimized \
            for performing text-based searches. The item adapts to available \
            toolbar width: when there's enough space it renders the full \
            NSSearchField; when space is tight it collapses to a magnifying- \
            glass button that expands back to a full search field on click.

            Behavior:

              \u{2022} preferredWidthForSearchField — the item's expanded \
            width when space allows. The default tracks the system search \
            field width.
              \u{2022} Collapse threshold — AppKit decides automatically when \
            to collapse based on remaining toolbar width. The collapsed \
            button retains the search field's identity for keyboard focus.
              \u{2022} resignsFirstResponderWithCancel — when true (default), \
            pressing Escape cancels the search and resigns first responder.
              \u{2022} beginSearchInteraction() / endSearchInteraction() — \
            programmatically expand/collapse the item, e.g. when the user \
            picks a Find menu command from elsewhere in the app.

            The hosted searchField is a standard NSSearchField — wire its \
            target/action or NSSearchFieldDelegate the same way as a \
            free-standing NSSearchField. Use NSToolbarItem.Identifier for \
            integration; use SwiftUI's .searchable(...) when building the \
            toolbar from SwiftUI instead.
            """,
            signatures: [
                "class NSSearchToolbarItem : NSToolbarItem",
                "var searchField: NSSearchField",
                "var preferredWidthForSearchField: CGFloat",
                "var resignsFirstResponderWithCancel: Bool",
                "func beginSearchInteraction()",
                "func endSearchInteraction()"
            ],
            notes: [
                "Window-attached. NSSearchToolbarItem renders inside NSToolbar inside an NSWindow's title bar — no child-view host.",
                "The item collapses automatically when toolbar width is tight — don't fight it with a custom view; that defeats the adaptive behavior.",
                "From SwiftUI, prefer .searchable(...) on the macOS Scene; reach for NSSearchToolbarItem from AppKit code or via NSViewControllerRepresentable when wiring an NSToolbar by hand."
            ]
        )
    }
}

#Preview {
    NSSearchToolbarItemDescribePage()
        .frame(width: 900, height: 700)
}
