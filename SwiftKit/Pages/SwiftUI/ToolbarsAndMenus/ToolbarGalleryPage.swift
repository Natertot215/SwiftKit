import SwiftUI

/// Gallery page scaffold for Toolbar. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ToolbarGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "ToolbarItem", api: nil) { Color.clear }
            VariantTile(name: "ToolbarItemGroup", api: nil) { Color.clear }
            VariantTile(name: "ToolbarItemPlacement", api: nil) { Color.clear }
            VariantTile(name: "ToolbarPlacement", api: nil) { Color.clear }
            VariantTile(name: "ToolbarContentBuilder", api: nil) { Color.clear }
            VariantTile(name: "ToolbarContent", api: nil) { Color.clear }
            VariantTile(name: "CustomizableToolbarContent", api: nil) { Color.clear }
            VariantTile(name: "ToolbarCustomizationBehavior", api: nil) { Color.clear }
            VariantTile(name: "ToolbarCustomizationOptions", api: nil) { Color.clear }
            VariantTile(name: "ToolbarRole", api: nil) { Color.clear }
            VariantTile(name: "ToolbarDefaultItemKind", api: nil) { Color.clear }
            VariantTile(name: "DefaultToolbarItem", api: nil) { Color.clear }
            VariantTile(name: "ToolbarTitleMenu", api: nil) { Color.clear }
            VariantTile(name: "ToolbarSpacer", api: nil) { Color.clear }
            VariantTile(name: "ToolbarLabelStyle", api: nil) { Color.clear }
            VariantTile(name: "SpacerSizing", api: nil) { Color.clear }
            VariantTile(name: "SearchToolbarBehavior", api: nil) { Color.clear }
            VariantTile(name: "OrnamentAttachmentAnchor", api: nil) { Color.clear }
            VariantTile(name: "ContentToolbarPlacement", api: nil) { Color.clear }
            VariantTile(name: "toolbar(content:)", api: nil) { Color.clear }
            VariantTile(name: "toolbar(_:for:)", api: nil) { Color.clear }
            VariantTile(name: "toolbar(removing:)", api: nil) { Color.clear }
            VariantTile(name: "toolbar(id:content:)", api: nil) { Color.clear }
            VariantTile(name: "toolbarBackground(_:for:)", api: nil) { Color.clear }
            VariantTile(name: "toolbarBackgroundVisibility(_:for:)", api: nil) { Color.clear }
            VariantTile(name: "toolbarColorScheme(_:for:)", api: nil) { Color.clear }
            VariantTile(name: "toolbarForegroundStyle(_:for:)", api: nil) { Color.clear }
            VariantTile(name: "toolbarRole(_:)", api: nil) { Color.clear }
            VariantTile(name: "toolbarTitleDisplayMode(_:)", api: nil) { Color.clear }
            VariantTile(name: "toolbarTitleMenu(content:)", api: nil) { Color.clear }
            VariantTile(name: "toolbarVisibility(_:for:)", api: nil) { Color.clear }
            VariantTile(name: "ornament(visibility:attachmentAnchor:contentAlignment:ornament:)", api: nil) { Color.clear }
        }
    }
}

extension ToolbarGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.toolbarsAndMenus.toolbar",
        title: "Toolbar",
        folder: "Toolbars and Menus",
        framework: .swiftUI,
        absorbedSymbols: ["Toolbar", "ToolbarItem", "ToolbarItemGroup", "ToolbarItemPlacement"],
        blurb: "Toolbar — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ToolbarGalleryPage()) }
    )
}
