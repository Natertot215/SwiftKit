import SwiftUI

// Describe-track page for NSComboBoxDelegate.
// Source: Documentation/AppKit/views-and-controls/nscomboboxdelegate.md

struct NSComboBoxDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSComboBoxDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nscomboboxdelegate.md",
            availability: "macOS",
            blurb: """
            Optional methods you implement to react to NSComboBox events around \
            the pop-up list and selection. The protocol inherits from \
            NSTextFieldDelegate, so a single delegate can also receive every \
            text-editing notification (controlTextDidChange, etc.) for the \
            combo.

            The four delegate methods correspond directly to NSComboBox's four \
            notifications — implementing the method is equivalent to subscribing \
            to the matching notification on the same combo.
            """,
            signatures: [
                "protocol NSComboBoxDelegate : NSTextFieldDelegate",
                "func comboBoxSelectionDidChange(_ notification: Notification)",
                "func comboBoxSelectionIsChanging(_ notification: Notification)",
                "func comboBoxWillPopUp(_ notification: Notification)",
                "func comboBoxWillDismiss(_ notification: Notification)"
            ],
            notes: [
                "Inherits NSTextFieldDelegate, which inherits NSControlTextEditingDelegate — implement controlTextDidChange to react as the user types.",
                "comboBoxSelectionIsChanging fires repeatedly while the user arrow-keys through the list; comboBoxSelectionDidChange fires once when they commit.",
                "Use comboBoxWillPopUp / comboBoxWillDismiss to refresh the data source just before the pop-up appears or to capture state after it closes."
            ]
        )
    }
}

#Preview {
    NSComboBoxDelegateDescribePage().frame(width: 900, height: 700)
}
