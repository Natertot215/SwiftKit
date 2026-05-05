import SwiftUI

// Describe-track page for NSTokenFieldCellDelegate.
// Source: Documentation/AppKit/views-and-controls/nstokenfieldcelldelegate.md

struct NSTokenFieldCellDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTokenFieldCellDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nstokenfieldcelldelegate.md",
            availability: "macOS",
            blurb: """
            Cell-level twin of NSTokenFieldDelegate. Adopt this protocol when \
            an NSTokenFieldCell is embedded outside an NSTokenField — for \
            example, as the data cell of a custom NSTableColumn, or as a \
            cell inside an NSMatrix.

            The methods are identical in shape to NSTokenFieldDelegate, \
            with NSTokenFieldCell in the first parameter slot:

              \u{2022} Display — \
            tokenFieldCell(_:displayStringForRepresentedObject:), \
            tokenFieldCell(_:styleForRepresentedObject:).
              \u{2022} Editing — \
            tokenFieldCell(_:editingStringForRepresentedObject:), \
            tokenFieldCell(_:representedObjectForEditing:), \
            tokenFieldCell(_:shouldAdd:at:), \
            tokenFieldCell(_:completionsForSubstring:indexOfToken:indexOfSelectedItem:).
              \u{2022} Pasteboard — \
            tokenFieldCell(_:writeRepresentedObjects:to:), \
            tokenFieldCell(_:readFrom:).
              \u{2022} Menus — \
            tokenFieldCell(_:hasMenuForRepresentedObject:), \
            tokenFieldCell(_:menuForRepresentedObject:).
            """,
            signatures: [
                "protocol NSTokenFieldCellDelegate : NSObjectProtocol",
                "func tokenFieldCell(_ cell: NSTokenFieldCell, displayStringForRepresentedObject obj: Any) -> String?",
                "func tokenFieldCell(_ cell: NSTokenFieldCell, editingStringForRepresentedObject obj: Any) -> String?",
                "func tokenFieldCell(_ cell: NSTokenFieldCell, representedObjectForEditing editingString: String) -> Any?",
                "func tokenFieldCell(_ cell: NSTokenFieldCell, styleForRepresentedObject obj: Any) -> NSTokenField.TokenStyle",
                "func tokenFieldCell(_ cell: NSTokenFieldCell, shouldAdd tokens: [Any], at index: Int) -> [Any]",
                "func tokenFieldCell(_ cell: NSTokenFieldCell, writeRepresentedObjects objects: [Any], to pboard: NSPasteboard) -> Bool"
            ],
            notes: [
                "For the standalone NSTokenField control, NSTokenFieldDelegate is the protocol you implement — its methods route through the wrapping control rather than the bare cell.",
                "Behavior is identical to NSTokenFieldDelegate: only the receiver type changes. A single object can adopt both protocols if you need to handle the cell in some places and the control in others.",
                "shouldAdd:at: and completionsForSubstring:… serve the same roles as on the control protocol — token validation and autocomplete suggestions, respectively."
            ]
        )
    }
}

#Preview {
    NSTokenFieldCellDelegateDescribePage().frame(width: 900, height: 700)
}
