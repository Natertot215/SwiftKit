import SwiftUI

// Describe-track page for NSComboBoxDataSource.
// Source: Documentation/AppKit/views-and-controls/nscomboboxdatasource.md

struct NSComboBoxDataSourceDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSComboBoxDataSource",
            docPath: "Documentation/AppKit/views-and-controls/nscomboboxdatasource.md",
            availability: "macOS",
            blurb: """
            Protocol an object adopts to feed an NSComboBox with content drawn \
            from outside the control. Set the combo's usesDataSource = true \
            and assign dataSource — the combo will then call the four protocol \
            methods instead of using its internal list of object values.

            The four entry points cover every read the combo needs:

              \u{2022} numberOfItems(in:) — total row count.
              \u{2022} comboBox(_:objectValueForItemAt:) — the value to show \
            for one row.
              \u{2022} comboBox(_:indexOfItemWithStringValue:) — used when the \
            user types a value and the combo needs to map back to a row.
              \u{2022} comboBox(_:completedString:) — drives autocomplete when \
            NSComboBox.completes is true.
            """,
            signatures: [
                "protocol NSComboBoxDataSource : NSObjectProtocol",
                "func numberOfItems(in comboBox: NSComboBox) -> Int",
                "func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any?",
                "func comboBox(_ comboBox: NSComboBox, indexOfItemWithStringValue string: String) -> Int",
                "func comboBox(_ comboBox: NSComboBox, completedString string: String) -> String?"
            ],
            notes: [
                "Switch a combo into data-source mode with comboBox.usesDataSource = true; the internal list APIs (addItems / removeItem) become invalid.",
                "Call comboBox.reloadData() after the underlying model changes; call comboBox.noteNumberOfItemsChanged() when the row count changes specifically.",
                "Pair with NSComboBoxDelegate when you also want to react to selection / pop-up will-display events."
            ]
        )
    }
}

#Preview {
    NSComboBoxDataSourceDescribePage().frame(width: 900, height: 700)
}
