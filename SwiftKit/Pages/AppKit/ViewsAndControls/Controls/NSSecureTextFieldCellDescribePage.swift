import SwiftUI

// Describe-track page for NSSecureTextFieldCell.
// Source: Documentation/AppKit/views-and-controls/nssecuretextfieldcell.md

struct NSSecureTextFieldCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSSecureTextFieldCell",
            docPath: "Documentation/AppKit/views-and-controls/nssecuretextfieldcell.md",
            availability: "macOS",
            blurb: """
            The NSCell subclass that NSSecureTextField uses to render and \
            manage its UI. NSSecureTextFieldCell overrides the general cell \
            use of the field editor to provide its own field editor that \
            doesn't display text or allow the user to cut or copy its value.

            The cell adds one configuration property on top of \
            NSTextFieldCell:

              \u{2022} echosBullets — Bool that controls whether the field \
            renders a bullet (\u{2022}) for each typed character. Default is \
            true. Setting false leaves the field visually empty as the user \
            types — only the cursor advances.
            """,
            signatures: [
                "class NSSecureTextFieldCell : NSTextFieldCell",
                "var echosBullets: Bool"
            ],
            notes: [
                "Inherits NSTextFieldCell. Every property documented on the parent (textColor, backgroundColor, placeholderString, etc.) applies here too.",
                "The custom field editor is the load-bearing security feature: it suppresses cut and copy menu items and clipboard interaction. paste still works.",
                "Reach for the cell directly when you need to flip echosBullets on the wrapping control: (field.cell as? NSSecureTextFieldCell)?.echosBullets = false."
            ]
        )
    }
}

#Preview {
    NSSecureTextFieldCellDescribePage().frame(width: 900, height: 700)
}
