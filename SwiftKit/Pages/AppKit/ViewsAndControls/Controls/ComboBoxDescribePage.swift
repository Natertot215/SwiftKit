import SwiftUI

// Article-style describe page for the "Combo Box" doc collection.
// Source: Documentation/AppKit/views-and-controls/combo-box.md
// The collectionGroup page itself isn't a renderable type — it's an index
// over NSComboBox + the data source / delegate / cell pieces. Each member
// gets its own page; this one summarizes the group.

struct ComboBoxDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Combo Box",
            docPath: "Documentation/AppKit/views-and-controls/combo-box.md",
            availability: "macOS",
            blurb: """
            A combo box displays a list of values in a pop-up menu and lets the \
            user either select one or type in a custom value. Apple groups the \
            APIs that build a combo box under this collection — the rendered \
            control NSComboBox, the protocols that supply its content \
            (NSComboBoxDataSource, NSComboBoxDelegate), and the underlying cell \
            (NSComboBoxCell + NSComboBoxCellDataSource).

            Pick the right entry point:

              \u{2022} NSComboBox — the NSControl subclass you embed in a window \
            or a SwiftUI hierarchy via NSViewRepresentable.
              \u{2022} NSComboBoxDataSource — implement when items come from \
            outside the control (e.g. a model object). Set usesDataSource = true.
              \u{2022} NSComboBoxDelegate — implement to react to selection \
            changes and pop-up will-display events.
              \u{2022} NSComboBoxCell / NSComboBoxCellDataSource — the cell-level \
            equivalents, used when you assemble a combo box from a custom matrix \
            or other NSCell-based surface.
            """,
            signatures: [
                "Documentation/AppKit/views-and-controls/combo-box (collection)",
                "View: NSComboBox",
                "Management: NSComboBoxDataSource, NSComboBoxDelegate",
                "Cells: NSComboBoxCell, NSComboBoxCellDataSource"
            ],
            notes: [
                "Combine NSTextField behavior with NSPopUpButton — clicking the down arrow opens the list, the text portion stays editable.",
                "NSComboBox inherits NSTextField; NSComboBoxCell inherits NSTextFieldCell. Most combo-box methods are NSComboBoxCell methods reflected up to the control.",
                "The renderable example lives on the NSComboBox page — that's the concrete view you instantiate."
            ]
        )
    }
}

#Preview {
    ComboBoxDescribePage()
        .frame(width: 900, height: 700)
}
