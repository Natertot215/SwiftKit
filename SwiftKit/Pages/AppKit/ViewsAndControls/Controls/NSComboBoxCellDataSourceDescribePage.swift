import SwiftUI

// Describe-track page for NSComboBoxCellDataSource.
// Source: Documentation/AppKit/views-and-controls/nscomboboxcelldatasource.md

struct NSComboBoxCellDataSourceDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSComboBoxCellDataSource",
            docPath: "Documentation/AppKit/views-and-controls/nscomboboxcelldatasource.md",
            availability: "macOS",
            blurb: """
            Cell-level counterpart to NSComboBoxDataSource. An object adopting \
            this protocol vends content for an NSComboBoxCell embedded in some \
            other cell-based surface (an NSTableColumn cell prototype, an \
            NSMatrix, etc.) — the parent NSControl is something other than an \
            NSComboBox.

            The four methods are identical in shape to NSComboBoxDataSource, \
            just with NSComboBoxCell in the first parameter slot:
            """,
            signatures: [
                "protocol NSComboBoxCellDataSource : NSObjectProtocol",
                "func numberOfItems(in comboBoxCell: NSComboBoxCell) -> Int",
                "func comboBoxCell(_ cell: NSComboBoxCell, objectValueForItemAt index: Int) -> Any?",
                "func comboBoxCell(_ cell: NSComboBoxCell, indexOfItemWithStringValue string: String) -> Int",
                "func comboBoxCell(_ cell: NSComboBoxCell, completedString string: String) -> String?"
            ],
            notes: [
                "Use only when you instantiate NSComboBoxCell separately from NSComboBox. For the standalone control, NSComboBoxDataSource is the protocol you implement.",
                "Set the cell's usesDataSource = true and assign dataSource for these methods to be called.",
                "Pair with NSComboBoxCell.completes = true to drive autocomplete via comboBoxCell(_:completedString:)."
            ]
        )
    }
}

#Preview {
    NSComboBoxCellDataSourceDescribePage().frame(width: 900, height: 700)
}
