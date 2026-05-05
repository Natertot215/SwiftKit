import SwiftUI

// AppKit Views and Controls / UI validation describe page.
// Covers: NSUserInterfaceValidations — the protocol the responder chain adopts
// to decide whether a UI element (menu item, toolbar item, etc.) should be
// enabled in the current context.
// Source: Documentation/AppKit/views-and-controls/nsuserinterfacevalidations.md
//
// Why describe rather than render: This is a protocol — there's nothing to
// render. The behavior surface is the responder-chain validation pass that
// AppKit runs against each NSValidatedUserInterfaceItem; conforming objects
// implement validateUserInterfaceItem(_:) to return true/false.

struct NSUserInterfaceValidationsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSUserInterfaceValidations",
            docPath: "Documentation/AppKit/views-and-controls/nsuserinterfacevalidations.md",
            availability: "macOS",
            blurb: """
            A protocol that a custom class can adopt to manage the enabled \
            state of a UI element such as a menu item or a toolbar item.

            The validation pipeline:

              \u{2022} A user interface item (NSMenuItem, NSToolbarItem, etc.) \
            sends an action to a target.
              \u{2022} AppKit walks the responder chain starting at the first \
            responder, asking each responder \
            validateUserInterfaceItem(item) -> Bool.
              \u{2022} If any responder returns true, the item is enabled. If \
            none does, the item is disabled.

            Adopt this protocol on responders that should conditionally enable \
            actions — typically NSDocument subclasses, NSWindowController \
            subclasses, NSViewController subclasses, or custom NSResponder \
            chains. The conformer inspects item.action, decides whether the \
            current state can handle that action, and returns the answer.

            Many AppKit standard classes already conform — NSApplication, \
            NSDocument, NSDocumentController, NSWindow, NSTextView, NSTableView, \
            NSOutlineView, the panel/picker family — so override their default \
            behavior carefully.
            """,
            signatures: [
                "protocol NSUserInterfaceValidations",
                "func validateUserInterfaceItem(_ item: any NSValidatedUserInterfaceItem) -> Bool"
            ],
            notes: [
                "Pairs with NSValidatedUserInterfaceItem — that protocol is what menu items / toolbar items conform to so the validator can read .action and .tag.",
                "Inspect item.action with a switch to fan out per-selector logic; return false for selectors your responder can't handle so the responder chain continues.",
                "AppKit calls this on the responder chain whenever a menu opens or a toolbar revalidates. Don't run expensive work here — cache state if needed.",
                "NSToolbarItemValidation is a related (more specific) protocol for toolbar items; NSMenuItemValidation similarly for menus."
            ]
        )
    }
}

#Preview {
    NSUserInterfaceValidationsDescribePage()
        .frame(width: 900, height: 700)
}
