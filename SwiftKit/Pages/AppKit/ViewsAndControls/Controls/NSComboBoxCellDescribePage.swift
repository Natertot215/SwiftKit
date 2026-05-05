import SwiftUI

// Describe-track page for NSComboBoxCell.
// Source: Documentation/AppKit/views-and-controls/nscomboboxcell.md

struct NSComboBoxCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSComboBoxCell",
            docPath: "Documentation/AppKit/views-and-controls/nscomboboxcell.md",
            availability: "macOS",
            blurb: """
            The NSCell subclass that NSComboBox uses to render and manage its \
            user interface. Direct instantiation is rare — every NSComboBox \
            already wraps a single NSComboBoxCell, and almost every property on \
            NSComboBox is a cover that forwards to the cell.

            Reach for NSComboBoxCell directly when you embed combo-box \
            behavior into another cell-based surface (e.g. an NSTableColumn \
            cell prototype) where the host expects an NSCell rather than an \
            NSControl.

            All of the cell-level configuration mirrors the control:

              \u{2022} hasVerticalScroller, intercellSpacing, isButtonBordered, \
            itemHeight, numberOfVisibleItems
              \u{2022} dataSource, usesDataSource — paired with \
            NSComboBoxCellDataSource.
              \u{2022} addItems / insertItem / removeItem / objectValues — the \
            internal list when usesDataSource is false.
              \u{2022} selectItem / indexOfSelectedItem / objectValueOfSelectedItem
              \u{2022} completedString(_:), completes — autocomplete plumbing.
            """,
            signatures: [
                "class NSComboBoxCell : NSTextFieldCell",
                "var dataSource: NSComboBoxCellDataSource?",
                "var usesDataSource: Bool",
                "var numberOfVisibleItems: Int",
                "var hasVerticalScroller: Bool",
                "func addItems(withObjectValues objectValues: [Any])",
                "func selectItem(at index: Int)",
                "func completedString(_ string: String) -> String?"
            ],
            notes: [
                "Inherits NSTextFieldCell — the cell-level equivalent of NSComboBox inheriting NSTextField.",
                "When usesDataSource = true the cell forwards reads to NSComboBoxCellDataSource (not NSComboBoxDataSource).",
                "The renderable surface lives on the NSComboBox page — that's where you instantiate the wrapping control."
            ]
        )
    }
}

#Preview {
    NSComboBoxCellDescribePage().frame(width: 900, height: 700)
}
