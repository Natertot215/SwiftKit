import SwiftUI

/// Gallery page scaffold for Image. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ImageGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Image", api: nil) { Color.clear }
            VariantTile(name: "AsyncImage", api: nil) { Color.clear }
            VariantTile(name: "AsyncImagePhase", api: nil) { Color.clear }
            VariantTile(name: "Image.Orientation", api: nil) { Color.clear }
            VariantTile(name: "Image.ResizingMode", api: nil) { Color.clear }
            VariantTile(name: "Image.Scale", api: nil) { Color.clear }
            VariantTile(name: "ImageRenderer", api: nil) { Color.clear }
            VariantTile(name: "imageScale(_:)", api: nil) { Color.clear }
            VariantTile(name: "symbolEffect(_:options:isActive:)", api: nil) { Color.clear }
            VariantTile(name: "symbolEffect(_:options:value:)", api: nil) { Color.clear }
            VariantTile(name: "symbolEffectsRemoved(_:)", api: nil) { Color.clear }
            VariantTile(name: "symbolRenderingMode(_:)", api: nil) { Color.clear }
            VariantTile(name: "symbolVariant(_:)", api: nil) { Color.clear }
            VariantTile(name: "SymbolRenderingMode", api: nil) { Color.clear }
            VariantTile(name: "SymbolColorRenderingMode", api: nil) { Color.clear }
            VariantTile(name: "SymbolVariants", api: nil) { Color.clear }
            VariantTile(name: "SymbolVariableValueMode", api: nil) { Color.clear }
            VariantTile(name: "SymbolEffectTransition", api: nil) { Color.clear }
        }
    }
}

extension ImageGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.imagesAndShapes.image",
        title: "Image",
        folder: "Images and Shapes",
        framework: .swiftUI,
        absorbedSymbols: ["AsyncImage", "AsyncImagePhase", "Image"],
        blurb: "Image — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ImageGalleryPage()) }
    )
}
