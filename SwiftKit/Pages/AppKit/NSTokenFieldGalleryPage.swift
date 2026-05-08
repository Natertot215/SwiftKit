import SwiftUI
import AppKit

struct NSTokenFieldGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Style variants — live renders

            VariantTile(
                name: "NSTokenField",
                api: "let field = NSTokenField(); field.objectValue = [\"Swift\", \"AppKit\", \"macOS\"]",
                height: 60
            ) {
                NSTokenFieldRepresentable(style: .default)
                    .frame(maxWidth: .infinity)
            }

            VariantTile(
                name: "NSTokenField.TokenStyle",
                api: "field.tokenStyle = .rounded  // .default | .none | .plainSquared | .rounded",
                height: 60
            ) {
                NSTokenFieldRepresentable(style: .rounded)
                    .frame(maxWidth: .infinity)
            }

            // MARK: Reference tiles

            ReferenceTile(
                name: "NSTokenFieldDelegate",
                signature: "protocol NSTokenFieldDelegate : NSTextFieldDelegate",
                note: "Control tokenization behavior — provide completions, display strings, and represented objects. Implement tokenField(_:completionsForSubstring:indexOfToken:tokenIndex:) to offer completion suggestions as the user types."
            )

            ReferenceTile(
                name: "NSTokenFieldCell",
                signature: "@MainActor class NSTokenFieldCell : NSTextFieldCell",
                note: "Implements much of NSTokenField's functionality. NSTokenField provides cover methods for most NSTokenFieldCell APIs. Access directly when embedding in an NSMatrix."
            )

            ReferenceTile(
                name: "NSTokenFieldCellDelegate",
                signature: "protocol NSTokenFieldCellDelegate : NSObjectProtocol",
                note: "Mirror of NSTokenFieldDelegate for cell-level tokenized-string work. Used when embedding NSTokenFieldCell directly in an NSMatrix rather than via the NSTokenField cover class."
            )
        }
    }
}

extension NSTokenFieldGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsTokenField.nsTokenField",
        title: "NSTokenField",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSTokenField", "NSTokenField.TokenStyle", "NSTokenFieldDelegate", "NSTokenFieldCell", "NSTokenFieldCellDelegate"],
        blurb: "A text field that converts text into visually distinct tokens.",
        signature: "@MainActor class NSTokenField : NSTextField",
        availability: "macOS 10.4+",
        docPath: "Documentation/AppKit/views-and-controls/nstokenfield.md",
        page: { AnyView(NSTokenFieldGalleryPage()) }
    )
}

// MARK: - NSViewRepresentable bridge

private struct NSTokenFieldRepresentable: NSViewRepresentable {
    let style: NSTokenField.TokenStyle

    func makeNSView(context: Context) -> NSTokenField {
        let field = NSTokenField()
        field.tokenStyle = style
        field.objectValue = ["Swift", "AppKit", "macOS", "Xcode"]
        field.isEditable = false
        field.isBezeled = true
        return field
    }

    func updateNSView(_ nsView: NSTokenField, context: Context) {
        nsView.tokenStyle = style
    }
}
