import SwiftUI

/// Gallery page scaffold for Menu. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct MenuGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Menu", api: nil) { Color.clear }
            VariantTile(name: "MenuStyle", api: nil) { Color.clear }
            VariantTile(name: "MenuStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "menuStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "menuIndicator(_:)", api: nil) { Color.clear }
            VariantTile(name: "menuActionDismissBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "menuOrder(_:)", api: nil) { Color.clear }
            VariantTile(name: "MenuActionDismissBehavior", api: nil) { Color.clear }
            VariantTile(name: "MenuOrder", api: nil) { Color.clear }
            VariantTile(name: "MenuButton", api: nil) { Color.clear }
            VariantTile(name: "ShareLink", api: nil) { Color.clear }
            VariantTile(name: "SharePreview", api: nil) { Color.clear }
            VariantTile(name: "Link", api: nil) { Color.clear }
            VariantTile(name: "TextFieldLink", api: nil) { Color.clear }
            VariantTile(name: "SensoryFeedback", api: nil) { Color.clear }
            VariantTile(name: "controlSize(_:)", api: nil) { Color.clear }
            VariantTile(name: "ControlSize", api: nil) { Color.clear }
        }
    }
}

extension MenuGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controls.menu",
        title: "Menu",
        folder: "Controls",
        framework: .swiftUI,
        absorbedSymbols: ["Menu", "MenuStyle", "MenuStyleConfiguration"],
        blurb: "Menu — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(MenuGalleryPage()) }
    )
}
