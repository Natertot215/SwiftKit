import SwiftUI

struct NSToolbarPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension NSToolbarPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.viewsAndControls.nsToolbar",
        title: "NSToolbar",
        folder: "Views and controls",
        framework: .appKit,
        absorbedSymbols: [
            "NSToolbar",
            "NSToolbarItem",
            "NSToolbarItemGroup",
            "NSToolbarItemValidation",
            "NSToolbarItemGroup.ControlRepresentation",
            "NSToolbarItemGroup.SelectionMode",
            "NSMenuToolbarItem",
            "NSSearchToolbarItem",
            "NSTrackingSeparatorToolbarItem",
            "NSCloudSharingValidation",
            "NSToolbarItem.Identifier.writingToolsItemIdentifier",
            "AppKit.Toolbar",
            "Integrating a Toolbar and Touch Bar into Your App"
        ],
        blurb: "A control that supplies a configurable row of items along the top of a window, including buttons, menu items, search fields, and group containers.",
        signature: "class NSToolbar : NSObject",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/views-and-controls/nstoolbar.md",
        page: { AnyView(NSToolbarPage()) }
    )
}

#Preview {
    NSToolbarPage()
        .frame(width: 900, height: 700)
}
