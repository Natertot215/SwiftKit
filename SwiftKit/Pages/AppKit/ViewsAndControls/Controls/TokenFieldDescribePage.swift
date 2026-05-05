import SwiftUI

// Article-style describe page for the "Token Field" doc collection.
// Source: Documentation/AppKit/views-and-controls/token-field.md

struct TokenFieldDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Token Field",
            docPath: "Documentation/AppKit/views-and-controls/token-field.md",
            availability: "macOS",
            blurb: """
            Provide a text field whose text can be rendered in a visually \
            distinct way so that users can recognize portions more easily. \
            The canonical example is the "To:" field in Mail.app, where each \
            email address becomes a rounded "token" pill.

            AppKit groups four APIs under this collection:

              \u{2022} NSTokenField — the rendered NSControl. Inherits \
            NSTextField; everything you know about NSTextField applies.
              \u{2022} NSTokenFieldDelegate — translate represented objects \
            to display strings, configure rounded vs plain token style, \
            handle pasteboard reads/writes, supply context menus per token.
              \u{2022} NSTokenFieldCell — the cell behind NSTokenField; \
            owns tokenStyle and the tokenizing character set.
              \u{2022} NSTokenFieldCellDelegate — cell-level twin of \
            NSTokenFieldDelegate, used when the cell is embedded outside an \
            NSTokenField.

            The renderable surface lives on the NSTokenField page.
            """,
            signatures: [
                "Documentation/AppKit/views-and-controls/token-field (collection)",
                "View: NSTokenField",
                "Management: NSTokenFieldDelegate",
                "Cells: NSTokenFieldCell, NSTokenFieldCellDelegate"
            ],
            notes: [
                "Tokens form when the user types a tokenizing character (default: comma + newline) or hits Return. The objectValue array is what your model stores — strings or any object you can map to a display string via the delegate.",
                "Three token styles: .default, .rounded (the Mail.app pill), .plainSquared (no rounding). Configure via NSTokenField.tokenStyle.",
                "Pasteboard interop is delegate-driven: tokenField(_:writeRepresentedObjects:to:) on copy / drag, tokenField(_:readFrom:) on paste / drop."
            ]
        )
    }
}

#Preview {
    TokenFieldDescribePage().frame(width: 900, height: 700)
}
