import SwiftUI

/// Gallery page scaffold for Gradient. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct GradientGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Gradient", api: nil) { Color.clear }
            VariantTile(name: "AnyGradient", api: nil) { Color.clear }
            VariantTile(name: "LinearGradient", api: nil) { Color.clear }
            VariantTile(name: "RadialGradient", api: nil) { Color.clear }
            VariantTile(name: "AngularGradient", api: nil) { Color.clear }
            VariantTile(name: "MeshGradient", api: nil) { Color.clear }
            VariantTile(name: "Glass", api: nil) { Color.clear }
            VariantTile(name: "ShadowStyle", api: nil) { Color.clear }
            VariantTile(name: "ShapeStyle", api: nil) { Color.clear }
            VariantTile(name: "AnyShapeStyle", api: nil) { Color.clear }
            VariantTile(name: "Color", api: nil) { Color.clear }
            VariantTile(name: "ColorMatrix", api: nil) { Color.clear }
            VariantTile(name: "ColorRenderingMode", api: nil) { Color.clear }
            VariantTile(name: "BlendMode", api: nil) { Color.clear }
            VariantTile(name: "foregroundStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "backgroundStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "tint(_:)", api: nil) { Color.clear }
        }
    }
}

extension GradientGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.imagesAndShapes.gradient",
        title: "Gradient",
        folder: "Images and Shapes",
        framework: .swiftUI,
        absorbedSymbols: ["AngularGradient", "AnyGradient", "Gradient", "LinearGradient", "MeshGradient", "RadialGradient"],
        blurb: "Gradient — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(GradientGalleryPage()) }
    )
}
