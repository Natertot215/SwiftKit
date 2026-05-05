import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSToolbarItem.Identifier.writingToolsItemIdentifier — a
// predefined toolbar item identifier that wires up a Writing Tools entry
// point.
// Source: Documentation/AppKit/views-and-controls/writingtoolsitemidentifier.md
//
// File-name note: the displayName / apiSignature / registry-key keep the
// dotted form; the Swift struct name collapses the periods.

struct NSToolbarItemIdentifierWritingToolsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSToolbarItem.Identifier.writingToolsItemIdentifier",
            docPath: "Documentation/AppKit/views-and-controls/writingtoolsitemidentifier.md",
            availability: "macOS 15.2",
            blurb: """
            A predefined NSToolbarItem.Identifier that drops a system Writing \
            Tools button into a toolbar. Returning this identifier from \
            NSToolbarDelegate.toolbarAllowedItemIdentifiers(_:) (and \
            optionally toolbarDefaultItemIdentifiers(_:)) tells AppKit to \
            construct a toolbar item that, when invoked, sends \
            -showWritingTools: to the first responder.

            The identifier behaves like the other system identifiers \
            (.print, .toggleSidebar, .flexibleSpace): you do NOT return a \
            constructed item from \
            toolbar(_:itemForItemIdentifier:willBeInsertedIntoToolbar:) — \
            AppKit constructs the item on your behalf with the standard \
            Writing Tools icon and label.

            For the action to do something, the first responder in the \
            window's responder chain (typically an NSTextView or a custom \
            text-aware control) must implement showWritingTools(_:) or \
            inherit it from NSText / NSResponder. If no responder handles \
            the selector, the toolbar item is automatically validated as \
            disabled.
            """,
            signatures: [
                "static let writingToolsItemIdentifier: NSToolbarItem.Identifier",
                "// Sends -showWritingTools: to the first responder when invoked"
            ],
            notes: [
                "Predefined identifier — return from toolbarAllowedItemIdentifiers(_:); do NOT construct an item for it in toolbar(_:itemForItemIdentifier:willBeInsertedIntoToolbar:).",
                "Validation is automatic. The item is enabled only when the current first responder handles showWritingTools(_:).",
                "Writing Tools is a macOS 15.2+ surface — the identifier is unavailable on earlier OS versions. Gate UI logic with @available(macOS 15.2, *) when constructing toolbars conditionally."
            ]
        )
    }
}

#Preview {
    NSToolbarItemIdentifierWritingToolsDescribePage()
        .frame(width: 900, height: 700)
}
