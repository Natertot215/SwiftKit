import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSToolbarItem — a single entry in an NSToolbar.
// Source: Documentation/AppKit/views-and-controls/nstoolbaritem.md
//
// Why describe rather than render: NSToolbarItems are constructed by an
// NSToolbarDelegate inside a window-attached NSToolbar. They're not
// standalone-renderable in a child SwiftUI view — there's no toolbar chrome
// to host them. The renderable surface is the host window's title bar.

struct NSToolbarItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSToolbarItem",
            docPath: "Documentation/AppKit/views-and-controls/nstoolbaritem.md",
            availability: "macOS",
            blurb: """
            A single item that appears in a window's toolbar. NSToolbarItem \
            displays an image and text label (or a custom NSView), and \
            invokes a target/action when clicked.

            Item shapes:

              \u{2022} Image + label — the default. Set image, label, \
            paletteLabel, target, and action on a plain NSToolbarItem.
              \u{2022} Custom view — set view to any NSView (commonly an \
            NSSearchField or NSSegmentedControl). The system reserves space \
            and the view becomes the item's content.
              \u{2022} Standard items — system identifiers like .print, \
            .space, .flexibleSpace, .toggleSidebar, .writingToolsItemIdentifier \
            are constructed automatically by AppKit when the delegate returns \
            them from toolbarAllowedItemIdentifiers(_:).
              \u{2022} Specialized subclasses — NSMenuToolbarItem (menu \
            popdown), NSSearchToolbarItem (collapsible search), \
            NSTrackingSeparatorToolbarItem (split-view-aligned divider), \
            NSToolbarItemGroup (clustered subitems), \
            NSSharingServicePickerToolbarItem (sharing menu).

            Construction is delegate-driven: implement \
            NSToolbarDelegate.toolbar(_:itemForItemIdentifier:willBeInsertedIntoToolbar:) \
            and return a configured NSToolbarItem for each custom \
            identifier you declared in toolbarAllowedItemIdentifiers(_:). \
            See "Integrating a Toolbar and Touch Bar into Your App" for the \
            full recipe.

            Toolbar items render in window chrome, not in child views, so \
            this page describes the API; SwiftKit's own window title bar \
            already hosts a real NSToolbar populated with NSToolbarItems.
            """,
            signatures: [
                "@MainActor class NSToolbarItem",
                "init(itemIdentifier: NSToolbarItem.Identifier)",
                "var label: String",
                "var paletteLabel: String",
                "var image: NSImage?",
                "var view: NSView?",
                "var target: AnyObject?",
                "var action: Selector?",
                "var isBordered: Bool",
                "var isNavigational: Bool",
                "var isVisible: Bool",
                "var isEnabled: Bool",
                "var style: NSToolbarItem.Style  // .automatic / .navigational / .prominent",
                "var visibilityPriority: NSToolbarItem.VisibilityPriority  // .standard / .high / .low / .user",
                "var badge: NSItemBadge?",
                "var menuFormRepresentation: NSMenuItem?",
                "var autovalidates: Bool",
                "func validate()"
            ],
            notes: [
                "Window-attached. NSToolbarItem renders inside an NSToolbar inside an NSWindow's title bar — there's no child-view host.",
                "Subclasses cover specialized shapes — NSMenuToolbarItem (menu), NSSearchToolbarItem (collapsible search), NSTrackingSeparatorToolbarItem (split-view divider), NSToolbarItemGroup (clustered), NSSharingServicePickerToolbarItem (sharing).",
                "minSize / maxSize are deprecated. Let AppKit size the item, or set the intrinsic content size of a custom NSView.",
                "Standard identifiers (.print, .flexibleSpace, .toggleSidebar, .writingToolsItemIdentifier, ...) are constructed by AppKit — return them from toolbarAllowedItemIdentifiers(_:), don't fabricate the item yourself."
            ]
        )
    }
}

#Preview {
    NSToolbarItemDescribePage()
        .frame(width: 900, height: 700)
}
