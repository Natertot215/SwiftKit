import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSToolbarItemValidation — a protocol an NSToolbarItem's target
// adopts to enable/disable the item dynamically.
// Source: Documentation/AppKit/views-and-controls/nstoolbaritemvalidation.md

struct NSToolbarItemValidationDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSToolbarItemValidation",
            docPath: "Documentation/AppKit/views-and-controls/nstoolbaritemvalidation.md",
            availability: "macOS",
            blurb: """
            A protocol that the target of an NSToolbarItem implements when it \
            wants to disable the item under specific conditions. By default, \
            an NSToolbarItem with a valid target/action is enabled. To gate \
            the item's enabled state on app context (current selection, \
            permissions, document state), conform the target to \
            NSToolbarItemValidation and return false from \
            validateToolbarItem(_:).

            Validation flow:

              \u{2022} NSToolbar calls validateVisibleItems() periodically \
            (and after every window/responder change) to refresh enabled \
            state.
              \u{2022} For each item, AppKit invokes the target's \
            validateToolbarItem(_:) method (the NSToolbarItemValidation \
            protocol). Return true to enable, false to disable.
              \u{2022} Custom-view items (NSToolbarItem with a non-nil view) \
            are NOT validated through this protocol — AppKit can't validate \
            an arbitrary NSView. Subclass NSToolbarItem and override \
            validate() to handle custom-view items.

            NSToolbarItemValidation is the AppKit analog of \
            NSMenuItemValidation for menu items — same shape (protocol on the \
            target, single boolean validator), same role (gate enablement \
            without subclassing the item).
            """,
            signatures: [
                "protocol NSToolbarItemValidation : NSObjectProtocol",
                "func validateToolbarItem(_ item: NSToolbarItem) -> Bool",
                "// Triggered indirectly by NSToolbar.validateVisibleItems()"
            ],
            notes: [
                "Protocol — nothing to render. Adopt on the action target, not on the toolbar item.",
                "Custom-view toolbar items (NSToolbarItem.view != nil) bypass this protocol. Subclass NSToolbarItem and override validate() to handle them.",
                "Pair with NSToolbarItem.autovalidates = true (the default) to let AppKit drive the validate() call automatically; set false to validate manually."
            ]
        )
    }
}

#Preview {
    NSToolbarItemValidationDescribePage()
        .frame(width: 900, height: 700)
}
