import SwiftUI

// AppKit Views and Controls / UI validation describe page.
// Covers: NSValidatedUserInterfaceItem — the protocol that NSMenuItem,
// NSToolbarItem, and friends conform to so the validator can inspect their
// action and tag during the responder-chain validation pass.
// Source: Documentation/AppKit/views-and-controls/nsvalidateduserinterfaceitem.md
//
// Why describe rather than render: This is a protocol with two read-only
// requirements (action, tag). It has no visible representation — the visible
// effect is the enabled/disabled state of the conforming UI elements once
// NSUserInterfaceValidations runs against them.

struct NSValidatedUserInterfaceItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSValidatedUserInterfaceItem",
            docPath: "Documentation/AppKit/views-and-controls/nsvalidateduserinterfaceitem.md",
            availability: "macOS",
            blurb: """
            A protocol that user interface items conform to so they can \
            participate in the automatic enable/disable validation pipeline.

            How it pairs with NSUserInterfaceValidations:

              \u{2022} NSMenuItem, NSToolbarItem, NSMenuToolbarItem, \
            NSSearchToolbarItem, NSSharingServicePickerToolbarItem, \
            NSToolbarItemGroup, and NSTrackingSeparatorToolbarItem all \
            conform — out of the box.
              \u{2022} When AppKit needs to revalidate one of those items, it \
            walks the responder chain calling \
            validateUserInterfaceItem(item) on each responder that conforms \
            to NSUserInterfaceValidations.
              \u{2022} The validator typically switches on item.action to \
            decide; item.tag is available when one selector serves multiple \
            items differentiated by tag.

            You implement NSValidatedUserInterfaceItem only when you build a \
            custom UI element class that should participate in this \
            validation. For app code, conform to NSUserInterfaceValidations \
            instead and read the item passed to your validator.
            """,
            signatures: [
                "protocol NSValidatedUserInterfaceItem",
                "var action: Selector? { get }",
                "var tag: Int { get }"
            ],
            notes: [
                "Conformers (built-in): NSMenuItem, NSToolbarItem, NSMenuToolbarItem, NSSearchToolbarItem, NSSharingServicePickerToolbarItem, NSToolbarItemGroup, NSTrackingSeparatorToolbarItem.",
                "Both requirements are read-only. action returns nil when the item has no action set yet.",
                "tag is most useful as a discriminator when the same selector is wired to multiple items — switch on (item.action, item.tag) inside the validator.",
                "App code rarely implements this directly. Implement NSUserInterfaceValidations on a responder; AppKit hands you items conforming to this protocol."
            ]
        )
    }
}

#Preview {
    NSValidatedUserInterfaceItemDescribePage()
        .frame(width: 900, height: 700)
}
