import SwiftUI

// Describe-track page for NSTokenFieldCell.
// Source: Documentation/AppKit/views-and-controls/nstokenfieldcell.md

struct NSTokenFieldCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTokenFieldCell",
            docPath: "Documentation/AppKit/views-and-controls/nstokenfieldcell.md",
            availability: "macOS",
            blurb: """
            The NSCell subclass that NSTokenField uses to render and manage \
            tokenized editing of an array of objects (similar to the address \
            field in Mail). Every NSTokenField property is a cover that \
            forwards to NSTokenFieldCell — you reach for the cell directly \
            only when embedding token-field behavior inside another \
            cell-based surface (an NSMatrix, a custom NSTableColumn data \
            cell, etc.).

            Cell-level configuration mirrors the control:

              \u{2022} tokenStyle — .default / .rounded / .plainSquared.
              \u{2022} tokenizingCharacterSet — characters that finalize a \
            token (default: comma + newline). Add space to split on \
            whitespace.
              \u{2022} defaultTokenizingCharacterSet — class property; what \
            AppKit uses when you haven't set tokenizingCharacterSet.
              \u{2022} completionDelay / defaultCompletionDelay — debounce on \
            the autocomplete trigger.
              \u{2022} delegate — NSTokenFieldCellDelegate, the cell-level twin \
            of NSTokenFieldDelegate.
            """,
            signatures: [
                "class NSTokenFieldCell : NSTextFieldCell",
                "var tokenStyle: NSTokenField.TokenStyle",
                "var tokenizingCharacterSet: CharacterSet",
                "class var defaultTokenizingCharacterSet: CharacterSet",
                "var completionDelay: TimeInterval",
                "class var defaultCompletionDelay: TimeInterval",
                "weak var delegate: NSTokenFieldCellDelegate?"
            ],
            notes: [
                "Inherits NSTextFieldCell — the cell-level equivalent of NSTokenField inheriting NSTextField.",
                "Settings on the cell affect every NSTokenField that uses it. For app-wide consistency, override defaultTokenizingCharacterSet on a subclass and supply that subclass to all your token fields.",
                "The renderable surface lives on the NSTokenField page — that's where you instantiate the wrapping control."
            ]
        )
    }
}

#Preview {
    NSTokenFieldCellDescribePage().frame(width: 900, height: 700)
}
