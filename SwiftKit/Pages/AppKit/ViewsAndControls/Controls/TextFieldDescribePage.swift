import SwiftUI

// Article-style describe page for the "Text Field" doc collection.
// Source: Documentation/AppKit/views-and-controls/text-field.md

struct TextFieldDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Text Field",
            docPath: "Documentation/AppKit/views-and-controls/text-field.md",
            availability: "macOS",
            blurb: """
            Provide a simple interface for displaying and editing text, \
            including support for password fields and secure forms of text \
            entry. AppKit groups six APIs under this collection — pick the \
            right entry point for what you're building:

              \u{2022} NSTextField — the rendered control. Plain text, \
            attributed text, label, wrapping label, multi-line wrapping, \
            convertible to a number / date / formatter-driven value via \
            NSControl bindings.
              \u{2022} NSSecureTextField — same shape as NSTextField, but \
            renders bullets and disables cut/copy. Use for password / \
            secret input.
              \u{2022} NSTextFieldDelegate — text-field-specific delegate \
            methods (text-completion candidates).
              \u{2022} NSControlTextEditingDelegate — generic editing-event \
            protocol for any NSControl that hosts a field editor.
              \u{2022} NSTextFieldCell — the cell behind NSTextField.
              \u{2022} NSSecureTextFieldCell — the cell behind \
            NSSecureTextField; configures bullet echo.

            Both NSTextField and NSSecureTextField have renderable demo \
            pages. Both delegates and cells are documented as Describe \
            pages — they don't render anything on their own.
            """,
            signatures: [
                "Documentation/AppKit/views-and-controls/text-field (collection)",
                "Views: NSTextField, NSSecureTextField",
                "Management: NSTextFieldDelegate, NSControlTextEditingDelegate",
                "Cells: NSTextFieldCell, NSSecureTextFieldCell"
            ],
            notes: [
                "NSTextField has four convenience initializers: init(string:), init(labelWithString:), init(wrappingLabelWithString:), init(labelWithAttributedString:). The label initializers configure isBezeled = false, isEditable = false, drawsBackground = false out of the box.",
                "Several other AppKit controls inherit NSTextField: NSComboBox, NSSearchField, NSSecureTextField, NSTokenField. They share NSTextFieldDelegate's protocol surface.",
                "Use NSControlTextEditingDelegate's controlTextDidChange to react to live keystrokes, and NSTextFieldDelegate's textField(_:textView:candidates:forSelectedRange:) to drive autocomplete suggestions."
            ]
        )
    }
}

#Preview {
    TextFieldDescribePage().frame(width: 900, height: 700)
}
