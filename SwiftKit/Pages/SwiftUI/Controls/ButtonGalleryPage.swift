import SwiftUI

/// Gallery page scaffold for Button. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ButtonGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Button", api: nil) { Color.clear }
            VariantTile(name: "ButtonRole", api: nil) { Color.clear }
            VariantTile(name: "ButtonBorderShape", api: nil) { Color.clear }
            VariantTile(name: "ButtonRepeatBehavior", api: nil) { Color.clear }
            VariantTile(name: "ButtonSizing", api: nil) { Color.clear }
            VariantTile(name: "DefaultButtonLabel", api: nil) { Color.clear }
            VariantTile(name: "EditButton", api: nil) { Color.clear }
            VariantTile(name: "HelpLink", api: nil) { Color.clear }
            VariantTile(name: "PasteButton", api: nil) { Color.clear }
            VariantTile(name: "buttonStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "buttonBorderShape(_:)", api: nil) { Color.clear }
            VariantTile(name: "buttonRepeatBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "ButtonStyle", api: nil) { Color.clear }
            VariantTile(name: "PrimitiveButtonStyle", api: nil) { Color.clear }
            VariantTile(name: "ButtonStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "PrimitiveButtonStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "GlassButtonStyle", api: nil) { Color.clear }
            VariantTile(name: "GlassProminentButtonStyle", api: nil) { Color.clear }
        }
    }
}

extension ButtonGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controls.button",
        title: "Button",
        folder: "Controls",
        framework: .swiftUI,
        absorbedSymbols: ["Button", "ButtonBorderShape", "ButtonRole"],
        blurb: "Button — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ButtonGalleryPage()) }
    )
}
