import SwiftUI

// Describe-track page for NSControlTextEditingDelegate.
// Source: Documentation/AppKit/views-and-controls/nscontroltexteditingdelegate.md

struct NSControlTextEditingDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSControlTextEditingDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nscontroltexteditingdelegate.md",
            availability: "macOS",
            blurb: """
            The base protocol every NSControl that hosts a field editor uses \
            to delegate editing events. NSTextField, NSComboBox, NSSearchField, \
            NSTokenField, NSMatrix, NSTableView, and NSOutlineView all have \
            delegate protocols that inherit from this one — implementing it \
            once gives you a single conformance you can attach to any of those.

            The methods cluster into five concerns:

              \u{2022} Validation — control(_:isValidObject:), \
            control(_:didFailToValidatePartialString:errorDescription:), \
            control(_:didFailToFormatString:errorDescription:).
              \u{2022} Lifecycle — control(_:textShouldBeginEditing:), \
            control(_:textShouldEndEditing:), \
            controlTextDidBeginEditing(_:), \
            controlTextDidChange(_:), \
            controlTextDidEndEditing(_:).
              \u{2022} Completion — \
            control(_:textView:completions:forPartialWordRange:indexOfSelectedItem:).
              \u{2022} Key bindings — \
            control(_:textView:doCommandBy:) — intercept a Cocoa key-binding \
            command (e.g. NSResponder.insertNewline(_:)) before the field \
            editor handles it.
              \u{2022} (No replacement / drag — those live elsewhere).

            controlTextDidChange is the live-edit hook most apps want.
            """,
            signatures: [
                "protocol NSControlTextEditingDelegate : NSObjectProtocol",
                "func controlTextDidChange(_ obj: Notification)",
                "func controlTextDidBeginEditing(_ obj: Notification)",
                "func controlTextDidEndEditing(_ obj: Notification)",
                "func control(_ control: NSControl, isValidObject obj: Any?) -> Bool",
                "func control(_ control: NSControl, textShouldBeginEditing fieldEditor: NSText) -> Bool",
                "func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool",
                "func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool",
                "func control(_ control: NSControl, textView: NSTextView, completions words: [String], forPartialWordRange charRange: NSRange, indexOfSelectedItem index: UnsafeMutablePointer<Int>) -> [String]"
            ],
            notes: [
                "Inherited By: NSComboBoxDelegate, NSMatrixDelegate, NSOutlineViewDelegate, NSSearchFieldDelegate, NSTableViewDelegate, NSTextFieldDelegate, NSTokenFieldDelegate. A single object can adopt one of these and pick up the editing surface for free.",
                "controlTextDidChange fires per keystroke; obj.object is the originating NSControl, and obj.userInfo[\"NSFieldEditor\"] is the field editor (NSText).",
                "control(_:textView:doCommandBy:) returning true tells the field editor you handled the command and to stop dispatching it — useful for intercepting Tab, Return, Escape, etc."
            ]
        )
    }
}

#Preview {
    NSControlTextEditingDelegateDescribePage().frame(width: 900, height: 700)
}
