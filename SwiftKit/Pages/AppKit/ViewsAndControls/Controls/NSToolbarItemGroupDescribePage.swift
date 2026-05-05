import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSToolbarItemGroup — a clustered set of subitems in a toolbar.
// Source: Documentation/AppKit/views-and-controls/nstoolbaritemgroup.md

struct NSToolbarItemGroupDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSToolbarItemGroup",
            docPath: "Documentation/AppKit/views-and-controls/nstoolbaritemgroup.md",
            availability: "macOS 10.5",
            blurb: """
            A grouped collection of NSToolbarItem subitems that the user \
            drags as a single attached unit, rather than as separate items. \
            NSToolbarItemGroup is the canonical shape for a "Prev/Next" \
            navigation pair, an "Align Left/Center/Right" cluster, or any \
            other small set of related actions that should stay together \
            during toolbar customization.

            How it composes:

              \u{2022} Construct individual NSToolbarItem objects for each \
            subitem (image + label + target/action).
              \u{2022} Wrap them in an NSToolbarItemGroup via subitems = \
            [item1, item2, ...] (or the convenience initializers \
            init(itemIdentifier:images:selectionMode:labels:...) and \
            init(itemIdentifier:titles:selectionMode:labels:...)).
              \u{2022} controlRepresentation \
            (NSToolbarItemGroup.ControlRepresentation) decides whether the \
            group renders as separate visible buttons (.expanded), as a \
            single collapsed button that pops up the choices (.collapsed), \
            or lets AppKit pick (.automatic).
              \u{2022} selectionMode \
            (NSToolbarItemGroup.SelectionMode) decides whether subitems \
            track persistent selection (.selectOne / .selectAny) or fire and \
            release (.momentary).

            Label-and-view interplay: setting a label on the parent group \
            yields one shared label across both subitems; setting a view on \
            the parent yields one shared view with two separate labels.

            NSToolbarItemGroup inherits NSToolbarItem, so every NSToolbarItem \
            property still applies — a group is itself a toolbar item.
            """,
            signatures: [
                "class NSToolbarItemGroup : NSToolbarItem",
                "init(itemIdentifier:images:selectionMode:labels:target:action:)",
                "init(itemIdentifier:titles:selectionMode:labels:target:action:)",
                "var subitems: [NSToolbarItem]",
                "var selectedIndex: Int",
                "func isSelected(at index: Int) -> Bool",
                "func setSelected(_ selected: Bool, at index: Int)",
                "var controlRepresentation: NSToolbarItemGroup.ControlRepresentation",
                "var selectionMode: NSToolbarItemGroup.SelectionMode"
            ],
            notes: [
                "Window-attached. Like every NSToolbarItem, a group renders inside NSToolbar inside an NSWindow's title bar — no child-view host.",
                "If a subitem has its own action, it overrides the group's action when that subitem is clicked. The group's action is the fallback.",
                "Pick controlRepresentation = .automatic and selectionMode = .momentary as defaults; switch to .selectOne for radio-style toolbar pickers (e.g. tab bars in Mail / Finder)."
            ]
        )
    }
}

#Preview {
    NSToolbarItemGroupDescribePage()
        .frame(width: 900, height: 700)
}
