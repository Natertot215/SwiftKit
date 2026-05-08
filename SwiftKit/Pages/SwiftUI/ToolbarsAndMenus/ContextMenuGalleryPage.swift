import SwiftUI

/// Gallery page scaffold for ContextMenu. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ContextMenuGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "contextMenu(menuItems:)", api: nil) { Color.clear }
            VariantTile(name: "contextMenu(menuItems:preview:)", api: nil) { Color.clear }
            VariantTile(name: "contextMenu(forSelectionType:menu:primaryAction:)", api: nil) { Color.clear }
            VariantTile(name: "ContextMenu", api: nil) { Color.clear }
            VariantTile(name: "Divider", api: nil) { Color.clear }
        }
    }
}

extension ContextMenuGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.toolbarsAndMenus.contextMenu",
        title: "ContextMenu",
        folder: "Toolbars and Menus",
        framework: .swiftUI,
        absorbedSymbols: ["ContextMenu", "contextMenu"],
        blurb: "ContextMenu — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ContextMenuGalleryPage()) }
    )
}
