import SwiftUI

// Describe-track page for NSTextFieldCell.
// Source: Documentation/AppKit/views-and-controls/nstextfieldcell.md

struct NSTextFieldCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTextFieldCell",
            docPath: "Documentation/AppKit/views-and-controls/nstextfieldcell.md",
            availability: "macOS",
            blurb: """
            The NSCell subclass that NSTextField uses to render and manage \
            its UI. Almost every NSTextField property is a cover that \
            forwards to NSTextFieldCell — text color, background color, \
            bezel style, placeholder strings, and the field-editor setup \
            all live here at the cell level.

            Reach for NSTextFieldCell directly only when:

              \u{2022} You assemble text-display behavior into another \
            cell-based surface (e.g. a custom NSTableColumn data cell), or
              \u{2022} You subclass to customize the field-editor attributes \
            via setUpFieldEditorAttributes(_:).

            Inherited by every other text-field-style cell in AppKit: \
            NSComboBoxCell, NSPathComponentCell, NSSearchFieldCell, \
            NSSecureTextFieldCell, NSTableHeaderCell, NSTokenFieldCell.
            """,
            signatures: [
                "class NSTextFieldCell : NSActionCell",
                "var textColor: NSColor?",
                "var backgroundColor: NSColor?",
                "var drawsBackground: Bool",
                "var bezelStyle: NSTextField.BezelStyle",
                "var placeholderString: String?",
                "var placeholderAttributedString: NSAttributedString?",
                "func setUpFieldEditorAttributes(_ textObject: NSText) -> NSText",
                "func setWantsNotificationForMarkedText(_ flag: Bool)",
                "var allowedInputSourceLocales: [String]?"
            ],
            notes: [
                "Inherits NSActionCell. Designated initializers are init(coder:) and init(textCell:) — both are required when subclassing.",
                "Placeholder strings (placeholderString / placeholderAttributedString) display when the actual string is nil or empty. They render in gray and are not archived.",
                "Inherited By: NSComboBoxCell, NSPathComponentCell, NSSearchFieldCell, NSSecureTextFieldCell, NSTableHeaderCell, NSTokenFieldCell — each cell subclass adds its own configuration on top of NSTextFieldCell."
            ]
        )
    }
}

#Preview {
    NSTextFieldCellDescribePage().frame(width: 900, height: 700)
}
