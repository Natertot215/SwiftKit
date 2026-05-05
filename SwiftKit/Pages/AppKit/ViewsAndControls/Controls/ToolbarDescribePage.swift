import SwiftUI

// Article-style describe page for the "Toolbar" doc collection.
// Source: Documentation/AppKit/views-and-controls/toolbar.md
// The collectionGroup page itself isn't a renderable type — it's an index
// over NSToolbar + the toolbar item family. Each member gets its own page;
// this one summarizes the group.

struct ToolbarDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Toolbar",
            docPath: "Documentation/AppKit/views-and-controls/toolbar.md",
            availability: "macOS",
            blurb: """
            Provide a space for controls under a window's title bar and above \
            your custom content. Apple groups the AppKit toolbar APIs under \
            this collection — the toolbar manager NSToolbar, the toolbar item \
            family (NSToolbarItem and its subclasses), and the validation \
            protocols that enable/disable items in response to context.

            Pick the right entry point:

              \u{2022} NSToolbar — the manager attached to an NSWindow (via \
            NSWindow.toolbar). It owns an ordered list of NSToolbarItem \
            objects driven by an NSToolbarDelegate.
              \u{2022} NSToolbarItem — the base class for every toolbar entry. \
            Subclasses cover specialized behaviors: NSMenuToolbarItem for a \
            click-to-open menu, NSSearchToolbarItem for a search field that \
            collapses to a button when space is tight, \
            NSTrackingSeparatorToolbarItem for separators that align with a \
            split-view divider.
              \u{2022} NSToolbarItemGroup — packages multiple toolbar items \
            into a single attached cluster (think "Prev/Next" navigation), \
            with NSToolbarItemGroup.ControlRepresentation and \
            NSToolbarItemGroup.SelectionMode controlling how it renders and \
            tracks selection.
              \u{2022} NSToolbarItemValidation / NSCloudSharingValidation — \
            protocols a target adopts to enable/disable items dynamically.

            Toolbars attach to windows, not to child views, so SwiftKit \
            documents each piece of the surface rather than rendering one \
            inline. See "Integrating a Toolbar and Touch Bar into Your App" \
            for the full delegate-driven setup.
            """,
            signatures: [
                "Documentation/AppKit/views-and-controls/toolbar (collection)",
                "Manager: NSToolbar (attached to NSWindow.toolbar)",
                "Items: NSToolbarItem, NSToolbarItemGroup, NSMenuToolbarItem, NSSearchToolbarItem, NSTrackingSeparatorToolbarItem",
                "Item modes: NSToolbarItemGroup.ControlRepresentation, NSToolbarItemGroup.SelectionMode",
                "Validation: NSToolbarItemValidation, NSCloudSharingValidation",
                "Standard identifiers: NSToolbarItem.Identifier.writingToolsItemIdentifier, .print, .flexibleSpace, ..."
            ],
            notes: [
                "Toolbars are window-attached. NSWindow.toolbar = NSToolbar(...) is the entry point; the items themselves are vended by an NSToolbarDelegate.",
                "Standard identifiers (.print, .space, .flexibleSpace, .toggleSidebar, .writingToolsItemIdentifier, ...) don't require a delegate — AppKit constructs the items.",
                "SwiftUI's .toolbar(content:) builds an NSToolbar under the hood when used from a macOS Scene; reach for NSToolbar directly only when you need delegate-driven customization (autosaving, custom palette, dynamic insertion)."
            ]
        )
    }
}

#Preview {
    ToolbarDescribePage()
        .frame(width: 900, height: 700)
}
