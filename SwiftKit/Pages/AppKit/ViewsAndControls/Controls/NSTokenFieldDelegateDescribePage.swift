import SwiftUI

// Describe-track page for NSTokenFieldDelegate.
// Source: Documentation/AppKit/views-and-controls/nstokenfielddelegate.md

struct NSTokenFieldDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTokenFieldDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nstokenfielddelegate.md",
            availability: "macOS",
            blurb: """
            Optional methods you implement to translate between an \
            NSTokenField's represented objects (any model type) and the \
            display + editing strings the field actually shows. The protocol \
            inherits from NSTextFieldDelegate, so the same object can also \
            receive every controlText… editing notification.

            Methods cluster into four concerns:

              \u{2022} Display — \
            tokenField(_:displayStringForRepresentedObject:), \
            tokenField(_:styleForRepresentedObject:). What the user sees \
            inside the pill, and which TokenStyle to render it with.
              \u{2022} Editing — \
            tokenField(_:editingStringForRepresentedObject:), \
            tokenField(_:representedObjectForEditing:), \
            tokenField(_:shouldAdd:at:), \
            tokenField(_:completionsForSubstring:indexOfToken:indexOfSelectedItem:). \
            Round-tripping between display string, editable string, and the \
            model object stored in objectValue.
              \u{2022} Pasteboard — \
            tokenField(_:writeRepresentedObjects:to:), \
            tokenField(_:readFrom:). Copy / paste / drag / drop interop.
              \u{2022} Menus — \
            tokenField(_:hasMenuForRepresentedObject:), \
            tokenField(_:menuForRepresentedObject:). Per-token context menu.

            Without a delegate, NSTokenField treats every objectValue entry \
            as a String — the field works, but every represented object \
            must be a String.
            """,
            signatures: [
                "protocol NSTokenFieldDelegate : NSTextFieldDelegate",
                "func tokenField(_ tokenField: NSTokenField, displayStringForRepresentedObject obj: Any) -> String?",
                "func tokenField(_ tokenField: NSTokenField, editingStringForRepresentedObject obj: Any) -> String?",
                "func tokenField(_ tokenField: NSTokenField, representedObjectForEditing editingString: String) -> Any?",
                "func tokenField(_ tokenField: NSTokenField, styleForRepresentedObject obj: Any) -> NSTokenField.TokenStyle",
                "func tokenField(_ tokenField: NSTokenField, shouldAdd tokens: [Any], at index: Int) -> [Any]",
                "func tokenField(_ tokenField: NSTokenField, completionsForSubstring substring: String, indexOfToken tokenIndex: Int, indexOfSelectedItem selectedIndex: UnsafeMutablePointer<Int>?) -> [Any]?"
            ],
            notes: [
                "Inherits NSTextFieldDelegate (which inherits NSControlTextEditingDelegate). The same delegate object can drive editing notifications for the underlying field editor.",
                "shouldAdd:at: lets you filter or transform tokens at insertion time — useful for de-duplicating or for refusing tokens that fail validation.",
                "completionsForSubstring drives the autocomplete dropdown; return nil to disable suggestions for that token, an empty array to show \"No suggestions.\""
            ]
        )
    }
}

#Preview {
    NSTokenFieldDelegateDescribePage().frame(width: 900, height: 700)
}
