import SwiftUI

/// Gallery page scaffold for Custom Layout. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct CustomLayoutGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Layout", api: nil) { Color.clear }
            VariantTile(name: "AnyLayout", api: nil) { Color.clear }
            VariantTile(name: "LayoutProperties", api: nil) { Color.clear }
            VariantTile(name: "LayoutSubview", api: nil) { Color.clear }
            VariantTile(name: "LayoutSubviews", api: nil) { Color.clear }
            VariantTile(name: "LayoutValueKey", api: nil) { Color.clear }
            VariantTile(name: "ProposedViewSize", api: nil) { Color.clear }
            VariantTile(name: "ViewSpacing", api: nil) { Color.clear }
            VariantTile(name: "HStackLayout", api: nil) { Color.clear }
            VariantTile(name: "VStackLayout", api: nil) { Color.clear }
            VariantTile(name: "ZStackLayout", api: nil) { Color.clear }
            VariantTile(name: "GridLayout", api: nil) { Color.clear }
            VariantTile(name: "layoutValue(key:value:)", api: nil) { Color.clear }
        }
    }
}

extension CustomLayoutGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.customLayout",
        title: "Custom Layout",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: ["AnyLayout", "CustomLayout", "Layout", "LayoutProperties"],
        blurb: "Custom Layout — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(CustomLayoutGalleryPage()) }
    )
}
