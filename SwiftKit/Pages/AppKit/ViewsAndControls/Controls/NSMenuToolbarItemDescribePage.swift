import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSMenuToolbarItem — an NSToolbarItem subclass that presents a
// menu when clicked or held.
// Source: Documentation/AppKit/views-and-controls/nsmenutoolbaritem.md

struct NSMenuToolbarItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSMenuToolbarItem",
            docPath: "Documentation/AppKit/views-and-controls/nsmenutoolbaritem.md",
            availability: "macOS 10.15",
            blurb: """
            An NSToolbarItem subclass that presents a menu when the user \
            clicks the item, with an optional disclosure indicator and \
            optional immediate-action behavior on a single click.

            Two interaction shapes:

              \u{2022} Pure menu — leave action = nil. A click immediately \
            opens the menu. The disclosure indicator is decorative.
              \u{2022} Action + menu — set both action and \
            showsIndicator = true. The system splits the item visually: \
            click the main segment to fire the action, click the indicator \
            segment to open the menu. This is the canonical "save / save \
            as..." or "compose / templates" toolbar shape.

            Configure: assign menu (or itemMenu on macOS 13+) to the \
            NSMenu the item should display. Update the menu lazily by \
            implementing NSMenuDelegate on the menu, or refresh it before \
            the click via the toolbar delegate.

            NSMenuToolbarItem inherits NSToolbarItem, so all the standard \
            properties (label, paletteLabel, image, isEnabled, badge) still \
            apply.
            """,
            signatures: [
                "class NSMenuToolbarItem : NSToolbarItem",
                "var menu: NSMenu",
                "var itemMenu: NSMenu?",
                "var showsIndicator: Bool",
                "// Inherits all NSToolbarItem properties (label, image, target, action, ...)"
            ],
            notes: [
                "Window-attached. Like every NSToolbarItem, it renders inside NSToolbar inside an NSWindow's title bar — no child-view host.",
                "showsIndicator + action together yields a split control (action segment + menu indicator). showsIndicator alone (no action) yields a pure menu button with a decorative chevron.",
                "Update menu items lazily via NSMenuDelegate (menuNeedsUpdate(_:)) so dynamic content reflects current app state at click time."
            ]
        )
    }
}

#Preview {
    NSMenuToolbarItemDescribePage()
        .frame(width: 900, height: 700)
}
