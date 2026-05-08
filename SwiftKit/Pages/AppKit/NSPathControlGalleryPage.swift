import SwiftUI
import AppKit

struct NSPathControlGalleryPage: View {
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
                name: "NSPathControl",
                api: "let path = NSPathControl(); path.url = URL(fileURLWithPath: \"/Users/…\")",
                height: 60
            ) {
                NSPathControlRepresentable(style: .standard)
                    .frame(maxWidth: .infinity)
            }

            VariantTile(
                name: "NSPathControl.Style",
                api: "path.pathStyle = .popUp  // .standard | .popUp | .navigationBar",
                height: 60
            ) {
                NSPathControlRepresentable(style: .popUp)
                    .frame(maxWidth: .infinity)
            }

            // MARK: Reference tiles

            ReferenceTile(
                name: "NSPathControlDelegate",
                signature: "protocol NSPathControlDelegate : NSObjectProtocol",
                note: "Customize drag-and-drop acceptance and validate URLs before the control commits a new path. Implement pathControl(_:acceptDrop:) and pathControl(_:validateDrop:) as needed."
            )

            ReferenceTile(
                name: "NSPathCell",
                signature: "@MainActor class NSPathCell : NSActionCell",
                note: "The cell NSPathControl uses internally to draw and handle interaction. Exposed for subclassing; for most cases interact with NSPathControl directly via its cover methods."
            )

            ReferenceTile(
                name: "NSPathCellDelegate",
                signature: "protocol NSPathCellDelegate : NSObjectProtocol",
                note: "Customize the Open panel or pop-up menu before it's presented. Implement pathCell(_:willPopUpMenu:) to modify menu items, or pathCell(_:willDisplayOpenPanel:) to configure the panel."
            )

            ReferenceTile(
                name: "NSPathComponentCell",
                signature: "@MainActor class NSPathComponentCell : NSTextFieldCell",
                note: "Represents one path segment inside NSPathCell. Each segment has a URL, title, and optional icon image. Access via pathComponentCells() on NSPathControl."
            )

            ReferenceTile(
                name: "NSPathControlItem",
                signature: "@MainActor class NSPathControlItem : NSObject",
                note: "The item-based counterpart to NSPathComponentCell. Build the path by assigning an array of NSPathControlItem instances to NSPathControl.pathItems."
            )
        }
    }
}

extension NSPathControlGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsPathControl.nsPathControl",
        title: "NSPathControl",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSPathControl", "NSPathControl.Style", "NSPathControlDelegate", "NSPathCell", "NSPathCellDelegate", "NSPathComponentCell", "NSPathControlItem"],
        blurb: "A display of a file system path or virtual path information.",
        signature: "@MainActor class NSPathControl : NSControl",
        availability: "macOS 10.5+",
        docPath: "Documentation/AppKit/views-and-controls/nspathcontrol.md",
        page: { AnyView(NSPathControlGalleryPage()) }
    )
}

// MARK: - NSViewRepresentable bridge

private struct NSPathControlRepresentable: NSViewRepresentable {
    let style: NSPathControl.Style

    func makeNSView(context: Context) -> NSPathControl {
        let control = NSPathControl()
        control.pathStyle = style
        control.url = URL(fileURLWithPath: "/Users/Nathan/Documents/Projects/SwiftKit")
        control.isEditable = false
        return control
    }

    func updateNSView(_ nsView: NSPathControl, context: Context) {
        nsView.pathStyle = style
    }
}
