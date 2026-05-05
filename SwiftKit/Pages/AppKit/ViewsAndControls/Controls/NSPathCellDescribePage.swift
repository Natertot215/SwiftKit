import SwiftUI

// Describe-track page for NSPathCell.
// Source: Documentation/AppKit/views-and-controls/nspathcell.md

struct NSPathCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSPathCell",
            docPath: "Documentation/AppKit/views-and-controls/nspathcell.md",
            availability: "macOS 10.5+",
            blurb: """
            The NSCell subclass that NSPathControl uses to render and manage \
            its UI. NSPathCell maintains a collection of NSPathComponentCell \
            objects representing the displayed path. Setting the cell's url \
            replaces the component cells with auto-generated cells whose \
            icons, titles, and URL values come from the file system.

            Most NSPathControl methods are covers for NSPathCell methods — \
            reach for the cell directly only when:

              \u{2022} You assemble a path display inside another cell-based \
            surface (e.g. an NSTableColumn's data cell), or
              \u{2022} You need clickedPathComponentCell when the action fires.

            Path styles supported by NSPathCell:

              \u{2022} .standard — light blue background with arrow separators.
              \u{2022} .popUp — looks and works like NSPopUpButton; clicking \
            opens a hierarchical menu of the path components.
            """,
            signatures: [
                "class NSPathCell : NSActionCell",
                "var pathStyle: NSPathControl.Style",
                "var pathComponentCells: [NSPathComponentCell]",
                "var url: URL?",
                "var allowedTypes: [String]?",
                "var placeholderString: String?",
                "weak var delegate: NSPathCellDelegate?",
                "var clickedPathComponentCell: NSPathComponentCell?"
            ],
            notes: [
                "Inherits NSActionCell. Designated initializers are init(coder:) and init(textCell:).",
                "Setting pathStyle = .navigationBar forces controlSize to .small and asserts if you change controlSize while in that style. Use .standard or .popUp instead.",
                "If isEditable returns true (default), the cell accepts drops to change its value. Constrain by UTI via allowedTypes or NSPathControlDelegate methods.",
                "The renderable surface lives on the NSPathControl page — that's where you instantiate the wrapping control."
            ]
        )
    }
}

#Preview {
    NSPathCellDescribePage().frame(width: 900, height: 700)
}
